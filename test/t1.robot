*** Settings ***
Library   SeleniumLibrary
Library  Collections
Resource  rc.robot

Suite Setup  Setup Webtest            # 只执行一次
Suite Teardown  Teardown Webtest        # 只执行一次
*** Test Cases ***
测试1
    [Setup]   deleteAllCourse
    loginwebsite  &{adminuser}[name]  &{adminuser}[pw]
    add course  初中数学  初中数学课程  1
    ${lessons}=  get course list
    should be true  $lessons==["初中数学"]
    [Teardown]  deleteAllCourse

#测试2
#    [Setup]   deleteAllCourse
#    loginwebsite  &{adminuser}[name]  &{adminuser}[pw]
#    add course  语文  语文课程  1
#    ${lessons}=  get course list
#    should be true  $lessons==["语文"]
#    [Teardown]  deleteAllCourse
