# -*- coding: utf-8 -*-

"""
    @Author 坦克手贝塔
    @Date 2021/2/25 13:45
"""

import requests
import json, time, re, jieba
from selenium import webdriver, common
from threading import Thread, Event
import cv2
import os
from PIL import ImageGrab
from tkinter import Tk, Menu, Text, END
from aip import AipOcr
from ctypes import windll


# 论文信息爬虫
class PaperCrawler:
    def __init__(self, name, address):
        self.name = name
        self.address = address
        self.paper_url = "https://api.cn-ki.net/openapi/search"
        self.executable_path = r"E:\Google\Chrome\Application\chromedriver.exe"

    def get_data(self):
        all_items = []
        # 第一次执行的参数
        para = {
            "advance": 1,
            "app_id": "test",
            "access_token": "test",
            "db": "SCDB",
            "sort_type": 1,
            "keyword": "AU='{}' AND AF%'{}'".format(self.name, self.address),
            "start": 0
        }
        # 第一次返回的结果
        try:
            response = requests.get(self.paper_url, params=para)
            response_data = json.loads(response.text)
        except:
            try:
                response = requests.get(self.paper_url, params=para)
                response_data = json.loads(response.text)
            except:
                return all_items
        # 不为空则存储结果
        while len(response_data["data"]["items"]) != 0:
            for item in response_data["data"]["items"]:
                all_items.append(item)
            para = {
                "advance": 1,
                "app_id": "test",
                "access_token": "test",
                "db": "SCDB",
                "sort_type": 1,
                "keyword": "AU='{}' AND AF%'{}'".format(self.name, self.address),
                "start": response_data["data"]["start"]
            }
            response = requests.get(self.paper_url, params=para)
            response_data = json.loads(response.text)
        return all_items

    def handler_paper_items(self, data):
        results = []
        options = webdriver.ChromeOptions()
        options.add_argument('--headless')
        options.add_argument('--disable-gpu')
        browser = webdriver.Chrome(self.executable_path, options=options)
        if len(data) != 0:
            for item in data:
                result_dict = {}
                # 处理出版时间
                if '年' in item["publish_time"]:
                    result_dict["publish_time"] = item["publish_time"].split('年')[0]
                elif "发表时间：" in item["publish_time"]:
                    result_dict["publish_time"] = item["publish_time"].split("发表时间：")[-1]
                # 获取作者类型
                authors = item["author"][0:-1].split(';')
                authors = [item.strip() for item in authors]
                # 获取关键字
                count = 0
                mirror_url = item["mirror_url"]
                try:
                    browser.get(mirror_url)
                    time.sleep(3)
                except common.exceptions.WebDriverException:
                    if count == 6:
                        continue
                    else:
                        browser.get(mirror_url)
                        time.sleep(3)
                try:
                    keywords = browser.find_element_by_xpath("//span[text()='关键词：']/following-sibling::p").text
                except common.exceptions.NoSuchElementException:
                    keywords = ""
                # 构造字典
                result_dict["filename"] = item["filename"]
                result_dict["title"] = item["title"]
                result_dict["source"] = item["source"]
                result_dict["author_rank"] = authors.index(self.name)
                result_dict["keywords"] = keywords
                print(result_dict)
                results.append(result_dict)
        print(len(results))
        return results


# 专利信息爬虫
class PatentCrawler:
    def __init__(self, name, address):
        self.name = name
        self.address = address
        self.patent_url = "https://kns.cnki.net/KNS8/AdvSearch?dbcode=SCOD"
        self.executable_path = r"E:\Google\Chrome\Application\chromedriver.exe"

    def get_data(self):
        # 用来存放结果
        all_items = []
        options = webdriver.ChromeOptions()
        options.add_argument('--headless')
        options.add_argument('--disable-gpu')
        browser = webdriver.Chrome(self.executable_path, options=options)
        try:
            browser.get(self.patent_url)
        except:
            try:
                browser.get(self.patent_url)
            except:
                return all_items
        time.sleep(2)
        # 设置第一个检索条件
        browser.find_element_by_xpath('//*[@id="patentgradetxt"]/dd[1]/div[2]/div[1]/div[1]').click()
        browser.find_element_by_xpath('//*[@id="patentgradetxt"]/dd[1]/div[2]/div[1]/div[2]/ul/li[11]').click()
        time.sleep(1)
        browser.find_element_by_xpath('//*[@id="patentgradetxt"]/dd[1]/div[2]/input').send_keys(self.name)
        browser.find_element_by_xpath('//*[@id="patentgradetxt"]/dd[3]/a').click()
        time.sleep(2)
        # 设置第二个检索条件
        browser.find_element_by_xpath('//*[@id="patentgradetxt"]/dd[2]/div[2]/div[1]/div[1]').click()
        browser.find_element_by_xpath('//*[@id="patentgradetxt"]/dd[2]/div[2]/div[1]/div[2]/ul/li[10]').click()
        time.sleep(1)
        browser.find_element_by_xpath('//*[@id="patentgradetxt"]/dd[2]/div[2]/input').send_keys(self.address)
        time.sleep(2)
        # 开始检索
        browser.find_element_by_xpath('/html/body/div[4]/div/div[2]/div/div[1]/div[1]/div[2]/div[2]/input').click()
        time.sleep(1)
        # 获取检索结果
        while True:
            try:
                # 每页有20条数据
                for i in range(1, 21):
                    try:
                        my_xpath = '//*[@id="gridTable"]/table/tbody/tr[{}]/td[2]/a'.format(i)
                        try:
                            browser.find_element_by_xpath(my_xpath).click()
                        except common.exceptions.StaleElementReferenceException:
                            continue
                        time.sleep(2)
                        # 切换到新打开的标签页
                        windows = browser.window_handles
                        browser.switch_to.window(windows[1])
                        # 获取需要的信息
                        patent_type = browser.find_element_by_xpath("//span[text()='专利类型：']/following-sibling::p").text
                        patent_id = browser.find_element_by_xpath("//span[text()='申请(专利)号：']/following-sibling::p").text
                        patent_time = browser.find_element_by_xpath("//span[text()='申请日：']/following-sibling::p").text
                        patent_name = browser.find_element_by_xpath\
                            ('/html/body/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h1').text
                        inventors = browser.find_element_by_xpath("//span[text()='发明人：']/following-sibling::p").text
                        inventors = re.sub(' ', '', inventors)
                        # 获取所有的发明人
                        inventors_copy = inventors
                        # 获取发明人的排名
                        inventors = inventors.split(';')
                        patent_data = {
                            "patent_id": patent_id,
                            "patent_name": patent_name,
                            "patent_type": patent_type,
                            "patent_time": patent_time,
                            "patent_inventors": inventors_copy,
                            "inventor_rank": inventors.index(self.name)
                        }
                        all_items.append(patent_data)
                        print(patent_data)
                        browser.close()
                        time.sleep(2)
                        # 返回原来的标签页
                        browser.switch_to.window(windows[0])
                    except common.exceptions.ElementNotInteractableException:
                        continue
                    except common.exceptions.ElementClickInterceptedException:
                        continue
                # 一页获取完成之后翻页
                time.sleep(2)
                browser.find_element_by_id("PageNext").click()
                time.sleep(2)
            except common.exceptions.NoSuchElementException:
                break
        browser.quit()
        print(len(all_items))
        return all_items


# 项目信息爬虫
class ProjectCrawler:
    def __init__(self, name, address):
        self.name = name
        self.address = address
        self.project_url = "http://ir.nsfc.gov.cn/search"
        self.project_detail_url = "http://www.izaiwen.cn/"
        self.executable_path = r"E:\Google\Chrome\Application\chromedriver.exe"

    def get_data(self):
        all_items = []
        options = webdriver.ChromeOptions()
        options.add_argument('--headless')
        options.add_argument('--disable-gpu')
        browser = webdriver.Chrome(self.executable_path, options=options)
        browser_detail = webdriver.Chrome(self.executable_path, options=options)
        try:
            browser.get(self.project_url)
        except:
            try:
                browser.get(self.project_url)
            except:
                return all_items
        time.sleep(1)
        # 设置第一个检索条件
        browser.find_element_by_xpath('//*[@id="org-filter"]').send_keys(self.address)
        time.sleep(1)
        browser.find_element_by_xpath('//*[@id="orgDRecommend"]/a').click()
        # 设置第二个检索条件
        browser.find_element_by_xpath('//*[@id="author-filter"]').send_keys(self.name)
        time.sleep(1)
        browser.find_element_by_xpath('//*[@id="filters"]/div[4]/button').click()
        time.sleep(1)
        while True:
            try:
                for i in range(0, 10):
                    # 构造点击的xpath
                    my_xpath = '//*[@id="listDiv"]/div[{}]/div[1]/div/a/span'.format(3*i+1)
                    browser.find_element_by_xpath(my_xpath).click()
                    time.sleep(2)
                    # 切换到新打开的标签页
                    windows = browser.window_handles
                    browser.switch_to.window(windows[1])
                    # 获取需要的信息
                    project_id = browser.find_element_by_xpath("//div[text()='项目编号']/following-sibling::div").text
                    project_name = browser.find_element_by_xpath("//div[text()='项目名称']/following-sibling::div").text
                    project_type = browser.find_element_by_xpath("//div[text()='资助类型']/following-sibling::div").text
                    project_source = "国家自然科学基金委员会"
                    project_state = "已结题"
                    # 获取详情
                    browser_detail.get(self.project_detail_url)
                    browser_detail.find_element_by_xpath('//*[@id="prjno"]').send_keys(project_id)
                    browser_detail.find_element_by_xpath('//*[@id="search_form"]/div[6]/button[1]').click()
                    time.sleep(1)
                    project_principal = browser_detail.find_element_by_xpath\
                        ('//*[@id="data_view"]/tbody/tr[1]/td[1]').text
                    project_principal_title = browser_detail.find_element_by_xpath\
                        ('//*[@id="data_view"]/tbody/tr[1]/td[2]').text
                    project_time = browser_detail.find_element_by_xpath('//*[@id="data_view"]/tbody/tr[1]/td[6]').text
                    if project_principal == self.name:
                        participant_rank = 0
                    else:
                        participant_rank = 1
                    # 构造返回的信息
                    project_data = {
                        "project_id": project_id,
                        "project_name": project_name,
                        "project_type": project_type,
                        "project_source": project_source,
                        "project_state": project_state,
                        "project_principal": project_principal,
                        "project_principal_title": project_principal_title,
                        "project_time": project_time[0:-1],
                        "participant_rank": participant_rank
                    }
                    print(project_data)
                    if project_data not in all_items:
                        all_items.append(project_data)
                    time.sleep(1)
                    browser.close()
                    # 返回原来的标签页
                    browser.switch_to.window(windows[0])
                # 一页获取完成之后翻页
                time.sleep(2)
                browser.find_element_by_xpath('//*[@id="pageNoUl"]/li[5]/a').click()
                time.sleep(2)
            except common.exceptions.NoSuchElementException:
                break
        browser.quit()
        browser_detail.quit()
        print(len(all_items))
        return all_items


# MyTimer类，主要是为了添加user_id这个属性
class MyTimer(Thread):
    def __init__(self, user_id, interval, function, args=None, kwargs=None):
        Thread.__init__(self)
        self.user_id = user_id
        self.interval = interval
        self.function = function
        self.args = args if args is not None else []
        self.kwargs = kwargs if kwargs is not None else {}
        self.finished = Event()

    def cancel(self):
        """Stop the timer if it hasn't finished yet."""
        self.finished.set()

    def run(self):
        self.finished.wait(self.interval)
        if not self.finished.is_set():
            self.function(*self.args, **self.kwargs)
        self.finished.set()


def split_words(para):
    candidate_generator = jieba.cut(para)
    candidate_list = list(candidate_generator)
    return candidate_list


# 截图
def cut():
    global img
    screen_cut()
    img = cv2.imread('screen.jpg')
    cv2.namedWindow('image')
    cv2.setMouseCallback('image', on_mouse)
    cv2.imshow('image', img)
    cv2.waitKey(0)
    os.remove('screen.jpg')


# 截取整个屏幕
def screen_cut():
    image = ImageGrab.grab()
    image.save("screen.jpg")


# 根据鼠标事件进行裁剪
def on_mouse(event, x, y, flags, param):
    global img, point1, point2
    img2 = img.copy()
    # 左键点击
    if event == cv2.EVENT_LBUTTONDOWN:
        point1 = (x, y)
        cv2.circle(img2, point1, 10, (0, 255, 0), 5)
        cv2.imshow('image', img2)
    # 按住左键拖曳
    elif event == cv2.EVENT_MOUSEMOVE and (flags & cv2.EVENT_FLAG_LBUTTON):
        cv2.rectangle(img2, point1, (x, y), (255, 0, 0), 5)
        cv2.imshow('image', img2)
    # 左键释放
    elif event == cv2.EVENT_LBUTTONUP:
        point2 = (x, y)
        cv2.rectangle(img2, point1, point2, (0, 0, 255), 5)
        cv2.imshow('image', img2)
        min_x = min(point1[0], point2[0])
        min_y = min(point1[1], point2[1])
        width = abs(point1[0] - point2[0])
        height = abs(point1[1] - point2[1])
        cut_img = img[min_y:min_y+height, min_x:min_x+width]
        # 不存在则新建目录
        if not os.path.exists(".\\photos"):
            os.makedirs('.\\photos')
        path = '.\\photos\\cut.png'
        new_text.delete(0.0, END)
        cv2.imwrite(path, cut_img)
        get_text_by_ocr(path)
        new_text.insert("insert", text)
        cv2.waitKey(1000)
        cv2.destroyAllWindows()


# 图片识别成文字
def get_text_by_ocr(path):
    global text
    client = AipOcr(APP_ID, APP_KEY, SECRET_KEY)
    with open(path, 'rb') as f:
        image = f.read()
        all_data = client.basicAccurate(image)
        text = ""
        for i in range(0, all_data["words_result_num"]):
            text += all_data["words_result"][i]["words"]


# 让系统知道使用者看到的尺寸
user32 = windll.user32
user32.SetProcessDPIAware()
# 主窗体
root = Tk()
root.wm_attributes('-topmost', 1)
root.title("文字识别")
root.geometry("300x100")
root.resizable(width=False, height=False)
new_menu = Menu(root)
new_menu.add_command(label="开始识别", command=cut)
new_text = Text(root, show=None)
new_text.place(width=300, height=100)
root["menu"] = new_menu
# 识别之后的结果
text = ""
# 文字识别所用的账号信息
APP_ID = "23891095"
APP_KEY = "fzTK5eStvxByKGRynEwO4DOZ"
SECRET_KEY = "Y2XDUgYOO8iuhSei6lluFKRDIBQWmsfi"


# if __name__ == "__main__":
#     root.mainloop()
#     patent_crawler = PatentCrawler("陈晓江", "西北大学")
#     data2 = patent_crawler.get_data()
#     paper_crawler = PaperCrawler("陈晓江", "西北大学")
#     data1 = paper_crawler.get_data()
#     paper_crawler.handler_paper_items(data1)
#     project_crawler = ProjectCrawler("陈晓江", "西北大学")
#     project_crawler.get_data()


