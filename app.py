from flask import Flask, render_template, request, url_for, redirect, session, jsonify
from flask_login import LoginManager, login_user, login_required, current_user, logout_user
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Message, Mail
from flask_caching import Cache
import settings, random, re, threading
from utils import PaperCrawler, PatentCrawler, ProjectCrawler, MyTimer, split_words
from dateutil.parser import parse
from datetime import datetime

app = Flask(__name__)
app.config.from_object(settings)

# 数据库
db = SQLAlchemy(app)
from models import *

# 邮件
mail = Mail(app)

# 缓存
cache = Cache(app)

# 会话管理
login_manager = LoginManager()
# 绑定登陆视图的路由
login_manager.login_view = "login"
login_manager.login_message = "请您先登陆！"
login_manager.session_protection = "strong"
app.config["SECRET_KEY"] = "123456"
login_manager.init_app(app)


# 根据models里面的模型创建数据库表
# @app.before_first_request
# def create_tables():
#     db.drop_all()
#     db.create_all()


@login_manager.user_loader
def load_user(user_id):
    return User.query.filter_by(user_id=user_id).first()


@app.route('/login', methods=["GET", "POST"])
@app.route('/', methods=["GET", "POST"])
def login():
    if request.method == "GET":
        return render_template("login.html")
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        # 判断使用邮箱号还是账号登录
        if '@' in username:
            user = User.query.filter(User.email == username).first()
        else:
            user = User.query.filter(User.user_id == username).first()
        # 登陆成功
        if user and user.check_password(password):
            login_user(user)
            return redirect(url_for("index"))
        # 登录失败
        else:
            msg = "用户名或密码错误"
            return render_template("login.html", msg=msg)


@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))


@app.route('/register', methods=["GET", "POST"])
def register():
    if request.method == "GET":
        return render_template("sign_up.html")
    if request.method == "POST":
        email = request.form.get("email")
        password = request.form.get("password")
        password_confirmation = request.form.get("password_confirmation")
        name = request.form.get("username")
        title = request.form.get("title")
        province1 = request.form.get("province1")
        city1 = request.form.get("city1")
        district1 = request.form.get("district1")
        address1 = request.form.get("address1")
        province2 = request.form.get("province2")
        city2 = request.form.get("city2")
        district2 = request.form.get("district2")
        address2 = request.form.get("address2")
        verification = request.form.get("verification")
        # 判断邮箱是否使用过
        info = Info.query.filter(Info.email == email).first()
        if info is not None:
            error = "邮箱已被注册，请更换邮箱后重试！"
            return render_template("sign_up.html", error=error)
        else:
            # 判断两次密码是否一致
            if password != password_confirmation:
                error = "两次密码不一致，请重新注册！"
                return render_template("sign_up.html", error=error)
            else:
                # 判断通讯地址是否存在
                if province1 == "" or city1 == "" or district1 == "":
                    error = "请选择所在地区！"
                    return render_template("sign_up.html", error=error)
                elif district2 != "" and (province2 == "" or city2 == "" or district2 == ""):
                    error = "通讯地址2未选择所在地区!"
                    return render_template("sign_up.html", error=error)
                elif district2 == "" and (province2 != "" or city2 != "" or district2 != ""):
                    error = "通讯地址2未填写完整!"
                    return render_template("sign_up.html", error=error)
                else:
                    # 判断验证码是否正确
                    if cache.get(email) is None or cache.get(email) != verification:
                        error = "验证码错误，请重试！"
                        return render_template("sign_up.html", error=error)
                    else:
                        # 存储用户登录信息
                        user = User(email, name, password)
                        db.session.add(user)
                        db.session.commit()
                        # 设置用户的编号
                        user.user_id = str(user.id + 20210000)
                        db.session.commit()
                        # 存储用户信息
                        address1_detail = province1 + city1 + district1 + address1
                        address2_detail = province2 + city2 + district2 + address2
                        user_info = Info(name, user.user_id, email, address1_detail, address2_detail, title)
                        db.session.add(user_info)
                        db.session.commit()
                        success = "注册成功！您的账号为{}，前往".format(user.user_id)
                        # 注册成功之后系统自动开始爬取信息
                        if address2 == "":
                            address1 = split_words(address1)[0]
                            threads = [threading.Thread(target=get_papers, args=(name, address1, user.user_id, "no")),
                                       threading.Thread(target=get_patents, args=(name, address1, user.user_id, "no")),
                                       threading.Thread(target=get_projects, args=(name, address1, user.user_id, "no"))]
                        else:
                            address1 = split_words(address1)[0]
                            address2 = split_words(address2)[0]
                            threads = [threading.Thread(target=get_papers, args=(name, address1, user.user_id, "no")),
                                       threading.Thread(target=get_patents, args=(name, address1, user.user_id, "no")),
                                       threading.Thread(target=get_projects, args=(name, address1, user.user_id, "no")),
                                       threading.Thread(target=get_papers, args=(name, address2, user.user_id, "no")),
                                       threading.Thread(target=get_patents, args=(name, address2, user.user_id, "no")),
                                       threading.Thread(target=get_projects, args=(name, address2, user.user_id, "no"))]
                        for thread in threads:
                            thread.start()
                        return render_template("sign_up.html", success=success)


# 发送验证码
@app.route("/captcha", methods=["GET", "POST"])
def captcha():
    if request.method == "POST":
        # 获取邮箱
        email_data = request.get_json()
        email_account = email_data["email"]
        info = Info.query.filter(Info.email == email_account).first()
        # 判断邮箱是否已经注册过
        if info is not None:
            data = "邮箱已被注册，请更换邮箱后重试！"
        else:
            # 判断邮箱是否合法
            if re.match("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$", email_account) is None:
                data = "邮箱未填写或格式不正确"
            else:
                # 生成验证码
                code_list = []
                for i in range(6):
                    random_num = random.randint(0, 9)
                    code_list.append(str(random_num))
                verification_code = ''.join(code_list)
                # 发送邮件
                message = Message('科研信息管理系统验证码', recipients=[email_account], body='您的验证码是：%s' % verification_code)
                try:
                    # 发送
                    mail.send(message)
                    # 验证码放入缓存
                    cache.set(email_account, verification_code)
                    data = "验证码发送成功"
                except:
                    data = "验证码发送失败，请检查邮箱是否输入正确"
        return jsonify(data)


@app.route("/index", methods=["GET", "POST"])
@login_required
def index():
    if request.method == "GET":
        # 专利信息统计
        # 获取所有专利信息
        patents = db.session.query(Apply, Patent).filter\
            (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
             Apply.patent_type == Patent.patent_type).with_entities(Apply.teacher_id, Apply.patent_id,
                                                                    Patent.patent_state, Patent.patent_time).all()
        # 计数
        temp_patent_count = {}
        # 构造需要返回的信息
        patent_data = [{"label": "已授权", "value": 0}, {"label": "已公开", "value": 0}, {"label": "已申请", "value": 0},
                       {"label": "已受理", "value": 0}, {"label": "已审核", "value": 0}]
        for patent in patents:
            temp_patent_count[patent[3].year] = temp_patent_count.get(patent[3].year, 0) + 1
            if patent[2] == "已授权":
                patent_data[0]["value"] += 1
            elif patent[2] == "已公开":
                patent_data[1]["value"] += 1
            elif patent[2] == "已申请":
                patent_data[2]["value"] += 1
            elif patent[2] == "已受理":
                patent_data[3]["value"] += 1
            elif patent[2] == "已审核":
                patent_data[4]["value"] += 1
        # 论文信息统计
        # 获取所有论文信息
        papers = db.session.query(Deliver, Paper).filter\
            (Deliver.teacher_id == current_user.user_id, Paper.paper_id == Deliver.paper_id).with_entities\
            (Deliver.teacher_id, Paper.paper_id, Paper.paper_time).all()
        # 按年份计数
        temp_paper_count = {}
        for paper in papers:
            temp_paper_count[paper[2].year] = temp_paper_count.get(paper[2].year, 0) + 1
        # 构造需要返回的信息
        paper_data = []
        for key, value in temp_paper_count.items():
            res_dict = {
                "year": str(key),
                "amounts": value
            }
            paper_data.append(res_dict)
        # 项目信息统计
        projects = db.session.query(Participate, Project).filter\
            (Participate.project_id == Project.project_id, Participate.teacher_id == current_user.user_id).with_entities\
            (Participate.teacher_id, Project.project_id, Project.project_time).all()
        # 按年份计数
        temp_project_count = {}
        for project in projects:
            temp_project_count[project[2].year] = temp_project_count.get(project[2].year, 0) + 1
        # 构造返回需要的信息
        project_data = []
        for key, value in temp_project_count.items():
            project_dict = {
                "year": str(key),
                "amounts": value
            }
            project_data.append(project_dict)
        # 构造总的信息
        preview = [len(patents), len(papers), len(projects)]
        increment = [temp_patent_count.get(datetime.now().year, 0), temp_paper_count.get(datetime.now().year, 0),
                     temp_project_count.get(datetime.now().year, 0)]
        return render_template("index.html", patent_data=patent_data, project_data=project_data,
                               paper_data=paper_data, preview=preview, increment=increment)


@app.route("/details", methods=["GET", "POST"])
@login_required
def details():
    # 默认显示专利信息
    if request.method == "GET":
        patent_data = db.session.query(Patent, Apply).filter(
            Apply.teacher_id == current_user.user_id, Apply.patent_type == Patent.patent_type,
            Apply.patent_id == Patent.patent_id).with_entities(Patent.id, Patent.patent_id, Patent.patent_name,
                                                               Patent.patent_type, Patent.patent_owner,
                                                               Patent.patent_time, Patent.patent_state).all()
        return render_template("details_1.html", patent_data=patent_data)
    if request.method == "POST":
        data = request.get_json()
        info_type = data["info_type"]
        info_state = data["info_state"]
        start_date = data["start_date"]
        end_date = data["end_date"]
        # 全为空或全部不合法
        if start_date == "" and end_date == "":
            date_state = 0
        # 两者全都合法
        elif start_date != "" and end_date != "":
            date_state = 1
            # 按时间先后排序
            start = parse(start_date)
            end = parse(end_date)
            start_date = start if(start < end) else end
            end_date = end if (start < end) else start
        else:
            # 截止日期合法
            if start_date == "":
                date_state = 2
                end_date = parse(end_date)
            # 开始日期合法
            else:
                date_state = 3
                start_date = parse(start_date)
        # 如果要获取专利信息
        if info_type == "专利":
            # 获取全部信息
            if info_state == "全部":
                # 日期全部不合法则显示所有信息
                if date_state == 0:
                    patents = db.session.query(Patent, Apply).filter\
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type).with_entities\
                        (Patent.id, Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_owner,
                         Patent.patent_time, Patent.patent_state).all()
                # 日期都合法
                elif date_state == 1:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_time > start_date,
                         Patent.patent_time < end_date).with_entities(Patent.id, Patent.patent_id,
                                                                      Patent.patent_name, Patent.patent_type,
                                                                      Patent.patent_owner, Patent.patent_time,
                                                                      Patent.patent_state).all()
                # 截止日期合法
                elif date_state == 2:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_time < end_date).with_entities\
                        (Patent.id, Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_owner,
                         Patent.patent_time, Patent.patent_state).all()
                # 开始日期合法
                else:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_time > start_date).with_entities\
                        (Patent.id, Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_owner,
                         Patent.patent_time, Patent.patent_state).all()
            # 获取某个状态的专利信息
            else:
                # 日期都不合法显示所有信息
                if date_state == 0:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_state == info_state).with_entities\
                        (Patent.id, Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_owner,
                         Patent.patent_time, Patent.patent_state).all()
                # 日期全部合法
                elif date_state == 1:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_state == info_state,
                         Patent.patent_time > start_date, Patent.patent_time < end_date).with_entities\
                        (Patent.id, Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_owner,
                         Patent.patent_time, Patent.patent_state).all()
                # 截止日期合法
                elif date_state == 2:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_state == info_state,
                         Patent.patent_time < end_date).with_entities(Patent.id, Patent.patent_id, Patent.patent_name,
                                                                      Patent.patent_type, Patent.patent_owner,
                                                                      Patent.patent_time, Patent.patent_state).all()
                # 开始日期合法
                else:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_state == info_state,
                         Patent.patent_time > start_date).with_entities(Patent.id, Patent.patent_id, Patent.patent_name,
                                                                        Patent.patent_type, Patent.patent_owner,
                                                                        Patent.patent_time, Patent.patent_state).all()
            show_html = ''
            for patent in patents:
                show_html += '<tr><td><div class="custom-control custom-checkbox"><input class="custom-control-input" '\
                             'type="checkbox" id="' + str(patent[0]) + '"><label class="custom-control-label" for="'\
                             + str(patent[0]) + '"></label></div></td><td>' + patent[1] + '</td><td>' + patent[2] + \
                             '</td><td>' + patent[3] + '</td><td>' + patent[4] + '</td><td>' + \
                             patent[5].strftime('%Y-%m-%d') + '</td><td>'
                if patent[6] == "已公开":
                    show_html += '<span class="badge badge-success">' + patent[6] + '</span></td>' + '</tr>'
                if patent[6] == "已授权":
                    show_html += '<span class="badge badge-info">' + patent[6] + '</span></td>' + '</tr>'
                if patent[6] == "已申请":
                    show_html += '<span class="badge badge-primary">' + patent[6] + '</span></td>' + '</tr>'
                if patent[6] == "已受理":
                    show_html += '<span class="badge badge-secondary">' + patent[6] + '</span></td>' + '</tr>'
                if patent[6] == "已审核":
                    show_html += '<span class="badge badge-warning">' + patent[6] + '</span></td>' + '</tr>'
            table_data = {
                "type": 0,
                "html": show_html
            }
            return jsonify(table_data)
        # 获取论文信息
        elif info_type == "论文":
            if info_state == "全部":
                # 日期全部不合法则显示所有信息
                if date_state == 0:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 日期都合法
                elif date_state == 1:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time < end_date,
                                                                     Paper.paper_time > start_date).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 截止日期合法
                elif date_state == 2:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time < end_date).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 开始日期合法
                else:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time > start_date).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
            else:
                # 日期全部不合法则显示所有信息
                if date_state == 0:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_state == info_state).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 日期都合法
                elif date_state == 1:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time < end_date,
                                                                     Paper.paper_time > start_date,
                                                                     Paper.paper_state == info_state).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 截止日期合法
                elif date_state == 2:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time < end_date,
                                                                     Paper.paper_state == info_state).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 开始日期合法
                else:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time > start_date,
                                                                     Paper.paper_state == info_state).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
            show_html = ''
            for paper in papers:
                show_html += '<tr><td><div class="custom-control custom-checkbox"><input class="custom-control-input" '\
                             'type="checkbox" id="' + str(paper[0]) + '"><label class="custom-control-label" for="'\
                             + str(paper[0]) + '"></label></div></td><td>' + paper[1] + '</td><td>' + paper[2] + \
                             '</td><td>' + paper[3] + '</td><td>' + paper[4].strftime('%Y-%m-%d') + '</td><td>' \
                             + paper[6] + '</td><td>' + str(paper[7]) + '</td><td>' + \
                             str(paper[8]) + '</td><td>' + paper[9] + '</td><td>'
                if paper[12] == "已投递":
                    show_html += '<span class="badge badge-success">' + paper[12] + '</span></td>' + '</tr>'
                if paper[12] == "已审核":
                    show_html += '<span class="badge badge-info">' + paper[12] + '</span></td>' + '</tr>'
                if paper[12] == "已发表":
                    show_html += '<span class="badge badge-primary">' + paper[12] + '</span></td>' + '</tr>'
            table_data = {
                "type": 1,
                "html": show_html
            }
            return jsonify(table_data)
        # 获取项目信息
        else:
            # 获取全部项目信息
            if info_state == "全部":
                # 日期全部不合法则显示所有信息
                if date_state == 0:
                    projects = db.session.query(Project, Participate).filter\
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id)\
                        .with_entities(Project.id, Project.project_id, Project.project_name, Project.project_source,
                                       Project.project_type, Project.project_principal, Project.project_principal_title,
                                       Project.project_time, Project.project_state).all()
                # 日期全部合法
                elif date_state == 1:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time > start_date, Project.project_time < end_date).with_entities\
                        (Project.id, Project.project_id, Project.project_name, Project.project_source,
                         Project.project_type, Project.project_principal, Project.project_principal_title,
                         Project.project_time, Project.project_state).all()
                # 截止日期合法
                elif date_state == 2:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time < end_date).with_entities(Project.id, Project.project_id,
                                                                        Project.project_name, Project.project_source,
                                                                        Project.project_type, Project.project_principal,
                                                                        Project.project_principal_title,
                                                                        Project.project_time, Project.project_state).all()
                # 开始日期合法
                else:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time > start_date).with_entities(Project.id, Project.project_id,
                                                                          Project.project_name, Project.project_source,
                                                                          Project.project_type,
                                                                          Project.project_principal,
                                                                          Project.project_principal_title,
                                                                          Project.project_time, Project.project_state).all()
            # 获取某个状态的信息
            else:
                # 日期全部不合法则显示所有信息
                if date_state == 0:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_state == info_state).with_entities\
                        (Project.id, Project.project_id, Project.project_name, Project.project_source,
                         Project.project_type, Project.project_principal, Project.project_principal_title,
                         Project.project_time, Project.project_state).all()
                # 日期全部合法
                elif date_state == 1:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time > start_date, Project.project_time < end_date, Project.project_state ==
                         info_state).with_entities(Project.id, Project.project_id, Project.project_name,
                                                   Project.project_source, Project.project_type,
                                                   Project.project_principal, Project.project_principal_title,
                                                   Project.project_time, Project.project_state).all()
                # 截止日期合法
                elif date_state == 2:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time < end_date, Project.project_state == info_state).with_entities\
                        (Project.id, Project.project_id, Project.project_name, Project.project_source,
                         Project.project_type, Project.project_principal, Project.project_principal_title,
                         Project.project_time, Project.project_state).all()
                # 开始日期合法
                else:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time > start_date, Project.project_state == info_state).with_entities\
                        (Project.id, Project.project_id, Project.project_name, Project.project_source,
                         Project.project_type, Project.project_principal, Project.project_principal_title,
                         Project.project_time, Project.project_state).all()
            show_html = ''
            for project in projects:
                show_html += '<tr><td><div class="custom-control custom-checkbox"><input class="custom-control-input" ' \
                             'type="checkbox" id="' + str(project[0]) + '"><label class="custom-control-label" for="' \
                             + str(project[0]) + '"></label></div></td><td>' + project[1] + '</td><td>' + project[2] + \
                             '</td><td>' + project[3] + '</td><td>' + project[4] + '</td><td>' + project[5] + \
                             '</td><td>' + project[6] + '</td><td>' + project[7].strftime('%Y-%m-%d') + '</td><td>'
                if project[8] == "已申请":
                    show_html += '<span class="badge badge-warning">' + project[8] + '</span></td>' + '</tr>'
                if project[8] == "已审核":
                    show_html += '<span class="badge badge-info">' + project[8] + '</span></td>' + '</tr>'
                if project[8] == "已立项":
                    show_html += '<span class="badge badge-primary">' + project[8] + '</span></td>' + '</tr>'
                if project[8] == "已结题":
                    show_html += '<span class="badge badge-success">' + project[8] + '</span></td>' + '</tr>'
            table_data = {
                "type": 2,
                "html": show_html
            }
            return jsonify(table_data)


@app.route("/patent/delete", methods=["GET", "POST"])
@login_required
def delete_patent():
    if request.method == "POST":
        data = request.get_json()["delete_number"]
        for item in data:
            if item == "select-all":
                continue
            else:
                patent_info = db.session.query(Patent).filter(Patent.id == item).with_entities(Patent.patent_id,
                                                                                               Patent.patent_type).first()
                if len(patent_info) != 0:
                    res = db.session.query(Apply).filter(current_user.user_id == Apply.teacher_id,
                                                         Apply.patent_id == patent_info[0],
                                                         Apply.patent_type == patent_info[1]).first()
                    db.session.delete(res)
                    db.session.commit()
        return ""


@app.route("/paper/delete", methods=["GET", "POST"])
def delete_paper():
    if request.method == "POST":
        data = request.get_json()["delete_number"]
        for item in data:
            if item == "select-all":
                continue
            else:
                paper_info = db.session.query(Paper).filter(Paper.id == item).with_entities(Paper.paper_id).first()
                if len(paper_info) != 0:
                    res = db.session.query(Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                           Deliver.paper_id == paper_info[0]).first()
                    db.session.delete(res)
                    db.session.commit()
        return ""


@app.route("/project/delete", methods=["GET", "POST"])
def delete_project():
    if request.method == "POST":
        data = request.get_json()["delete_number"]
        for item in data:
            if item == "select-all":
                continue
            else:
                project_info = db.session.query(Project).filter(Project.id == item).with_entities\
                    (Project.project_id).first()
                if len(project_info) != 0:
                    res = db.session.query(Participate).filter(current_user.user_id == Participate.teacher_id,
                                                               Participate.project_id == project_info[0]).first()
                    db.session.delete(res)
                    db.session.commit()
        return ""


@app.route("/update/auto", methods=["GET", "POST"])
@login_required
def update_auto():
    global timer1, timer2
    if request.method == "GET":
        return render_template("auto_update.html")
    if request.method == "POST":
        data = request.get_json()
        # interval = int(data["interval"])*24*60*60
        interval = 10
        is_inform = data["is_inform"]
        user_data = db.session.query(Info).filter(current_user.user_id == Info.user_id).with_entities(
            Info.name, Info.address1, Info.address2, Info.user_id).first()
        name = user_data[0]
        address1 = user_data[1]
        address1 = split_words(address1)[3]
        address2 = user_data[2]
        if address2 != '':
            address2 = split_words(address2)[3]
            timer1 = MyTimer(current_user.user_id, interval, update_info, (name, address1, user_data[3], is_inform))
            timer2 = MyTimer(current_user.user_id, interval, update_info, (name, address2, user_data[3], is_inform))
            # 启动定时任务
            timer1.start()
            timer2.start()
        else:
            timer1 = MyTimer(current_user.user_id, interval, update_info,
                             (interval, name, address1, user_data[3], is_inform))
            # 启动定时任务
            timer1.start()
        return jsonify("success")


@app.route("/update/manual", methods=["GET", "POST"])
@login_required
def update_manual():
    if request.method == "GET":
        patent_data = db.session.query(Patent, Apply).filter(
            Apply.teacher_id == current_user.user_id, Apply.patent_type == Patent.patent_type,
            Apply.patent_id == Patent.patent_id).with_entities(Patent.id, Patent.patent_id, Patent.patent_name,
                                                               Patent.patent_type, Patent.patent_owner,
                                                               Patent.patent_time, Patent.patent_state).all()
        return render_template("details_3.html", patent_data=patent_data)
    if request.method == "POST":
        data = request.get_json()
        info_type = data["info_type"]
        info_state = data["info_state"]
        start_date = data["start_date"]
        end_date = data["end_date"]
        # 全为空或全部不合法
        if start_date == "" and end_date == "":
            date_state = 0
        # 两者全都合法
        elif start_date != "" and end_date != "":
            date_state = 1
            # 按时间先后排序
            start = parse(start_date)
            end = parse(end_date)
            start_date = start if (start < end) else end
            end_date = end if (start < end) else start
        else:
            # 截止日期合法
            if start_date == "":
                date_state = 2
                end_date = parse(end_date)
            # 开始日期合法
            else:
                date_state = 3
                start_date = parse(start_date)
        # 如果要获取专利信息
        if info_type == "专利":
            # 获取全部信息
            if info_state == "全部":
                # 日期全部不合法则显示所有信息
                if date_state == 0:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type).with_entities \
                        (Patent.id, Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_owner,
                         Patent.patent_time, Patent.patent_state).all()
                # 日期都合法
                elif date_state == 1:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_time > start_date,
                         Patent.patent_time < end_date).with_entities(Patent.id, Patent.patent_id,
                                                                      Patent.patent_name, Patent.patent_type,
                                                                      Patent.patent_owner, Patent.patent_time,
                                                                      Patent.patent_state).all()
                # 截止日期合法
                elif date_state == 2:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_time < end_date).with_entities \
                        (Patent.id, Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_owner,
                         Patent.patent_time, Patent.patent_state).all()
                # 开始日期合法
                else:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_time > start_date).with_entities \
                        (Patent.id, Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_owner,
                         Patent.patent_time, Patent.patent_state).all()
            # 获取某个状态的专利信息
            else:
                # 日期都不合法显示所有信息
                if date_state == 0:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_state == info_state).with_entities \
                        (Patent.id, Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_owner,
                         Patent.patent_time, Patent.patent_state).all()
                # 日期全部合法
                elif date_state == 1:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_state == info_state,
                         Patent.patent_time > start_date, Patent.patent_time < end_date).with_entities \
                        (Patent.id, Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_owner,
                         Patent.patent_time, Patent.patent_state).all()
                # 截止日期合法
                elif date_state == 2:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_state == info_state,
                         Patent.patent_time < end_date).with_entities(Patent.id, Patent.patent_id, Patent.patent_name,
                                                                      Patent.patent_type, Patent.patent_owner,
                                                                      Patent.patent_time, Patent.patent_state).all()
                # 开始日期合法
                else:
                    patents = db.session.query(Patent, Apply).filter \
                        (Apply.teacher_id == current_user.user_id, Apply.patent_id == Patent.patent_id,
                         Patent.patent_type == Apply.patent_type, Patent.patent_state == info_state,
                         Patent.patent_time > start_date).with_entities(Patent.id, Patent.patent_id, Patent.patent_name,
                                                                        Patent.patent_type, Patent.patent_owner,
                                                                        Patent.patent_time, Patent.patent_state).all()
            show_html = ''
            for patent in patents:
                show_html += '<tr><td><div class="custom-control custom-checkbox"><input class="custom-control-input" ' \
                             'type="checkbox" id="' + str(patent[0]) + '"><label class="custom-control-label" for="' \
                             + str(patent[0]) + '"></label></div></td><td>' + patent[1] + '</td><td>' + patent[2] + \
                             '</td><td>' + patent[3] + '</td><td>' + patent[4] + '</td><td>' + \
                             patent[5].strftime('%Y-%m-%d') + '</td><td>'
                if patent[6] == "已公开":
                    show_html += '<span class="badge badge-success">' + patent[6] + '</span></td>' + '</tr>'
                if patent[6] == "已授权":
                    show_html += '<span class="badge badge-info">' + patent[6] + '</span></td>' + '</tr>'
                if patent[6] == "已申请":
                    show_html += '<span class="badge badge-primary">' + patent[6] + '</span></td>' + '</tr>'
                if patent[6] == "已受理":
                    show_html += '<span class="badge badge-secondary">' + patent[6] + '</span></td>' + '</tr>'
                if patent[6] == "已审核":
                    show_html += '<span class="badge badge-warning">' + patent[6] + '</span></td>' + '</tr>'
            table_data = {
                "type": 0,
                "html": show_html
            }
            return jsonify(table_data)
        # 获取论文信息
        elif info_type == "论文":
            if info_state == "全部":
                # 日期全部不合法则显示所有信息
                if date_state == 0:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 日期都合法
                elif date_state == 1:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time < end_date,
                                                                     Paper.paper_time > start_date).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 截止日期合法
                elif date_state == 2:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time < end_date).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 开始日期合法
                else:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time > start_date).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
            else:
                # 日期全部不合法则显示所有信息
                if date_state == 0:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_state == info_state).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 日期都合法
                elif date_state == 1:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time < end_date,
                                                                     Paper.paper_time > start_date,
                                                                     Paper.paper_state == info_state).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 截止日期合法
                elif date_state == 2:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time < end_date,
                                                                     Paper.paper_state == info_state).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
                # 开始日期合法
                else:
                    papers = db.session.query(Paper, Deliver).filter(current_user.user_id == Deliver.teacher_id,
                                                                     Deliver.paper_id == Paper.paper_id,
                                                                     Paper.paper_time > start_date,
                                                                     Paper.paper_state == info_state).with_entities(
                        Paper.id, Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time,
                        Paper.paper_region, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence,
                        Paper.paper_search_type, Paper.paper_press, Paper.paper_doi, Paper.paper_state).all()
            show_html = ''
            for paper in papers:
                show_html += '<tr><td><div class="custom-control custom-checkbox"><input class="custom-control-input" ' \
                             'type="checkbox" id="' + str(paper[0]) + '"><label class="custom-control-label" for="' \
                             + str(paper[0]) + '"></label></div></td><td>' + paper[1] + '</td><td>' + paper[2] + \
                             '</td><td>' + paper[3] + '</td><td>' + paper[4].strftime('%Y-%m-%d') + '</td><td>' \
                             + paper[6] + '</td><td>' + str(paper[7]) + '</td><td>' + \
                             str(paper[8]) + '</td><td>' + paper[9] + '</td><td>'
                if paper[12] == "已投递":
                    show_html += '<span class="badge badge-success">' + paper[12] + '</span></td>' + '</tr>'
                if paper[12] == "已审核":
                    show_html += '<span class="badge badge-info">' + paper[12] + '</span></td>' + '</tr>'
                if paper[12] == "已发表":
                    show_html += '<span class="badge badge-primary">' + paper[12] + '</span></td>' + '</tr>'
            table_data = {
                "type": 1,
                "html": show_html
            }
            return jsonify(table_data)
        # 获取项目信息
        else:
            # 获取全部项目信息
            if info_state == "全部":
                # 日期全部不合法则显示所有信息
                if date_state == 0:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id) \
                        .with_entities(Project.id, Project.project_id, Project.project_name, Project.project_source,
                                       Project.project_type, Project.project_principal, Project.project_principal_title,
                                       Project.project_time, Project.project_state).all()
                # 日期全部合法
                elif date_state == 1:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time > start_date, Project.project_time < end_date).with_entities \
                        (Project.id, Project.project_id, Project.project_name, Project.project_source,
                         Project.project_type, Project.project_principal, Project.project_principal_title,
                         Project.project_time, Project.project_state).all()
                # 截止日期合法
                elif date_state == 2:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time < end_date).with_entities(Project.id, Project.project_id,
                                                                        Project.project_name, Project.project_source,
                                                                        Project.project_type, Project.project_principal,
                                                                        Project.project_principal_title,
                                                                        Project.project_time,
                                                                        Project.project_state).all()
                # 开始日期合法
                else:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time > start_date).with_entities(Project.id, Project.project_id,
                                                                          Project.project_name, Project.project_source,
                                                                          Project.project_type,
                                                                          Project.project_principal,
                                                                          Project.project_principal_title,
                                                                          Project.project_time,
                                                                          Project.project_state).all()
            # 获取某个状态的信息
            else:
                # 日期全部不合法则显示所有信息
                if date_state == 0:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_state == info_state).with_entities \
                        (Project.id, Project.project_id, Project.project_name, Project.project_source,
                         Project.project_type, Project.project_principal, Project.project_principal_title,
                         Project.project_time, Project.project_state).all()
                # 日期全部合法
                elif date_state == 1:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time > start_date, Project.project_time < end_date, Project.project_state ==
                         info_state).with_entities(Project.id, Project.project_id, Project.project_name,
                                                   Project.project_source, Project.project_type,
                                                   Project.project_principal, Project.project_principal_title,
                                                   Project.project_time, Project.project_state).all()
                # 截止日期合法
                elif date_state == 2:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time < end_date, Project.project_state == info_state).with_entities \
                        (Project.id, Project.project_id, Project.project_name, Project.project_source,
                         Project.project_type, Project.project_principal, Project.project_principal_title,
                         Project.project_time, Project.project_state).all()
                # 开始日期合法
                else:
                    projects = db.session.query(Project, Participate).filter \
                        (current_user.user_id == Participate.teacher_id, Project.project_id == Participate.project_id,
                         Project.project_time > start_date, Project.project_state == info_state).with_entities \
                        (Project.id, Project.project_id, Project.project_name, Project.project_source,
                         Project.project_type, Project.project_principal, Project.project_principal_title,
                         Project.project_time, Project.project_state).all()
            show_html = ''
            for project in projects:
                show_html += '<tr><td><div class="custom-control custom-checkbox"><input class="custom-control-input" ' \
                             'type="checkbox" id="' + str(project[0]) + '"><label class="custom-control-label" for="' \
                             + str(project[0]) + '"></label></div></td><td>' + project[1] + '</td><td>' + project[2] + \
                             '</td><td>' + project[3] + '</td><td>' + project[4] + '</td><td>' + project[5] + \
                             '</td><td>' + project[6] + '</td><td>' + project[7].strftime('%Y-%m-%d') + '</td><td>'
                if project[8] == "已申请":
                    show_html += '<span class="badge badge-warning">' + project[8] + '</span></td>' + '</tr>'
                if project[8] == "已审核":
                    show_html += '<span class="badge badge-info">' + project[8] + '</span></td>' + '</tr>'
                if project[8] == "已立项":
                    show_html += '<span class="badge badge-primary">' + project[8] + '</span></td>' + '</tr>'
                if project[8] == "已结题":
                    show_html += '<span class="badge badge-success">' + project[8] + '</span></td>' + '</tr>'
            table_data = {
                "type": 2,
                "html": show_html
            }
            return jsonify(table_data)


@app.route("/modify/patent/<patent_id>", methods=["GET", "POST"])
@login_required
def modify_patent(patent_id):
    if request.method == "GET":
        patent_info = db.session.query(Patent).filter(Patent.id == patent_id).with_entities(
            Patent.patent_id, Patent.patent_name, Patent.patent_type, Patent.patent_state, Patent.patent_time,
            Patent.patent_owner).first()
        if len(patent_info) != 0:
            data = {"patent_id": patent_info[0], "patent_name": patent_info[1], "patent_type": patent_info[2],
                    "patent_state": patent_info[3], "patent_time": patent_info[4].strftime('%Y-%m-%d'),
                    "patent_owner": patent_info[5]}
        else:
            data = {"patent_id": "", "patent_name": "", "patent_type": "", "patent_state": "", "patent_time": "",
                    "patent_owner": ""}
        return render_template("modify_patent.html", patent_data=data)
    if request.method == "POST":
        data = request.get_json()
        patent_state = data["patent_state"]
        patent_info = db.session.query(Patent).filter(Patent.id == patent_id).first()
        if patent_info is not None:
            patent_info.patent_state = patent_state
            db.session.commit()
            msg = "yes"
        else:
            msg = "no"
        return jsonify(msg)


@app.route("/modify/paper/<paper_id>", methods=["GET", "POST"])
@login_required
def modify_paper(paper_id):
    if request.method == "GET":
        paper_info = db.session.query(Paper).filter(Paper.id == paper_id).with_entities(
            Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_region, Paper.paper_time,
            Paper.paper_state, Paper.paper_keywords, Paper.paper_quote, Paper.paper_influence, Paper.paper_search_type,
            Paper.paper_doi).first()
        if len(paper_info) != 0:
            data = {
                "paper_id": paper_info[0], "paper_name": paper_info[1], "paper_source": paper_info[2],
                "paper_region": paper_info[3], "paper_time": paper_info[4], "paper_state": paper_info[5],
                "paper_keywords": paper_info[6], "paper_quote": paper_info[7], "paper_influence": paper_info[8],
                "paper_search_type": paper_info[9], "paper_doi": paper_info[10]
            }
        else:
            data = {
                "paper_id": "", "paper_name": "", "paper_source": "", "paper_region": "", "paper_time": "",
                "paper_state": "", "paper_keywords": "", "paper_quote": "", "paper_influence": "",
                "paper_search_type": "", "paper_doi": ""
            }
        return render_template("modify_paper.html", paper_data=data)
    if request.method == "POST":
        data = request.get_json()
        # 获取返回的信息
        paper_state = data["paper_state"]
        paper_quote = data["paper_quote"]
        paper_influence = data["paper_influence"]
        paper_search_type = data["paper_search_type"]
        paper_press = data["paper_press"]
        paper_doi = data["paper_doi"]
        # 查询信息
        paper_info = db.session.query(Paper).filter(Paper.id == paper_id).first()
        # 修改信息
        if paper_info is not None:
            try:
                paper_info.paper_state = paper_state
                paper_info.paper_quote = paper_quote
                paper_info.paper_influence = paper_influence
                paper_info.paper_search_type = paper_search_type
                paper_info.paper_press = paper_press
                paper_info.paper_doi = paper_doi
                db.session.commit()
                msg = "yes"
            except:
                msg = "no"
        else:
            msg = "yes"
        return jsonify(msg)


@app.route("/modify/project/<project_id>", methods=["GET", "POST"])
@login_required
def modify_project(project_id):
    if request.method == "GET":
        project_info = db.session.query(Project).filter(Project.id == project_id).with_entities(
            Project.project_id, Project.project_name, Project.project_source, Project.project_type,
            Project.project_time, Project.project_state, Project.project_principal, Project.project_principal_title
        ).first()
        if len(project_info) != 0:
            data = {
                "project_id": project_info[0], "project_name": project_info[1], "project_source": project_info[2],
                "project_type": project_info[3], "project_time": project_info[4], "project_state": project_info[5],
                "project_principal": project_info[6], "project_principal_title": project_info[7]
            }
        else:
            data = {
                "project_id": "", "project_name": "", "project_source": "", "project_type": "", "project_time": "",
                "project_state": "", "project_principal": "", "project_principal_title": ""
            }
        return render_template("modify_project.html", project_data=data)
    if request.method == "POST":
        data = request.get_json()
        project_state = data["project_state"]
        project_principal_title = data["project_principal_title"]
        print(data)
        project_info = db.session.query(Project).filter(Project.id == project_id).first()
        if project_info is not None:
            project_info.project_state = project_state
            project_info.project_principal_title = project_principal_title
            db.session.commit()
            msg = "yes"
        else:
            msg = "no"
        return jsonify(msg)


def update_info(interval, name, address, user_id, inform):
    global timer1
    print("我在定时执行")
    try:
        get_papers(name, address, user_id, inform)
    except:
        try:
            get_patents(name, address, user_id, inform)
        except:
            try:
                get_projects(name, address, user_id, inform)
            except:
                timer1 = MyTimer(user_id, interval, update_info, (interval, name, address, user_id, inform))
                timer1.start()


timer1 = MyTimer("", 10, update_info)
timer2 = MyTimer("", 10, update_info)


# 获取更新论文信息
def get_papers(name, address, user_id, inform):
    print("开始获取论文信息")
    paper_crawler = PaperCrawler(name, address)
    source_data = paper_crawler.get_data()
    final_data = paper_crawler.handler_paper_items(source_data)
    new_info = "no"
    for item in final_data:
        # 获取数据
        paper_id = item["filename"]
        paper_name = item["title"]
        paper_source = item["source"]
        paper_publish_time = item["publish_time"]
        paper_publish_time = parse(paper_publish_time)
        paper_keywords = item["keywords"]
        author_rank = item["author_rank"]
        # 检查论文是否已经存在
        paper_in = db.session.query(Paper).filter(Paper.paper_id == paper_id).with_entities(
            Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time, Paper.paper_region,
            Paper.paper_keywords).all()
        # 未存在就插入
        if len(paper_in) == 0:
            paper = Paper(paper_id, paper_name, paper_source, paper_publish_time, address, paper_keywords, 0, 0, "", "",
                          "", "已发表")
            db.session.add(paper)
            db.session.commit()
            # 判断是否是新信息
            new_info = "yes"
        # 已存在就更新
        else:
            # 查找已存在的信息
            exist_data = db.session.query(Paper).filter(Paper.paper_id == paper_id).with_entities\
                (Paper.paper_id, Paper.paper_name, Paper.paper_source, Paper.paper_time, Paper.paper_region,
                 Paper.paper_keywords).first()
            # 存在一项不一样
            if exist_data[0] != paper_id or exist_data[1] != paper_name or exist_data[2] != paper_source or \
                    exist_data[3] != paper_publish_time or exist_data[4] != address or exist_data[5] != paper_keywords:
                in_data = db.session.query(Paper).filter(Paper.paper_id == paper_id).first()
                db.session.delete(in_data)
                db.session.commit()
                paper = Paper(paper_id, paper_name, paper_source, paper_publish_time, address, paper_keywords, 0, 0, "",
                              "", "", "已发表")
                db.session.add(paper)
                db.session.commit()
                new_info = "yes"
        # 检查教师论文对应信息是否存在
        deliver_in = db.session.query(Deliver).filter(Deliver.paper_id == paper_id, Deliver.teacher_id == user_id).all()
        if len(deliver_in) == 0:
            deliver = Deliver(user_id, paper_id, author_rank)
            db.session.add(deliver)
            db.session.commit()
    # 是否邮件告知
    if inform == "yes" and new_info == "yes":
        app.app_context().push()
        account = db.session.query(User).filter(User.user_id == user_id).with_entities(User.email).first()[0]
        message = Message('科研信息管理系统', recipients=[account], body='您的论文信息有更新')
        mail.send(message)
    print("论文信息获取成功")


# 获取更新专利信息
def get_patents(name, address, user_id, inform):
    print("开始获取专利信息")
    patent_crawler = PatentCrawler(name, address)
    final_data = patent_crawler.get_data()
    new_info = "no"
    for item in final_data:
        patent_id = item["patent_id"]
        patent_name = item["patent_name"]
        patent_type = item["patent_type"]
        patent_time = item["patent_time"]
        patent_time = parse(patent_time)
        inventor_rank = item["inventor_rank"]
        patent_state = '已' + patent_type[2:]
        # 检查专利是否存在
        patent_in = db.session.query(Patent).filter(Patent.patent_id == patent_id, Patent.patent_type ==
                                                    patent_type).with_entities(
            Patent.patent_id, Patent.patent_name, Patent.patent_owner, Patent.patent_time, Patent.patent_state,
            Patent.patent_type).all()
        # 不存在就加入
        if len(patent_in) == 0:
            patent = Patent(patent_id, patent_name, address, patent_time, patent_state, patent_type)
            db.session.add(patent)
            db.session.commit()
            new_info = "yes"
        # 存在就更新
        else:
            # 获取已存在的信息
            exist_data = db.session.query(Patent).filter(Patent.patent_id == patent_id, Patent.patent_type ==
                                                         patent_type).with_entities(Patent.patent_id, Patent.patent_name,
                                                                                    Patent.patent_owner,
                                                                                    Patent.patent_time,
                                                                                    Patent.patent_state,
                                                                                    Patent.patent_type).first()
            # 对比是否有不同的信息
            if exist_data[0] != patent_id or exist_data[1] != patent_name or exist_data[2] != address or \
                    exist_data[3] != patent_time or exist_data[4] != patent_state or exist_data[5] != patent_type:
                in_data = db.session.query(Patent).filter(Patent.patent_id == patent_id, Patent.patent_type ==
                                                          patent_type).first()
                db.session.delete(in_data)
                db.session.commit()
                patent_state = '已' + patent_type[2:]
                patent = Patent(patent_id, patent_name, address, patent_time, patent_state, patent_type)
                db.session.add(patent)
                db.session.commit()
                new_info = "yes"
        # 检查教师专利对应信息是否存在
        apply_in = db.session.query(Apply).filter(Apply.patent_id == patent_id, Apply.teacher_id == user_id,
                                                  Apply.patent_type == patent_type).all()
        if len(apply_in) == 0:
            apply = Apply(user_id, patent_id, patent_type, inventor_rank)
            db.session.add(apply)
            db.session.commit()
    # 是否邮件告知
    if inform == "yes" and new_info == "yes":
        app.app_context().push()
        account = db.session.query(User).filter(User.user_id == user_id).with_entities(User.email).first()[0]
        message = Message('科研信息管理系统', recipients=[account], body='您的专利信息有更新')
        mail.send(message)
    print("专利信息获取成功")


# 获取更新项目信息
def get_projects(name, address, user_id, inform):
    print("开始获取项目信息")
    project_crawler = ProjectCrawler(name, address)
    final_data = project_crawler.get_data()
    new_info = "no"
    for item in final_data:
        project_id = item["project_id"]
        project_name = item["project_name"]
        project_type = item["project_type"]
        project_source = item["project_source"]
        project_state = item["project_state"]
        project_principal = item["project_principal"]
        project_principal_title = item["project_principal_title"]
        project_time = parse(item["project_time"])
        participant_rank = item["participant_rank"]
        # 检查项目是否已存在
        project_in = db.session.query(Project).filter(Project.project_id == project_id).with_entities(
            Project.project_id, Project.project_name, Project.project_type, Project.project_source,
            Project.project_state, Project.project_principal, Project.project_principal_title, Project.project_time
        ).all()
        # 不存在就插入
        if len(project_in) == 0:
            project = Project(project_id, project_name, project_type, project_source, project_state, project_principal,
                              project_principal_title, project_time)
            db.session.add(project)
            db.session.commit()
            new_info = "yes"
        # 存在就更新
        else:
            # 获取存在的信息
            exist_data = db.session.query(Project).filter(Project.project_id == project_id).with_entities(
                Project.project_id, Project.project_name, Project.project_type, Project.project_source,
                Project.project_state, Project.project_principal, Project.project_principal_title, Project.project_time
            ).first()
            # 对比信息是否一致
            if exist_data[0] != project_id or exist_data[1] != project_name or exist_data[2] != project_type or \
                    exist_data[3] != project_source or exist_data[4] != project_state or exist_data[5] != \
                    project_principal or exist_data[6] != project_principal_title or exist_data[7] != project_time:
                # 不一致就先删除再插入
                in_data = db.session.query(Project).filter(Project.project_id == project_id).first()
                db.session.delete(in_data)
                db.session.commit()
                project = Project(project_id, project_name, project_type, project_source, project_state, project_principal,
                                  project_principal_title, project_time)
                db.session.add(project)
                db.session.commit()
                new_info = "yes"
        # 检查教师项目对应信息是否存在
        participate_in = db.session.query(Participate).filter(Participate.project_id == project_id,
                                                              Participate.teacher_id == user_id).all()
        if len(participate_in) == 0:
            participate = Participate(user_id, project_id, participant_rank)
            db.session.add(participate)
            db.session.commit()
    # 是否邮件告知
    if inform == "yes" and new_info == "yes":
        app.app_context().push()
        account = db.session.query(User).filter(User.user_id == user_id).with_entities(User.email).first()[0]
        message = Message('科研信息管理系统', recipients=[account], body='您的专利信息有更新')
        mail.send(message)
    print("获取项目信息成功")


if __name__ == '__main__':
    app.run()
