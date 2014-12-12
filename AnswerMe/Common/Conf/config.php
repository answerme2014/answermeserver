<?php
return array(
	//'配置项'            	=>   	'配置值'
	// 设置禁止访问的模块列表
	'MODULE_DENY_LIST'     	=>		array('Common','Runtime'),

	//设置默认访问模块
	'DEFAULT_MODULE'       	=>		'Home',

	//区分大小写
	'URL_CASE_INSENSITIVE' 	=>		false,

	// URL变量绑定到操作方法作为参数
	'URL_PARAMS_BIND'      	=>		true, 

	//数据库配置信息
	'db_type'				=> 		'mysql', //数据库类型
	'db_user'  				=> 		'root', //用户名
	'db_pwd'   				=> 		'1994228', //密码
	'db_host'  				=> 		'localhost', //服务器地址
	'db_port'  				=> 		3306, //端口
	'db_name'  				=> 		'answer_me', //数据库名
	'DB_CHARSET'			=> 		'utf8', // 字符集
	'DB_PREFIX'            	=>		'', //数据库表前缀

	// 关闭字段缓存
	'DB_FIELDS_CACHE'      	=>		false,

	//设置模板中标签的开始和结束标签
	'TMPL_L_DELIM'			=>		'<{',
	'TMPL_R_DELIM'			=>		'}>',

	//设置模板替换规则
	'TMPL_PARSE_STRING'  	=>		array(
		'__JS__'     		=>		'/answer_me/AnswerMe/Common/Static/js', // 增加新的js路径替换规则
		'__CSS__' 			=>		'/answer_me/AnswerMe/Common/Static/css', // 增加新的css路径替换规则
		'__RESOURCE__' 		=>		'/answer_me/AnswerMe/Common/Static/resource', // 增加新的resource路径替换规则
		'__IMG__' 			=>		'/answer_me/AnswerMe/Common/Static/img', // 增加新的img路径替换规则
		'__UEDITOR__' 		=>		'/answer_me/AnswerMe/Common/Static/ueditor' // 增加新的ueditor路径替换规则
	)

);