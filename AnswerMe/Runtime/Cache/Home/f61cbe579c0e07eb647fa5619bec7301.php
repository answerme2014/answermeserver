<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<!--题目-->
		<title>AnswerMe-Settings</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap CSS-->
		<link href="/answer_me/AnswerMe/Common/Static/css/bootstrap.min.css" rel="stylesheet">
		<!-- Flat UI CSS-->
		<link href="/answer_me/AnswerMe/Common/Static/css/flat-ui.css" rel="stylesheet">
		<!--模板css-->
		<link href="/answer_me/AnswerMe/Common/Static/css/template.css" rel="stylesheet">
		<!--添加你的CSS-->
		<link href="/answer_me/AnswerMe/Common/Static/css/settings.css" rel="stylesheet">

		<!--收藏夹图标-->
		<link rel="shortcut icon" href="/answer_me/AnswerMe/Common/Static/resource/favor-icon.jpg">
		<style>
			body{
				margin-top: 1%;
				margin-left: 5%;
				margin-right: 5%;
			}
			#submit{
				background-color: #2c3e50!important;
				border-color: #2c3e50!important;
			}
		</style>
	</head>
		
	<body>	
		<!-- 内容 -->
		<h1>Server Test</h1>
		<span>data:</span>
		<input id="data" type="text" placeholder="key1=value1&key2=value2..." class="form-control" />
		<span>url:</span>
		<input id="url" type="text" placeholder="http://127.0.0.1/answer_me/home.php/xxpage/xxx" class="form-control" />
		<span>method:</span>
		<br>
		<select id="method" class="form-control select select-primary select-block mbl">
			<option value="POST">POST</option>
			<option value="GET">GET</option>
		</select>
		<br>
		<button id="submit" class="btn btn-primary">Submit</button>
		<br>
		<br>
		<span>Result:</span>
		<br>
		<div id="result"></div>
		<!-- /.内容 -->

		<!-- jQuery 的js -->
		<script src="/answer_me/AnswerMe/Common/Static/js/jquery.min.js"></script>
		<!-- 其他插件的js -->
		<script src="/answer_me/AnswerMe/Common/Static/js/flat-ui.min.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/prettify.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/application.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/jquery.cookie.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/template.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/test.js"></script>
		<!--添加你的js文件-->
	</body>
</html>