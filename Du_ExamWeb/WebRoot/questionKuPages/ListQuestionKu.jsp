<i><%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'admin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles.css">
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
<style type="text/css">
ul,ol {
	list-style: none;
}

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

a {
	text-decoration: none;
	color: #057fac;
}

a:hover {
	text-decoration: none;
	color: #999;
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
	margin-left: 12px;
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
	<h1 align="center">题库管理</h1>
	<span>您是当前第<i>${count }</i>位登陆的用户
	</span>
	<hr>
	<div class="header">
		<a href="<%=request.getContextPath()%>">用户登陆首页</a> <a href=" Listall">用户管理</a>
		<a href="<%=basePath%>ListAllQuestion?pageNum=1">考题类型</a> <a
			href="<%=request.getContextPath()%>/questionKuPages/addQuestionKu.jsp">添加考题</a>
		<a href="LoginOutServlet">系统登出</a>
	</div>
	<div class="main" style="height:63%">
		<div id="container">
			<div id="content">
				<table cellspacing="0" cellpadding="0">
					<tr class="one">
						<td>考題编号</td>
						<td>题目</td>
						<td>选项A</td>
						<td>选项B</td>
						<td>选项C</td>
						<td>选项D</td>
						<td>答案</td>
						<td>备注</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${questionkuDatils2 }" var="questionkuDatils">
						<tr class="two">
							<td>${questionkuDatils.type_Code }</td>
							<td>${questionkuDatils.questionName }</td>
							<td>${questionkuDatils.optionA }</td>
							<td>${questionkuDatils.optionB}</td>
							<td>${questionkuDatils.optionC }</td>
							<td>${questionkuDatils.optionD }</td>
							<td>${questionkuDatils.answer }</td>
							<td>${questionkuDatils.comment }</td>
							<td><a href="FindQuestionKuServlet?id=${questionkuDatils.id }">查看</a></td>
							<td><a
								href="<%=request.getContextPath() %>/EditQuestionKuServlet?id=${questionkuDatils.id}">编辑</a></td>
							<td><a
								href="<%=request.getContextPath() %>/DeleteQuestionKu?id=${questionkuDatils.id}&pageNum=${currentPage}">删除</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		<div class="wrap"  >
				<div class="fenye">
					<ul>
					
						<li id="first"><a <c:if  test="${currentPage>1}"> href="<%=basePath%>ListAllQuestionKuDatil?pageNum=1"</c:if>>首页</a></li>
						<li id="top" onclick="topclick()"><a <c:if  test="${currentPage>1}"> href="<%=basePath%>ListAllQuestionKuDatil?pageNum=${currentPage-1}"</c:if>>上一页</a></li>
						<li class="xifenye" id="xifenye"><a id="xiye">${currentPage}</a>/<a
							id="mo">${endpageNum2}</a>
							<div class="xab" id="xab" style="display:none">
								<ul id="uljia">
								</ul>
							</div></li>
						<li id="down" onclick="downclick()"><a <c:if test="${currentPage<endPageNum}" var="endPageNum">href="<%=basePath%>ListAllQuestionKuDatil?pageNum=${currentPage+1}"	</c:if>>下一页</a></li>
						<li id="last"><a href="<%=basePath%>ListAllQuestionKuDatil?pageNum=${endpageNum2}">末页</a></li>
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