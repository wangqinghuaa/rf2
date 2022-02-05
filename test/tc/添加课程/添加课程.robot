*** Settings ***
Library   SeleniumLibrary
Library  Collections
Resource  rflib/rc.robot

Suite Setup  Setup Webtest            # 只执行一次
Suite Teardown  Teardown Webtest        # 只执行一次
*** Test Cases ***
添加课程1
    [Setup]   deleteAllCourse
    sleep  1
    loginwebsite  auto  sdfsdfsdf
    add course  初中语文  初中语文课程  1
    ${lessons}=  get course list
    should be true  $lessons==["初中语文"]
    [Teardown]  deleteAllCourse

添加课程2
    [Setup]   deleteAllCourse
    loginwebsite  auto  sdfsdfsdf
    sleep  1
    add course  初中数学  初中数学课程  2
    ${lessons}=  get course list
    should be true  $lessons==["初中数学"]
    [Teardown]  deleteAllCourse
