# -*- coding: utf-8 -*-

"""
    @Author 坦克手贝塔
    @Date 2021/2/25 13:45
"""

import requests
import json
from selenium import webdriver, common
import time


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
        response = requests.get(self.paper_url, params=para)
        response_data = json.loads(response.text)
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
                mirror_url = item["mirror_url"]
                browser.get(mirror_url)
                time.sleep(2)
                try:
                    keywords = browser.find_element_by_xpath('/html/body/div[2]/div[1]/div[3]/div/div/div[3]/div[3]/p').text
                except common.exceptions.NoSuchElementException:
                    try:
                        keywords = browser.find_element_by_xpath('/html/body/div[2]/div[1]/div[3]/div/div/div[5]/p').text
                    except common.exceptions.NoSuchElementException:
                        continue
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
        browser.get(self.patent_url)
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
                    my_xpath = '//*[@id="gridTable"]/table/tbody/tr[{}]/td[2]/a'.format(i)
                    browser.find_element_by_xpath(my_xpath).click()
                    time.sleep(2)
                    # 切换到新打开的标签页
                    windows = browser.window_handles
                    browser.switch_to.window(windows[1])
                    # 获取需要的信息
                    patent_type = browser.find_element_by_xpath\
                        ('/html/body/div[2]/div/div[1]/div[1]/div/div[2]/div[2]/p').text
                    patent_id = browser.find_element_by_xpath\
                        ('/html/body/div[2]/div/div[1]/div[1]/div/div[2]/div[3]/div[1]/p').text
                    patent_time = browser.find_element_by_xpath\
                        ('/html/body/div[2]/div/div[1]/div[1]/div/div[2]/div[3]/div[2]/p').text
                    patent_name = browser.find_element_by_xpath\
                        ('/html/body/div[2]/div/div[1]/div[1]/div/div[2]/div[1]/h1').text
                    patent_data = {
                        "patent_id": patent_id,
                        "patent_name": patent_name,
                        "patent_type": patent_type,
                        "patent_time": patent_time
                    }
                    all_items.append(patent_data)
                    print(patent_type, patent_id, patent_name, patent_time)
                    browser.close()
                    time.sleep(2)
                    # 返回原来的标签页
                    browser.switch_to.window(windows[0])
                # 一页获取完成之后翻页
                time.sleep(1)
                browser.find_element_by_xpath('//*[@id="PageNext"]').click()
                time.sleep(2)
            except common.exceptions.NoSuchElementException:
                break
        browser.quit()
        print(len(all_items))
        return all_items


if __name__ == "__main__":
    # paper_crawler = PaperCrawler("王薇", "西北大学信息科学与技术学院")
    # data1 = paper_crawler.get_data()
    # paper_crawler.handler_paper_items(data1)
    patent_crawler = PatentCrawler("王薇", "西北大学")
    all = patent_crawler.get_data()

