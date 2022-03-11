# -*- coding: utf-8 -*-

"""
    @Author 坦克手贝塔
    @Date 2021/2/22 14:01
"""
from app import db
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin

# 用户登录信息表
class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(128), nullable=False, unique=True)
    user_id = db.Column(db.String(128), nullable=False, unique=True)
    password = db.Column(db.String(128), nullable=False)
    user_name = db.Column(db.String(128), nullable=False)

    def __init__(self, email, name, password):
        self.email = email
        self.user_name = name
        self.user_id = ""
        self.password = generate_password_hash(password)

    def is_authenticated(self):
        return True

    def is_active(self):
        return True

    def is_anonymous(self):
        return False

    # 后面login_user用来作为用户的id
    def get_id(self):
        return self.user_id

    def __repr__(self):
        return '<Email %r User %r>' % (self.email, self.user_id)

    def check_password(self, raw_password):
        is_valid = check_password_hash(self.password, raw_password)
        return is_valid


# 用户个人信息表
class Info(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), nullable=False)
    user_id = db.Column(db.String(128), nullable=False, unique=True)
    email = db.Column(db.String(128), nullable=False, unique=True)
    province1 = db.Column(db.String(128), nullable=False)
    city1 = db.Column(db.String(128), nullable=False)
    district1 = db.Column(db.String(128), nullable=False)
    address1 = db.Column(db.String(128), nullable=False)
    province2 = db.Column(db.String(128), nullable=True)
    city2 = db.Column(db.String(128), nullable=True)
    district2 = db.Column(db.String(128), nullable=True)
    address2 = db.Column(db.String(128), nullable=True)
    title = db.Column(db.String(128), nullable=True)

    def __init__(self, name, user_id, email, province1, city1, district1, address1, province2, city2, district2,
                 address2, title):
        self.name = name
        self.user_id = user_id
        self.email = email
        self.province1 = province1
        self.city1 = city1
        self.district1 = district1
        self.address1 = address1
        self.province2 = province2
        self.city2 = city2
        self.district2 = district2
        self.address2 = address2
        self.title = title

    def __repr__(self):
        return "<Info %r %r>" % (self.user_id, self.name)


# 项目信息表
class Project(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    project_id = db.Column(db.String(128), nullable=False, unique=True)
    project_name = db.Column(db.String(128), nullable=False)
    project_type = db.Column(db.String(128), nullable=True)
    project_source = db.Column(db.String(128), nullable=True)
    project_state = db.Column(db.String(128), nullable=True)
    project_principal = db.Column(db.String(128), nullable=True)
    project_principal_title = db.Column(db.String(128), nullable=True)
    project_time = db.Column(db.Date, nullable=True)

    def __init__(self, project_id, project_name, project_type, project_source,
                 project_state, project_principal, project_principal_title, project_time):
        self.project_id = project_id
        self.project_name = project_name
        self.project_type = project_type
        self.project_source = project_source
        self.project_state = project_state
        self.project_principal = project_principal
        self.project_principal_title = project_principal_title
        self.project_time = project_time

    def __repr__(self):
        return "<Project %r %r>" % (self.project_id, self.project_name)


# 论文信息表
class Paper(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    paper_id = db.Column(db.String(128), nullable=False, unique=True)
    paper_name = db.Column(db.String(128), nullable=False)
    paper_source = db.Column(db.String(128), nullable=True)
    paper_time = db.Column(db.Date, nullable=True)
    paper_region = db.Column(db.String(128), nullable=True)
    paper_keywords = db.Column(db.String(128), nullable=True)
    paper_influence = db.Column(db.DECIMAL(6, 2), nullable=True)
    paper_quote = db.Column(db.Integer, nullable=True)
    paper_press = db.Column(db.String(128), nullable=True)
    paper_search_type = db.Column(db.String(128), nullable=True)
    paper_doi = db.Column(db.String(128), nullable=True)
    paper_state = db.Column(db.String(128), nullable=True)
    paper_authors = db.Column(db.String(128), nullable=True)

    def __init__(self, paper_id, paper_name, paper_source, paper_time, paper_region, paper_keywords,
                 paper_influence, paper_quote, paper_press, paper_search_type, paper_doi, paper_state, paper_authors):
        self.paper_id = paper_id
        self.paper_name = paper_name
        self.paper_source = paper_source
        self.paper_time = paper_time
        self.paper_region = paper_region
        self.paper_keywords = paper_keywords
        self.paper_influence = paper_influence
        self.paper_quote = paper_quote
        self.paper_press = paper_press
        self.paper_search_type = paper_search_type
        self.paper_doi = paper_doi
        self.paper_state = paper_state
        self.paper_authors = paper_authors

    def __repr__(self):
        return "<Paper %r %r>" % (self.paper_id, self.paper_name)


# 专利信息表
class Patent(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    patent_id = db.Column(db.String(128), nullable=False)
    patent_name = db.Column(db.String(128), nullable=False)
    patent_owner = db.Column(db.String(128), nullable=True)
    patent_inventors = db.Column(db.String(128), nullable=True)
    patent_time = db.Column(db.Date, nullable=True)
    patent_state = db.Column(db.String(128), nullable=True)
    patent_type = db.Column(db.String(128), nullable=True)

    def __init__(self, patent_id, patent_name, patent_owner, patent_time, patent_state, patent_type, patent_inventors):
        self.patent_id = patent_id
        self.patent_name = patent_name
        self.patent_owner = patent_owner
        self.patent_time = patent_time
        self.patent_state = patent_state
        self.patent_type = patent_type
        self.patent_inventors = patent_inventors

    def __repr__(self):
        return "<Patent %r %r>" % (self.patent_id, self.patent_name)


# 参与项目情况
class Participate(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    teacher_id = db.Column(db.String(128), nullable=False)
    project_id = db.Column(db.String(128), nullable=False)
    teacher_type = db.Column(db.Integer, nullable=False)

    def __init__(self, teacher_id, project_id, teacher_type):
        self.teacher_id = teacher_id
        self.project_id = project_id
        self.teacher_type = teacher_type

    def __repr__(self):
        return "<Participate %r %r>" % (self.teacher_id, self.project_id)


# 发表论文情况
class Deliver(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    teacher_id = db.Column(db.String(128), nullable=False)
    paper_id = db.Column(db.String(128), nullable=False)
    teacher_type = db.Column(db.Integer, nullable=False)

    def __init__(self, teacher_id, paper_id, teacher_type):
        self.teacher_id = teacher_id
        self.paper_id = paper_id
        self.teacher_type = teacher_type

    def __repr__(self):
        return "<Deliver %r %r>" % (self.teacher_id, self.paper_id)


# 授权公开专利情况
class Apply(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    teacher_id = db.Column(db.String(128), nullable=False)
    patent_id = db.Column(db.String(128), nullable=False)
    patent_type = db.Column(db.String(128), nullable=True)
    teacher_type = db.Column(db.Integer, nullable=False)

    def __init__(self, teacher_id, patent_id, patent_type, teacher_type):
        self.teacher_id = teacher_id
        self.patent_id = patent_id
        self.patent_type = patent_type
        self.teacher_type = teacher_type

    def __repr__(self):
        return "<Apply %r %r %r>" % (self.teacher_id, self.patent_id, self.patent_type)
