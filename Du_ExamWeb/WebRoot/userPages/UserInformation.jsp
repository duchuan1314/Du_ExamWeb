<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'EditUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
  </head>
   <style type="text/css">
    table{width:60%;margin:0 auto;height:25%;}
    .button{margin:10px auto;width:10%;}
  </style>
  <body>
    <h1 align="center">查看用户信息</h1>
    <hr>
    <table class="table-bordered">
    	<tr class="warning"><td>用户类型：</td><td><select class="form-control"  name="usertype" disabled>
       <option value="1" <c:if test="${user.type_in==1 }">selected="selected"</c:if> >管理员</option>
       <option value="2" <c:if test="${user.type_in==2 }">selected="selected"</c:if>>学生</option>
       </select></td></tr>
        <tr class="success"><td>用户名：</td><td>${user.username} </td></tr>
        <tr class="info"><td>是否参加考试:</td><td><input type="radio"<c:if test="${user.have_in == '是' }">checked=checked</c:if> disabled/>是&nbsp;<input type="radio" <c:if test="${user.have_in == '否' }">checked=checked</c:if> disabled/>否</td></tr>
    </table>
    <div class="button"><a href="Listall" class="btn btn-default btn-lg active" role="button">返回主页</a></div>	
  </body>
</html>
