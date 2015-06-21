<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	%> 
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'admin.jsp' starting page</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript" src="./js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="./js/public.js"></script>
<script type="text/javascript" src="./js/layer/layer/layer.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: #f1f1f1;
	font: 70% Arial, Helvetica, sans-serif;
	color: #555;
	line-height: 150%;
	text-align: left;
	overflow: hidden;
}
ul,ol,a{list-style:none;}
.footer {
	width: 100%;
	height: 100px;
	background-color: #000;
	position: absolute;
	bottom: 0px;
}

.footer_link li {
	float: left;
	width: 80px;
}

.footer_link li a {
	text-decoration: none;
	font-size: 18px;
	color: #f00;
}

.footer_intro {
	float: left;
	padding-top: 30px;
}

.footer_link li a:hover {
	color: #f00;
}

.footer_link {
	float: right;
	font-size: 10pt;
	padding-top: 40px;
}
i{color:#f00;font-size:30px;}
</style>
</head>
<body>
	<%
		int count = 1;
		if (session.getAttribute("count") != null) {
			count = Integer.parseInt(session.getAttribute("count").toString());
			++count;
		}
		session.setAttribute("count", count);
	%>
	<h1 align="center">在线考试页面！用户<i>${user.username }</i>请点击开始考试按钮！</h1>
	<hr>
	<div class="container" style="height:63%">
			<a href="#" class="btn btn-primary btn-lg btn-block">登陆首页</a>
		<a href="<%=basePath%>StartTestServlet" class="btn btn-danger btn-lg btn-block">开始考试</a> 
		<a href="QueryGrade" class="btn btn-primary btn-lg btn-block">查询分数</a> 
		<a href="ChangePassword" class="btn btn-primary btn-lg btn-block" >修改密码</a> 
		<a href="LoginOutServlet" class="btn btn-primary btn-lg btn-block">系统登出</a>
	</div>
	<div class="footer">
		<div class="waper">
			<div class="footerwaper clearfix">
				<div class="footer_intro">
					<div class="footer_logo"></div>
					<p>我们的使命:传播互联网最前沿技术，帮助更多的人实现梦想！</p>
					<p>Copyright © 2015 imooc.com All Rights Reserved | 京ICP备
						13046642号-2</p>
				</div>
				<div class="footer_link">
					<ul>
						<li><a href="http://www.imooc.com/" target="_blank">网站首页</a></li>
						<li><a href="/about/job" target="_blank">人才招聘</a></li>
						<li><a href="/about/contact" target="_blank">联系我们</a></li>
						<li><a href="/subject/html" target="_blank">专题页面</a></li>
						<li><a href="/about/us" target="_blank">关于我们</a></li>
						<li><a href="/about/recruit" target="_blank">讲师招募</a></li>
						<li><a href="/user/feedback" target="_blank">意见反馈</a></li>
						<li><a href="/about/friendly" target="_blank">友情链接</a></li>
					</ul>
				</div>
				<div class="followus">
					<a class="followus-weixin" href="javascript:;" target="_blank"
						title="微信">
						<div class="flw-weixin-box"></div>
					</a> <a class="followus-weibo" href="http://weibo.com/u/3306361973"
						target="_blank" title="新浪微博"></a> <a class="followus-qzone"
						href="http://user.qzone.qq.com/1059809142/" target="_blank"
						title="QQ空间"></a>
				</div>
			</div>
		</div>
	</div>
</body>
	</html>