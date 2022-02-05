*** Settings ***
Library   SeleniumLibrary
Library  Collections
Resource  rflib/rc.robot

Suite Setup  Setup Webtest            # 只执行一次
Suite Teardown  Teardown Webtest        # 只执行一次



*** Test Cases ***
添加老师

    [Setup]   run keywords  deleteAllCourse
    ...  AND  deleteAllTeacher
    ...  AND  add course  初中语文  初中语文课程  1
    ...  AND  add course  初中数学  初中数学课程  2

    add teacher   庄子  zhuangzhi  庄子老师  1  初中语文
    add teacher   孔子  kongzi     孔子老师  2  初中数学
    ${teachers}=  get teacher list
    should be true  $teachers==["庄子","孔子"]
    [Teardown]   run keywords  deleteAllCourse
    ...  AND  deleteAllTeacher

