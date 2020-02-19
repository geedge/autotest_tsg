*** Settings ***
Test Setup        Login
Test Teardown     Logout
Resource          ../../02-Keyword/tsg-adc/systemcommand.txt
Resource          ../../02-Keyword/tsg-bifang/policyobject.txt
Resource          ../../02-Keyword/tsg-bifang/loginlogout.txt

*** Test Cases ***
allflow
    #登录 放到setup
    #Login
    #创建对象
    ${rescode}    ${objectId}    AddObject    { \ \ \ \ "opAction":"add", \ \ \ \ "returnData":1, \ \ \ \ "objectList":[ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "objectType":"IP", \ \ \ \ \ \ \ \ \ \ \ \ "objectName":"dxytestip", \ \ \ \ \ \ \ \ \ \ \ \ "objectDesc":"dxytestip", \ \ \ \ \ \ \ \ \ \ \ \ "isInitialize":0, \ \ \ \ \ \ \ \ \ \ \ \ "isExclusion":0, \ \ \ \ \ \ \ \ \ \ \ \ "subObjectIds":[], \ \ \ \ \ \ \ \ \ \ \ \ "addItemList":[ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "itemName":"dxytestip", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "itemDesc":"dxytestip", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "addrType":4, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientIpFormat":"mask", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientIp1":"111.111.111.111", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientIp2":"255.255.255.255", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientPortFormat":"mask", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientPort1":"0", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientPort2":"65535", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverIpFormat":"range", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverIp1":"222.222.222.222", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverIp2":"255.255.255.0", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverPortFormat":"mask", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverPort1":"0", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverPort2":"65535", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "protocol":0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "direction":1, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "isInitialize":0 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ } \ \ \ \ \ \ \ \ \ \ \ \ ], \ \ \ \ \ \ \ \ \ \ \ \ "updateItemList":[ \ \ \ \ \ \ \ \ \ \ \ \ ], \ \ \ \ \ \ \ \ \ \ \ \ "deleteItemIds":[ \ \ \ \ \ \ \ \ \ \ \ \ ] \ \ \ \ \ \ \ \ } \ \ \ \ ] }
    log    ${rescode}
    #log    1111
    #Integer    ${rescode}    200
    #Should Be Equal As Strings    ${rescode}    200
    #log    22222
    log    ${objectId}
    #log    333333
    #${objid}    Get From List    ${objectId}    0
    #创建策略
    ${rescode}    ${policyId}    AddPolicy    {"opAction":"add","returnData":1,"policyList":{"action":"allow","appObjectIdArray":[1600,1596,1597,1598,1599],"doLog":1,"isValid":0,"opTime":"2020-02-12 10:01:43","opUser":981,"opUserName":"uitest","policyDesc":"dxytest","policyName":"dxytest","policyType":"tsg_security","referenceObject":[{"objectId": ${objectId},"protocolFields":[]}],"scheduleId":[],"userTags":"","groupNum":null,"effectiveRange":null}}
    log    ${rescode}
    log    ${policyId}
    #Integer    ${rescode}    200
    #功能端验证
    ${commandstr}    set variable    nslookup -d www.jd.com
    @{stringlist}    set variable    www.jd.com, type = AAAA, class = IN    www.jd.com.gslb.qianxun.com    ttl =
    ${starttime}    Get Time
    ${rescode}    SystemCommand    ${commandstr}    @{stringlist}
    ${endtime}    Get Time
    log    ${rescode}
    ${commandstr}    set variable    curl -kv https://www.baidu.com
    @{stringlist}    set variable    CN=GlobalSign Organization Validation CA - SHA256 - G2    text/html
    ${starttime}    Get Time
    ${rescode}    SystemCommand    ${commandstr}    @{stringlist}
    ${endtime}    Get Time
    log    ${rescode}
    #Integer    ${rescode}    200
    #日志验证
    #${rescode}    SecurityEventLogs    ${starttime}    ${endtime}    ${policyid}    ${clientip}    ${key}    ${value}
    #Integer    ${rescode}    200
    #清理环境 放Teardown
    #删除策略
    log    toDeletePolicy
    ${rescode}    DeletePolicy    ${policyId}
    Integer    ${rescode}    200
    #删除对象
    log    todeleteobj
    ${rescode}    DeleteObject    ${objectId}
    Integer    ${rescode}    200
    #清理日志？
    #退出登录 放到teardown
    #最为彻底的清理方式是每次重新初始化数据库
