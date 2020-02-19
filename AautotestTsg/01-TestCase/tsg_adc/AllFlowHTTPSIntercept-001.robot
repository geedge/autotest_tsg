*** Settings ***
Test Setup        Login
Test Teardown     Logout
Library           OperatingSystem
Resource          ../../02-Keyword/tsg-adc/systemcommand.txt
Resource          ../../02-Keyword/tsg-bifang/policyobject.txt
Resource          ../../02-Keyword/tsg-bifang/loginlogout.txt
Resource          ../../02-Keyword/tsg-bifang/logvariable.txt
Resource          ../../02-Keyword/tsg-bifang/logschema.txt    #Resource    log-3.robot

*** Test Cases ***
HTTPS-Intecept
    #登录 放到setup
    #Login
    #创建对象
    ${rescode}    ${objectId}    AddObject    { \ \ \ \ "opAction":"add", \ \ \ \ "returnData":1, \ \ \ \ "objectList":[ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "objectType":"fqdn", \ \ \ \ \ \ \ \ \ \ \ \ "objectName":"dxytest_fqdn_baidu", \ \ \ \ \ \ \ \ \ \ \ \ "objectDesc":"dxytest_fqdn_baidu", \ \ \ \ \ \ \ \ \ \ \ \ "isInitialize":0, \ \ \ \ \ \ \ \ \ \ \ \ "isExclusion":0, \ \ \ \ \ \ \ \ \ \ \ \ "subObjectIds":[], \ \ \ \ \ \ \ \ \ \ \ \ "addItemList":[ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "itemName":"item name", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "itemDesc":"item description", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "keywordArray":[ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "*baidu.com" \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ], \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "isHexbin":0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "isInitialize":0 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ } \ \ \ \ \ \ \ \ \ \ \ \ ], \ \ \ \ \ \ \ \ \ \ \ \ "updateItemList":[ \ \ \ \ \ \ \ \ \ \ \ \ ], \ \ \ \ \ \ \ \ \ \ \ \ "deleteItemIds":[ \ \ \ \ \ \ \ \ \ \ \ \ ] \ \ \ \ \ \ \ \ } \ \ \ \ ] }
    #log    ${rescode}
    #log    1111
    #Integer    ${rescode}    200
    #Should Be Equal As Strings    ${rescode}    200
    #log    22222
    log    ${objectId}
    #log    333333
    #${objid}    Get From List    ${objectId}    0
    #创建对象IP
    ${rescodeip}    ${objidip}    AddObject    { \ \ \ \ "opAction":"add", \ \ \ \ "returnData":1, \ \ \ \ "objectList":[ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "objectType":"IP", \ \ \ \ \ \ \ \ \ \ \ \ "objectName":"dxytest_ip", \ \ \ \ \ \ \ \ \ \ \ \ "objectDesc":"dxytest_ip", \ \ \ \ \ \ \ \ \ \ \ \ "isInitialize":0, \ \ \ \ \ \ \ \ \ \ \ \ "isExclusion":0, \ \ \ \ \ \ \ \ \ \ \ \ "subObjectIds":[ \ \ \ \ \ \ \ \ \ \ \ \ ], \ \ \ \ \ \ \ \ \ \ \ \ "addItemList":[ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "itemName":"dxytest_name_ip", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "itemDesc":"dxytest_name_ip", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "addrType":4, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientIpFormat":"range", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientIp1":"192.168.50.17", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientIp2":"192.168.50.17", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientPortFormat":"mask", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientPort1":"0", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "clientPort2":"65535", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverIpFormat":"", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverIp1":"", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverIp2":"", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverPortFormat":"", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverPort1":"", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "serverPort2":"", \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "protocol":0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "direction":0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "isInitialize":0 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ } \ \ \ \ \ \ \ \ \ \ \ \ ], \ \ \ \ \ \ \ \ \ \ \ \ "updateItemList":[ \ \ \ \ \ \ \ \ \ \ \ \ \ ], \ \ \ \ \ \ \ \ \ \ \ \ "deleteItemIds":[ \ \ \ \ \ \ \ \ \ \ \ \ \ ] \ \ \ \ \ \ \ \ } \ \ \ \ ] }
    #Integer    ${rescodeip}    200
    #Should Be Equal As Strings    ${rescode}    200
    #log    22222
    log    ${objidip}
    #创建策略
    ${rescode}    ${policyId}    AddPolicy    { \ \ \ \ "opAction":"add", \ \ \ \ "returnData":1, \ \ \ \ "policyList":[ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "policyId":"", \ \ \ \ \ \ \ \ \ \ \ \ "isValid":0, \ \ \ \ \ \ \ \ \ \ \ \ "policyName":"dxytest_拦截通用1", \ \ \ \ \ \ \ \ \ \ \ \ "policyType":"tsg_security", \ \ \ \ \ \ \ \ \ \ \ \ "action":"intercept", \ \ \ \ \ \ \ \ \ \ \ \ "userTags":"", \ \ \ \ \ \ \ \ \ \ \ \ "doBlacklist":0, \ \ \ \ \ \ \ \ \ \ \ \ "doLog":1, \ \ \ \ \ \ \ \ \ \ \ \ "userRegion":{ \ \ \ \ \ \ \ \ \ \ \ \ \ "protocol":"SSL", \ \ \ \ "protocol_version":{"allow_http2":1, \ \ \ \ \ \ \ \ \ \ "min":"ssl3", \ \ \ \ \ \ \ \ \ "max":"tls13", \ \ \ \ \ \ \ \ \ "mirror_client":1}, \ \ \ \ "dynamic_bypass":{"mutual_authentication":1, \ \ \ \ "cert_pinning":1,"cert_transparency":0, \ \ \ \ "protocol_errors":1,"ev_cert":0}, \ \ \ \ "decrypt_mirror":{"enable":0}, \ \ \ \ "certificate_checks":{"fail_action":"pass-through", \ \ \ \ "approach":{"self-signed":1, \ \ \ \ "expiration":1, \ \ \ \ "cn":1, \ \ \ \ "issuer":1}}, \ \ \ \ "keyring":1}, \ \ \ \ \ \ \ \ \ \ \ \ "referenceObject":[{"objectId":${objectId}, \ \ \ \ \ \ \ \ "protocolFields":["TSG_FIELD_SSL_SNI"]}, \ \ \ \ \ \ \ \ {"objectId":${objidip}, \ \ \ \ \ \ \ \ "protocolFields":[]}], \ \ \ \ \ \ \ \ \ \ \ \ "scheduleId":[ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ] \ \ \ \ \ \ \ \ } \ \ \ \ ] }
    log    ${rescode}
    log    ${policyId}
    #Integer    ${rescode}    200
    #功能端验证
    #${commandstr}    set variable    F:/AllFlowHTTPSIntercept-001_dos.bat
    #${rescode}    SystemCommand    ${commandstr}    @{stringlist}
    @{stringlist}    set variable    CN=GlobalSign Organization Validation CA - SHA256 - G2    text/html
    ${starttime}    Get Time
    ${commandreturn}    OperatingSystem.Run    E:/AllFlowHTTPSIntercept-001_dos.bat
    FOR    ${var}    IN    @{stringlist}
        log    dxytest
        log    ${var}
        Should Contain    ${commandreturn}    ${var}
    END
    ${endtime}    Get Time
    #log    ${rescode}
    #Integer    ${rescode}    200
    #日志验证
    GetLogList    security_event_log    2020-02-18 14:11:19    2020-02-18 15:11:19    192.168.50.4    1746    live.com
    #${rescode}    SecurityEventLogs    ${starttime}    ${endtime}    ${policyid}    ${clientip}    ${key}    ${value}
    #Integer    ${rescode}    200
    #清理环境 放Teardown
    #删除策略
    log    toDeletePolicy
    #${rescode}    DeletePolicy    ${policyId}
    #Integer    ${rescode}    200
    #删除对象
    log    todeleteobj
    #${rescode}    DeleteObject    ${objectId}
    #Integer    ${rescode}    200
    #清理日志？
    #退出登录 放到teardown
    #最为彻底的清理方式是每次重新初始化数据库
