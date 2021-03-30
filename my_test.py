# -*- coding: utf-8 -*-

"""
    @Author 坦克手贝塔
    @Date 2021/3/30 16:56
"""
from selenium import webdriver, common
import time
import re


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
        # browser = webdriver.Chrome(self.executable_path)
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


if __name__ == "__main__":
    patent_crawler = PatentCrawler("陈晓江", "西北大学")
    data2 = patent_crawler.get_data()
