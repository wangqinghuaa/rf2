*** Settings ***
Library  SeleniumLibrary
Library  Collections     #检查库专用


*** Keywords ***
Setup Webtest
    Open Browser   http://localhost:8066/mgr/login/login.html   chrome
    set selenium implicit wait  10
Teardown Webtest
    close browser

loginwebsite
    [Arguments]    ${username}   ${password}
    go to  ${MgrLoginUrl}
    input text   id=username   ${username}
    input text   id=password   ${password}
    click element  tag=button

add course
    [Arguments]   ${name}  ${desc}  ${idx}
    click element  css=*[ng-click="showAddOne=true"]

    input text   css=*[ng-model="addData.name"]  ${name}
    input text   css=*[ng-model="addData.desc"]  ${desc}
    input text   css=*[ng-model="addData.display_idx"]   ${idx}

    click element  css=*[ng-click="addOne()"]
    sleep  1

get course list
    ${lessons}=  create list
    ${eles}=   get webelements   css=tr>td:nth-child(2)
    :for  ${ele}  in  @{eles}
     \  APPEND TO LIST      ${lessons}  ${ele.text}
     \  log to console  ${ele.text}
    [Return]  ${lessons}

DeleteAllcourse
    login web site    auto  sdfsdfsdf
    set selenium implicit wait  1
    :for  ${one}  in  range  9999
      \  ${eles}=   get webelements   css=button[ng-click='delOne(one)']
      \  exit for loop if   $eles==[]
      \  sleep  1
      \  click element   @{eles}[0]
      \  sleep  1
      \  click element  css=button.btn-primary
      \  sleep  1
    set selenium implicit wait  10