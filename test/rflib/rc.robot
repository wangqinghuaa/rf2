
*** Settings ***
Library   SeleniumLibrary
Library  Collections


# 这里引用全局变量
*** Variables ***
${mgrlgoinurl}   http://localhost:8066/mgr/login/login.html
&{adminuser}     name=auto    pw=sdfsdfsdf

*** Keywords ***
Setup Webtest
    open browser  http://localhost:8066   chrome
    set selenium implicit wait  10
Teardown Webtest
    close browser

loginwebsite  # 登录
    [Arguments]  ${username}  ${password}
    go to  ${mgrlgoinurl}
    input text  id=username   &{adminuser}[name]
    input text  id=password   &{adminuser}[pw]
    click element  tag=button

add course
    [Arguments]   ${name}  ${desc}  ${idx}
    click element  css=*[href="#/"]
    sleep  1
    click element  css=*[ng-click="showAddOne=true"]

    input text  css=*[ng-model="addData.name"]  ${name}
    input text  css=*[ng-model="addData.desc"]  ${desc}
    input text  css=*[ng-model="addData.display_idx"]   ${idx}
    click element  css=*[ng-click="addOne()"]   #到这里点击过又重新刷新了  下面要加等待时间
get course list
    sleep  1
    ${lessons}=  create list
    ${eles}=  get webelements   css=tr>td:nth-child(2)   # 这里所抓取的是没刷新的页面
    :FOR  ${ele}  IN  @{eles}         #  @表示展开元素
    \   APPEND TO LIST   ${lessons}  ${ele.text}
    \   log to console   ${ele.text}
    [Return]   ${lessons}   # 返回课程名

deleteAllCourse
    loginwebsite  auto  sdfsdfsdf
    set selenium implicit wait  1
    :FOR  ${one}  IN RANGE  9999
    \  ${eles}=  get webelements  css=button[ng-click='delOne(one)']
    \  exit for loop if  $eles==[]   #如果eles为空
    \  click element  @{eles}[0]     #把列表展开取第一个
    \  click element  css=button.btn-primary
    \  sleep  1
    set selenium implicit wait  10

deleteAllTeacher
    loginwebsite    &{adminuser}[name]   &{adminuser}[pw]
    click element  css=*[href="#/teacher"]


    set selenium implicit wait  1
    :FOR  ${one}  IN  RANGE  9999
    \  ${eles}=  get webelements  css=button[ng-click='delOne(one)']
    \  exit for loop if  $eles==[]   #如果eles为空
    \  click element  @{eles}[0]     #把列表展开取第一个
    \  click element  css=button.btn-primary
    \  sleep  1
    set selenium implicit wait  10

Add Teacher
     [Arguments]   ${realname}   ${username}  ${desc}  ${idx}  ${course}
     click element  css=*[href="#/teacher"]
     sleep  1
     click element  css=button[ng-click="showAddOne=true"]
     input text  css=*[ng-model="addEditData.realname"]  ${realname}
     input text  css=*[ng-model="addEditData.username"]  ${username}
     input text  css=*[ng-model="addEditData.desc"]   ${desc}
     input text  css=*[ng-model="addEditData.display_idx"]   ${idx}
     select from list by label  css=*[ng-model="$parent.courseSelected"]  ${course}
     click element  css=button[ng-click="addEditData.addTeachCourse()"]
     click element  css=button[ng-click="addOne()"]
     sleep  2

get teacher list
    click element  css=*[href="#/teacher"]
    sleep  1
    ${teachers}=  create list
    ${eles}=  get webelements   css=tr>td:nth-child(2)   # 这里所抓取的是没刷新的页面
    :FOR  ${ele}  IN  @{eles}         #  @表示展开元素
    \   APPEND TO LIST   ${teachers}  ${ele.text}
    [Return]   ${teachers}   # 返回课程名