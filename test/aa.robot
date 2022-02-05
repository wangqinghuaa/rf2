*** Settings ***
Library

*** Test Cases ***

验证
#    should be equald  10  100
#     Should Be Equal As Integers   10   01
    ${var}=  set variable  hello
#    log to console  ${var}
#    log  ${var}
    should be true  $var=='hello'   # 去掉大括号 取得是变量名 'hello'
#    log to console  ${var}
