# autotest_tsg

自动化测试

1、目录：autotest
* -------------autotest_tsg
* -----------------01-TestCase
* ----------------------tsg_ui
* --------------------------具体模块
* ----------------------tsg_bf_api
* ----------------------tsg_galaxy_api
* ----------------------tsg_adc
* ------------------02-Keyword

				...
2、用例名：不怕长必须意义明确；
3、标签：多个标签，下面是必须包含
	1）、大模块：tsg_ui、tsg_bf_api、tsg_galaxy_api、tsg_adc（业务验证）
	2）、小模块：UI按界面菜单，API按JRIA上接口文档的菜单，api对照界面英文，如无对应再沟通；全流程按界面对应策略、协议、动作贴三层标签；
	3）、其他根据需要贴标签


相关插件:
requests                        2.22.0
RESTinstance                    1.0.2
rfc3987                         1.3.8
robotframework                  3.2b1
robotframework-requests         0.6.2
robotframework-ride             1.7.4
robotframework-selenium2library 3.0.0
robotframework-seleniumlibrary  4.1.0
selenium                        4.0.0a3