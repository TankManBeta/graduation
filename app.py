from flask import Flask, render_template, request, url_for, redirect, session, jsonify
from flask_login import LoginManager, login_user, login_required, current_user, logout_user
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Message, Mail
from flask_caching import Cache
import settings, random, re, threading
from utils import PaperCrawler, PatentCrawler
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
                        threads = [threading.Thread(target=get_papers, args=(name, address1, user.user_id)),
                                   threading.Thread(target=get_patents, args=(name, address1, user.user_id))]
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
        project_data = [{"year": "2015", "amounts": 9}, {"year": "2016", "amounts": 8}, {"year": "2017", "amounts": 7},
                        {"year": "2018", "amounts": 6}, {"year": "2019", "amounts": 5}, {"year": "2020", "amounts": 4}]
        # 构造总的信息
        preview = [len(patents), len(papers), 0]
        increment = [temp_patent_count.get(datetime.now().year, 0), temp_paper_count.get(datetime.now().year, 0), 0]
        return render_template("index.html", patent_data=patent_data, project_data=project_data,
                               paper_data=paper_data, preview=preview, increment=increment)


@app.route("/details", methods=["GET", "POST"])
@login_required
def details():
    # 默认显示专利信息
    if request.method == "GET":
        patent_data = db.session.query(Patent, Apply).filter(
            Apply.teacher_id == current_user.user_id,Apply.patent_type == Patent.patent_type,
            Apply.patent_id == Patent.patent_id).with_entities(Patent.id, Patent.patent_id, Patent.patent_name,
                                                               Patent.patent_type, Patent.patent_owner,
                                                               Patent.patent_time, Patent.patent_state).all()
        return render_template("details_1.html", patent_data=patent_data)
    if request.method == "POST":
        pass


# 获取论文信息
def get_papers(name, address, user_id):
    print("开始获取论文信息")
    paper_crawler = PaperCrawler(name, address)
    source_data = paper_crawler.get_data()
    final_data = paper_crawler.handler_paper_items(source_data)
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
        paper_in = db.session.query(Paper).filter(Paper.paper_id == paper_id).all()
        if len(paper_in) == 0:
            paper = Paper(paper_id, paper_name, paper_source, paper_publish_time, address, paper_keywords, 0, 0, "", "", "", "已发表")
            db.session.add(paper)
            db.session.commit()
        # 检查教师论文对应信息是否存在
        deliver_in = db.session.query(Deliver).filter(Deliver.paper_id == paper_id, Deliver.teacher_id == user_id).all()
        if len(deliver_in) == 0:
            deliver = Deliver(user_id, paper_id, author_rank)
            db.session.add(deliver)
            db.session.commit()
    print("论文信息获取成功")


# 获取专利信息
def get_patents(name, address, user_id):
    print("开始获取专利信息")
    patent_crawler = PatentCrawler(name, address)
    final_data = patent_crawler.get_data()
    for item in final_data:
        patent_id = item["patent_id"]
        patent_name = item["patent_name"]
        patent_type = item["patent_type"]
        patent_time = item["patent_time"]
        patent_time = parse(patent_time)
        # 检查专利是否存在
        patent_in = db.session.query(Patent).filter(Patent.patent_id == patent_id, Patent.patent_type == patent_type).all()
        if len(patent_in) == 0:
            patent_state = '已' + patent_type[2:]
            patent = Patent(patent_id, patent_name, address, patent_time, patent_state, patent_type)
            db.session.add(patent)
            db.session.commit()
        # 检查教师专利对应信息是否存在
        apply_in = db.session.query(Apply).filter(Apply.patent_id == patent_id, Apply.teacher_id == user_id,
                                                  Apply.patent_type == patent_type).all()
        if len(apply_in) == 0:
            apply = Apply(user_id, patent_id, patent_type)
            db.session.add(apply)
            db.session.commit()
    print("专利信息获取成功")


if __name__ == '__main__':
    app.run()
