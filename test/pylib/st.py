#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     :2020-04-04 17:17
# @Author   :wangqinghua
# @File     : st.py
# @Software : PyCharm

from selenium import webdriver
import time


def deleteAllCourse():
    driver = webdriver.Chrome()
    driver.implicitly_wait(10)

    driver.get("http://localhost:8066/mgr/login/login.html")
    driver.find_element_by_id('username').send_keys('auto')
    driver.find_element_by_id('password').send_keys('sdfsdfsdf')
    driver.find_element_by_tag_name('button').click()

    driver.implicitly_wait(1)
    while True:
        delButtons = driver.find_elements_by_css_selector('*[ng-click="delOne(one)"]')
        if delButtons:
            delButtons[0].click()
            driver.find_element_by_css_selector('button.btn-primary').click()
            time.sleep(1)
        else:
            break
    driver.implicitly_wait(10)

