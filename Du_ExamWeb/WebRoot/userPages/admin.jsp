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
<link href="./css/tablecloth.css" rel="stylesheet" type="text/css"
	media="screen" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript" src="./js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="./js/tablecloth.js"></script>
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

ul,ol {
	list-style: none;
}

a {
	text-decoration: none;
	color: #057fac;
}

a:hover {
	text-decoration: none;
	color: #999;
}

img {
	border: none;
}

a,a:visited {
	text-decoration: none;
}

.tong {
	background: url(../images/images/sy-toubjing_03.gif) repeat-x 0px -11px;
	width: 100%;
	height: 40px;
}

.wrap {
	width: auto;
	max-width: 320px;
	margin: 0 auto;
}

.center {
	width: 103%;
	margin: 0 auto;
}

/***************分页******************/
.fenye {
	float: left;
	margin-top: 10px;
}

.fenye ul {
	float: left;
	margin-left: 10px;
}

.fenye ul li {
	float: left;
	margin-left: 5px;
	padding: 4px 6px;
	border: 1px solid #ccc;
	font-weight: bold;
	cursor: pointer;
	color: #3385FF;
}

.fenye ul li a {
	color: #3385FF;
}

.fenye ul li.xifenye {
	width: 38px;
	text-align: center;
	float: left;
	position: relative;
	cursor: pointer;
}

.fenye ul li .xab {
	float: left;
	position: absolute;
	width: 39px;
	border: 1px solid #ccc;
	height: 123px;
	overflow-y: auto;
	overflow-x: hidden;
	top: -125px;
	background-color: #fff;
	display: inline;
	left: -1px;
	width: 50px;
}

.fenye ul li .xab ul {
	margin-left: 0;
	padding-bottom: 0;
}

.fenye ul li .xab ul li {
	border: 0;
	padding: 4px 0px;
	color: #999;
	width: 34px;
	margin-left: 0px;
	text-align: center;
}

h1 {
	font-size: 140%;
	margin: 0 20px;
	line-height: 80px;
}

h2 {
	font-size: 120%;
}

#container {
	margin: 0 auto;
	width: 80%;
	background: #fff;
	padding-bottom: 20px;
}

#content {
	margin: 0 auto;
	width: 90%;
}

p.sig {
	margin: 0 auto;
	width: 680px;
	padding: 1em 0;
}

form {
	margin: 1em 0;
	padding: .2em 20px;
	background: #eee;
}

span i {
	color: #f00;
	font-size: 28px;
}

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
</style>
</head>
<body>
	<%
		int count = 1;
		if (session.getAttribute("count") != null) {
			count = Integer.parseInt(session.getAttribute("count")
					.toString());
			++count;
		}
		session.setAttribute("count", count);
	%>
	<h1 align="center">用户管理</h1>
	<span>您是当前第<i>${count }</i>位登陆的用户
	</span>
	<hr>
	<div class="header">
		<a href="#">用户登陆首页</a> <a href="ListAllQuestion?pageNum=1">考题类型</a> <a
			href="<%=basePath%>ListAllQuestionKuDatil?pageNum=1">题库管理</a> <a
			href="userPages/register.jsp" id="red">添加用户</a> <a
			href="LoginOutServlet">系统登出</a>
		<h3 align="right">
			欢迎用户&nbsp;<i><%=request.getParameter("username")%></i>&nbsp;登陆
		</h3>
	</div>
	<div class="main" style="height:63%">

		<div id="container">
			<div id="content">
				<table cellspacing="0" cellpadding="0">
					<tr class="one">
						<td>考生编号</td>
						<td>考生姓名</td>
						<td>密码</td>
						<td>用户类型</td>
						<td>是否参加考试</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${user2 }" var="user">
						<tr class="two">
							<td>${user.id }</td>
							<td>${user.username }</td>
							<td>${user.password }</td>
							<td><c:if test="${user.type_in==1 }">管理员</c:if> <c:if
									test="${user.type_in==2 }">普通用户</c:if></td>
							<td><c:if test="${user.have_in=='2' }">是</c:if><c:if test="${user.have_in=='1' }">否</c:if></td>
							<td><a href="SearchUserServlet?id=${user.id }">查看</a></td>
							<td><a
								href="<%=request.getContextPath() %>/EditUserServlet?id=${user.id}">编辑</a></td>
							<td><a
								href="<%=request.getContextPath() %>/delete?id=${user.id}">删除</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!--下一页--->
			<div class="wrap">
				<div class="fenye">
					<ul>
						<li id="first"><a
							<c:if  test="${currentPage >1 }"> href="<%=basePath%>Listall?pageNum=1" </c:if>>首页</a></li>
						<li id="top" onclick="topclick()">
						<a <c:if  test="${currentPage >1 }">href="<%=basePath%>Listall?pageNum=${currentPage-1}" </c:if> >上一页</a></li>
						<li class="xifenye" id="xifenye"><a id="xiye">${currentPage}</a>/<a
							id="mo">${endPagenum}</a>
							<div class="xab" id="xab" style="display:none">
								<ul id="uljia">
								</ul>
							</div></li>
						<li id="down" onclick="downclick()"><a
							<c:if test="${currentPage < endPagenum }" var="endPagenum">href="<%=basePath%>Listall?pageNum=${currentPage+1}"	</c:if>>下一页</a></li>
						<li id="last"><a
							href="<%=basePath%>Listall?pageNum=${endpageNum2}">末页</a></li>
					</ul>
				</div>
			</div>
		</div>
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