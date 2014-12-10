<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<!--题目-->
		<title>AnswerMe-Template</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap CSS-->
		<link href="/answer_me/AnswerMe/Common/Static/css/bootstrap.min.css" rel="stylesheet">
		<!-- Flat UI CSS-->
		<link href="/answer_me/AnswerMe/Common/Static/css/flat-ui.css" rel="stylesheet">
		<!--模板css-->
		<link href="/answer_me/AnswerMe/Common/Static/css/template.css" rel="stylesheet">
		<!--添加你的CSS-->
		<link href="/answer_me/AnswerMe/Common/Static/css/homework.css" rel="stylesheet">

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
					    <li><a href="userHistory.html">编辑历史</a></li>
					    <li><a href="settings.html">设置</a></li>
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
						<div class = "middle">
				<div class = "header">
					<div class = "zuoyecishu">
					<h3>第一次作业</h3>
				    </div>
				    
					<div class ="a">
					<div class="heart">
					<span class="fui-heart" >
					<a class="like-num" href="javascript:;">20</a>
					</span>
				    </div>
				  

					<div class = "bianji">
					<button type="button" class="btn btn-default">编辑</button>
				    <a href=""></a>		
				    </div>

					<div class = "jubao">
					<button type="button" class="btn btn-default">举报</button>
				    <a href=""></a>		
				    </div>
					

					<div class="lishibanben dropdown">
  					<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
    				历史版本
   				 	<span class="caret"></span>
  					</button>
  					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
   					<li role="presentation">
   						<a role="menuitem" tabindex="-1" href="#">
   							<span class="number">第一个历史版本 </span>
   							<span class="date">2014-11-14</span>
   						</a>
   					</li>

   					<li role="presentation">
   						<a role="menuitem" tabindex="-1" href="#">
   							<span class="number">第二个历史版本 </span>
   							<span class="date">2014-11-14</span>
   						</a>
   					</li>
   					
   					<li role="presentation">
   						<a role="menuitem" tabindex="-1" href="#">
   							<span class="number">第三个历史版本 </span>
   							<span class="date">2014-11-14</span>
   						</a>
   					</li>
   					
   					<li role="presentation">
   						<a role="menuitem" tabindex="-1" href="#">
   							<span class="number">第四个历史版本 </span>
   							<span class="date">2014-11-14</span>
   						</a>
   					</li>
   					
   					<li role="presentation">
   						<a role="menuitem" tabindex="-1" href="#">
   							<span class="number">第五个历史版本 </span>
   							<span class="date">2014-11-14</span>
   						</a>
   					</li>

   					<li role="presentation">
   						<a role="menuitem" tabindex="-1" href="#">
   							<span class="number">第六个历史版本 </span>
   							<span class="date">2014-11-14</span>
   						</a>
   					</li>

   					<li role="presentation">
   						<a role="menuitem" tabindex="-1" href="#">
   							<span class="number">第七个历史版本 </span>
   							<span class="date">2014-11-14</span>
   						</a>
   					</li>
   					
   					<li role="presentation">
   						<a role="menuitem" tabindex="-1" href="#">
   							<span class="number">第八个历史版本 </span>
   							<span class="date">2014-11-14</span>
   						</a>
   					</li>
   					
   					<li role="presentation">
   						<a role="menuitem" tabindex="-1" href="#">
   							<span class="number">第九个历史版本 </span>
   							<span class="date">2014-11-14</span>
   						</a>
   					</li>
   					
   					<li role="presentation">
   						<a role="menuitem" tabindex="-1" href="#">
   							<span class="number">第十个历史版本 </span>
   							<span class="date">2014-11-14</span>
   						</a>
   					</li>

    				</ul>
					</div>
					</div>
				
                 </div>

			<div class = "zuoyeneirong">
			<div class = "t1">
				<p>1.What the five layers in the Internet protocol stack? What are the principal responsibilities of each of these layers?</p>
				<p>应用层： 应用层是网络应用层序机器应用层协议存留的地方。</p>	
				<p>运输层： 运输层提供了在应用程序断点之间传送应用层报文的服务。</p>
				<p>网络层： 因特网的网络层负责将称为数据报的网络层分组从一台主机移动到另外一台主机。</p>
				<p>链路层： 链路层将整个帧从一个网络元素一定到临近的网络元素。</p>
				<p>物理层： 物理层的任务是将该帧中的一个一个比特从一个节点移动到下一个节点。</p>
				<p>2.What is an application-layer message? A transport-layer segment? A network-layer datagram? A link-layer frame?</p>

				<p>Message:  位于应用层的信息分组称为报文</p>
				<p>Segment:  将运输层分组称为报文段</p>
				<p>Datagram: 被称为数据报的网络层</p>
				<p>Frame:    链路层分组称为帧</p>

				<p>3.What is a client program? What is a server program? Does a server program request and receive services from a client program?</p>
				<p>Client program:  运行在端系统上的程序，发送请求。</p>
				<p>Server program: 运行在端系统上的程序，接受服务。</p>	
				<p>客户程序不能从服务程序接收消息。</p>

				<p>4.What is a client program? What is a server program? Does a server program request and receive services from a client program?</p>
				<p>Client program:  运行在端系统上的程序，发送请求。</p>
				<p>Server program: 运行在端系统上的程序，接受服务。</p>	
				<p>客户程序不能从服务程序接收消息。</p>
				</p>
			</div>


			</div>

			</div>


		</div>
		<!-- /.内容 -->
		<!-- jQuery 的js -->
		<script src="/answer_me/AnswerMe/Common/Static/js/jquery.min.js"></script>
		<!-- 其他插件的js -->
		<script src="/answer_me/AnswerMe/Common/Static/js/flat-ui.min.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/prettify.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/application.js"></script>
		<!--添加你的js文件-->
		<script src="/answer_me/AnswerMe/Common/Static/js/homework.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/jquery.cookie.js"></script>
		<script src="/answer_me/AnswerMe/Common/Static/js/template.js"></script>
	</body>
</html>