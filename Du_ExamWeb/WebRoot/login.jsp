<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Home.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css" />

<script type="text/javascript" src="./js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="./js/layer/layer/layer.js"></script>
<script type="text/javascript" src="./js/js.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>



<style type="text/css">
html,body {
	height: 100%;
}

.box {
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
	background-image: linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}

.login-box {
	width: 100%;
	max-width: 500px;
	height: 460px;
	position: absolute;
	top: 50%;
	margin-top: -200px;
	/*设置负值，为要定位子盒子的一半高度*/
}

@media screen and (min-width:500px) {
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}

.form {
	width: 100%;
	max-width: 500px;
	height: 275px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}

.login-content {
	height: 361px;
	width: 100%;
	max-width: 500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}

.input-group {
	margin: 0px 0px 30px 0px !important;
}

.form-control,.input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px !important;
}

.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}

.login-title h1 {
	margin-top: 10px !important;
}

.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}

.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}

.selecttype {
	height: 65px;
}
</style>
<body>

	<div class="box">
		<h1 align="center" class="navbar"
			style="background-color:#6699FF;margin-top:0px">在线考试登陆系统</h1>
		<hr>
		<br>
		<br>
		<div class="login-box">
			<div class="login-title text-center">
				<h1>
					<small>登录</small>
				</h1>
			</div>
			<div class="login-content ">
				<div class="form">
					<form action="<%=basePath%>loginservlet?pageNum=1" method="post"
						name="form1" onsubmit="return isValidate(form1)">
						<div class="selecttype">
							<div class="col-xs-4" align="center" style="line-height:40px;">请选择用户类型：</div>
							<div class="col-xs-8">
								<select class="form-control" name="usertype">
									<option value="1">管理员</option>
									<option value="2" selected="selected">学生</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span> <input type="text"
										id="username" name="username" class="form-control username"
										placeholder="用户名">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input
										type="password" id="password" name="password"
										class="form-control pwd" placeholder="密码">
								</div>
							</div>
						</div>
						<div class="form-group form-actions">
							<div class="col-xs-4 col-xs-offset-4 ">
								<button type="submit" class="btn btn-sm btn-info">
									<span class="glyphicon glyphicon-off"></span> 登录
								</button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6 link">
								<p class="text-center remove-margin">
									<small>忘记密码？</small> <a href="javascript:void(0)"><small>找回</small></a>
								</p>
							</div>
							<div class="col-xs-6 link">
								<p class="text-center remove-margin">
									<small>还没注册?</small> <a
										href="<%=basePath%>/userPages/register.jsp"><small>注册</small></a>
								</p>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
