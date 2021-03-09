# -*- coding: utf-8 -*-

"""
    @Author 坦克手贝塔
    @Date 2021/2/22 15:04
"""
SQLALCHEMY_DATABASE_URI = 'mysql+mysqlconnector://root:123456@localhost:3306/graduation?charset=utf8'
# "数据库：//用户名：密码@host：port/数据库名称"

SQLALCHEMY_TRACK_MODIFICATIONS = False
# 这一行不加会有警告

MAIL_SERVER = "smtp.qq.com"
MAIL_PORT = '587'
MAIL_USE_TLS = True
# MAIL_USE_SSL
MAIL_USERNAME = "1148099884@qq.com"
# 这里的密码不是你的QQ邮箱的密码
# 而是通过QQ邮箱自定义的验证码
MAIL_PASSWORD = "hfveoxoosgyahijf"
MAIL_DEFAULT_SENDER = "1148099884@qq.com"

CACHE_TYPE = "simple"
CACHE_DEFAULT_TIMEOUT = 5 * 60
