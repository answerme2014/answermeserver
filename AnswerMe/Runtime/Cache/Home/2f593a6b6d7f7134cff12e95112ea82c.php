<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<!--题目-->
		<title>AnswerMe-个人主页</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap CSS-->
		<link href="/answer_me/AnswerMe/Common/Static/css/bootstrap.min.css" rel="stylesheet">
		<!-- Flat UI CSS-->
		<link href="/answer_me/AnswerMe/Common/Static/css/flat-ui.css" rel="stylesheet">
		<!--模板css-->
		<link href="/answer_me/AnswerMe/Common/Static/css/template.css" rel="stylesheet">
		<!--添加你的CSS-->
		<link href="/answer_me/AnswerMe/Common/Static/css/myhome.css" rel="stylesheet">
		<link href="/answer_me/AnswerMe/Common/Static/css/classpage.css" rel="stylesheet">
		<!--收藏夹图标-->
		<link rel="shortcut icon" href="/answer_me/AnswerMe/Common/Static/resource/favor-icon.jpg">
	</head>
	<body>	
		<!-- 导航栏 -->
		<nav class="navbar navbar-inverse" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">
					<img src="/answer_me/AnswerMe/Common/Static/resource/logo-green.jpg">
					<span>Answer Me</span>
				</a>
			</div>
			<!--导航栏右侧状态(未登录/登陆后)-->
			<div class="collapse navbar-collapse" id="navbar-collapse-01">
				<div class="loged hidden">
					<span class="fui-user"></span>
					<a href="myhome.html" id="usersname">KenLee</a>
					<span class="fui-heart"></span>
					<a href="like.html" class="like-num">256</a>
					<div class="btn-group">
					  <button id="chooseBtn" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					   more <span class="caret"></span>
					  </button>
					  <ul id="dropdownMenu" class="dropdown-menu" role="menu">
					    <li><a href="#">编辑历史</a></li>
					    <li><a href="#">设置</a></li>
					    <li class="divider"></li>
					    <li><a id="logout_">退出</a></li>
					  </ul>
					</div>
				</div>
				<div class="unloged">
					<div id="btnNav" class="nav navbar-nav navbar-right btn-group">
						<button id="btnRegister" class="btn btn-sm navbar-btn" type="button" data-toggle="modal" data-target="#modalLogin">登录</button>
						<button id="btnLogin" class="btn btn-sm navbar-btn" type="button" data-toggle="modal" data-target="#modalRegister">注册</button>
					</div>
				</div>
			</div>
		</nav>
		<!-- /.导航栏 -->
		<!-- 模态框 -->
		<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">登录</h4>
			</div>
			<div class="modal-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="inputUsername" id="labelUsername" class="col-sm-2 control-label">账号</label>
								<div class="col-sm-10">
									<input type="username" class="form-control" id="inputUsername" placeholder="输入账号">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" id="labelPassword" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPassword" placeholder="输入密码">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label>
											<input type="checkbox"> 记住我
										</label>
										<label id="freeLog">
											<input type="checkbox"> 自动登录
										</label>
										<label id="forgetPassword">
											<input type="checkbox"> 忘记密码
										</label>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-block" data-dismiss="modal" id="login_">登录</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="modalRegister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">注册</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="inputUsername1" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputUsername1">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword1" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPassword1">
								</div>
							</div>
							<div class="form-group">
								<label for="inputRepeatpassword" class="col-sm-2 control-label">重复密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputRepeatpassword">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputEmail">
								</div>
							</div>							
							<div class="form-group">
								<label for="inputSchool" class="col-sm-2 control-label">学校</label>
								<select class="form-control" id="selectSchool">
									<option>选择你的学校</option>
									<option>中山大学</option>
									<option>清华大学</option>
									<option>北京大学</option>
									<option>华南理工大学</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputCollege" class="col-sm-2 control-label">学院</label>
								<select class="form-control" id="selectCollege">
									<option>选择你的学院</option>
									<option>软件学院</option>
									<option>岭南学院</option>
									<option>医学院</option>
									<option>社会教育学院</option>
									<option>信息科学与技术学院</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputMajor" class="col-sm-2 control-label">专业</label>
								<select class="form-control" id="selectMajor">
									<option>选择你的专业</option>
									<option>数字媒体</option>
									<option>电子政务</option>
									<option>嵌入式软件</option>
									<option>通用软件</option>
									<option>计算机应用</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputYear" class="col-sm-2 control-label">入学年份</label>
								<select class="form-control" id="selectYear">
									<option>选择你的入学年份</option>
									<option>2014</option>
									<option>2013</option>
									<option>2012</option>
									<option>2011</option>
									<option>2010</option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-block" id="register_">确认注册</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /.模态框 -->
		<!-- 内容 -->
		<div id="content" class="container">
			<!-- 大家在content中填写自己的页面内容 -->
			<!-- 把你的css添加到上面的css中，把你的js添加到下面的js中-->
			<!-- 除了添加，不要改动一切其他东西-->

			<div class="left">
				<div class="col-xs-4">
					<div class="course-list todo">
						<div class="course-search todo-search">
							<select class="search-type">
								<option value="course-tosearch">课程</option>
								<option value="problem-tosearch">习题</option>
							</select>
							<input class="course-search-field todo-search-field" type="search" value="" placeholder="Search" />
						</div>
						<ul>
							<li class="course-list-item">
								<div class="course-content todo-content">
									<h4 class="course-name todo-name">Web安全</h4>
								</div>
							</li>
							<li class="course-list-item">
								<div class="course-content todo-content">
									<h4 class="course-name todo-name">编译原理</h4>
								</div>
							</li>
							<li class="course-list-item">
								<div class="course-content todo-content">
									<h4 class="course-name todo-name">算法导论</h4>
								</div>
							</li>
							<li class="course-list-item">
								<div class="course-content todo-content">
									<h4 class="course-name todo-name">计算机网络</h4>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="right">
				<div class="col-xs-6 homework">
					<ul class="homework-list">
						<li class="homework-list-item">
							<div class="homework-content">
								<div class="hw-name">
									<h4 class="hw-course"><a href="homework.html">Web安全</a></h4>
								</div>
								<span class="hw-tag">第</span>
								<span class="hw-tag hw-count">1</span>
								<span class="hw-tag">次</span>
								<span class="hw-tag">作</span>
								<span class="hw-tag">业</span>
								<div class="homework-contents">
									MD5是计算机广泛使用的散列算法之一，用于确保信息传输的完整性和一致性。一段不定长度的信息经过MD5程序后，会生成四个32位数据，也就是128位的长度。介绍一下MD5的算法以及在密码保护上的应用。
								</div>
								<div class="hw-ddl">截止日期：</div>
								<span class="hw-ddl-date">2014-10-05 23:59</span>
								<span class="finish-bt">
									<button class="btn btn-primary">完成</button>
								</span>
							</div>
						</li>
						<li class="homework-list-item">
							<div class="homework-content">
								<div class="hw-name">
									<h4 class="hw-course"><a href="homework.html">计算机网络</a></h4>
								</div>
								<span class="hw-tag">第</span>
								<span class="hw-tag hw-count">1</span>
								<span class="hw-tag">次</span>
								<span class="hw-tag">作</span>
								<span class="hw-tag">业</span>
								<div class="homework-contents">
									每小组讨论完成，以小组为单位提交，只需组长提交即可，组员无需提交。<br/>

									文件命名：树莓1班-TEAM-XX-Protocol.doc或.pdf。<br/>

									提交文件中需列出小组成员及学号。<br/>

									协议规模由你们要完成的功能决定，在覆盖基本功能的基础上，越完整越好，不是越多越好。协议的例子可以参考第２章的内容，例如参考ＨＴＴＰ协议：ＰＰＴ29-34页。<br/>

									主要定义好有哪些messages，例如：加入、离开、获得在线用户、文本聊天消息等等；以及message的格式，例如以ASCII字符串的格式，message中参数之间以什么符号隔开，什么符号表示这条message结束等等；以及收到这条message的动作，简要描述一下过程，客户端收到应该做什么，服务端收到应该做什么。
								</div>
								<div class="hw-ddl">截止日期：</div>
								<span class="hw-ddl-date">2014-10-05 23:59</span>
								<span class="finish-bt">
									<button class="btn btn-primary">完成</button>
								</span>
							</div>
						</li>
						<li class="homework-list-item">
							<div class="homework-content">
								<div class="hw-name">
									<h4 class="hw-course"><a href="homework.html">编译原理</a></h4>
								</div>
								<span class="hw-tag">第</span>
								<span class="hw-tag hw-count">1</span>
								<span class="hw-tag">次</span>
								<span class="hw-tag">作</span>
								<span class="hw-tag">业</span>
								<div class="homework-contents">
									HW2.<br/>
									提交文件： <br/>
									calculator.y (bison文件) <br/>
									token.l(ﬂex文件) <br/>
									make.sh/make.bat(windows下) （编译脚本） <br/>
									README (填写需要说明的内容)<br/>

								</div>
								<div class="hw-ddl">截止日期：</div>
								<span class="hw-ddl-date">2014-10-05 23:59</span>
								<span class="finish-bt">
									<button class="btn btn-primary">完成</button>
								</span>
							</div>
						</li>
					</ul>

					<div class="tips">
						<h4><img src="/answer_me/AnswerMe/Common/Static/resource/mier.png">你真棒！没有要写的作业啦~</h4>
					</div>

					<div class="course-page">
						<div class="info-bar">
							<div class="course-info-bar">
								<div class="photo">
									<img class="photo"src="/answer_me/AnswerMe/Common/Static/resource/sd.jpg" alt="bookpic">
								</div>
								<div class="info">
									<span class="class-name">算法分析与设计</span>
									<a span class="fui-new edit" href="#"></a>
									<br>
									<span class="else">任课教师：郭嵩山</span>
									<br>
									<span class="else">上课地点：公共教学楼C103</span>
									<br>
									<span class="else">上课时间：星期二第三节至第五节</span>
									<br>
									<div class="dropdown" id="download">
										<button class="btn btn-default dropdown-toggle" type="button" id="download" data-toggle="dropdown">
										下载
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu" aria-labelledby="download">
											<li role="presentation"><a role="menuitem" tabindex="-1" href="#">一.ppt</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1" href="#">二.ppt</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1" href="#">三.ppt</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1" href="#">四.ppt</a></li>
										</ul>
									</div>
									<br>
								</div>
								<div class="takelike">
									<span class="fui-heart add" id="good-img"></span>
									<span class="else else-num" id="good">68</span>
								</div>
							</div>

							<div class="h-list-info">
								<div class="hw-list-info">
									<div class="tile hw-list">
										<div class="title">第一次作业</div>
										<span>作业 : </span>
										<div>
			  								<div class="hw-detail">1.《算法导论》求递归时间复杂度“主方法”的证明</div>
			  								<div class="hw-answer">解:我们先假设一个结论T(n) = O(lg(n - b))，并且假设对T(n / 2上取整)成立（这就是数学归纳法了），那么把T(n / 2上取整)用假设的结论进行代换，我们有T(n) <= lg((n - b)) / 2上取整)

											<= lg((n - b) / 2 + 1) + 1 = lg(n - b + 2),对于任意的b >= 2...</div>
										</div>
										<div class="readmore">
			 								<a href="...">ReadMore...>> </a>
										</div>
	   								</div>
	    							<div class="tile hw-list">
										<div class="title">第二次作业</div>
										<span>作业 : </span>
										<div>
			    							<div class="hw-detail">1.《算法导论》求递归时间复杂度“主方法”的证明</div>
			    							<div class="hw-answer">解:我们先假设一个结论T(n) = O(lg(n - b))，并且假设对T(n / 2上取整)成立（这就是数学归纳法了），那么把T(n / 2上取整)用假设的结论进行代换，我们有T(n) <= lg((n - b)) / 2上取整)

											<= lg((n - b) / 2 + 1) + 1 = lg(n - b + 2),对于任意的b >= 2...</div>
										</div>
										<div class="readmore">
			  								<a href="...">ReadMore...>> </a>
										</div>
	    							</div>
	    							<div class="tile hw-list">
										<span class="else"><a class="book" href="...">添加新的作业</a></span>
	    							</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- jQuery 的js -->
		<script src="/answer_me/AnswerMe/Common/Static/js/jquery.min.js"></script>
		<!-- 其他插件的js -->
		<script src="/answer_me/AnswerMe/Common/Static/js/flat-ui.min.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/prettify.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/application.js"></script>
		<!--添加你的js文件-->
		<script src="/answer_me/AnswerMe/Common/Static/js/myhome.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/jquery.cookie.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/template.js"></script>
	</body>
</html>