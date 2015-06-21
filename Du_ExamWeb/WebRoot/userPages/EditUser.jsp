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
	 <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
   <style type="text/css">
     span{font-size:9pt;color:#e4393c;margin-left:5px;}
     a{font-size:11pt;color:#e4393c;padding-left:5px;}
     	#studentCreate{margin:0 auto;width:50%;overflow:hidden;}
	.form-group{text-align:center;overflow:hidden;}
	form{text-align:center;margin:20px 0px;overflow:hidden;}
	.form-group{width:60%;overflow:hidden;}
  </style>
  <body>
    <h1 align="center">修改用户信息</h1>
    <hr>
    	<form id="studentCreate" action="<%=basePath %>ConfirmEditUserServlet?id=${Myuser.id}" name="form1" method="post" class="form-horizontal" onsubmit="return isValidate(form1)">
							<div class="form-group">
					<div class="col-xs-5" align="center" style="line-height:40px;">请选择用户类型：</div>
					<div class="col-xs-7">
						<select class="form-control"  name="usertype">
       <option value="1" <c:if test="${Myuser.type_in==1 }">selected="selected"</c:if> >管理员</option>
       <option value="2" <c:if test="${Myuser.type_in==2 }">selected="selected"</c:if>>学生</option>
       </select>
					</div>
					</div>
							<div class="form-group">									
									<label for="name" class="col-md-4 control-label">用户名：</label>
								   <div class="col-md-8">
									<input type="text" class="form-control input-lg" id="name" name="username" value="${Myuser.username }" />
								   </div>
							</div>	   
								<div class="form-group">
									<input type="hidden" id="sid" name="sid" />
									<label for="password" class="col-md-4 control-label">密码:</label>
									<div class="col-md-8">
										<input type="text" class="form-control input-lg" id="password" name="password" value="${Myuser.password }" />
									</div>
								</div>
								<div class="form-group">
							     	<div class="col-sm-offset-2 col-md-12">
               <button type="submit" class="btn btn-success">确认修改信息</button>
               <a class="btn btn-info" href="Listall" role="button">返回主页</a>
								</div>	
								</div>							
							</form>
							
  </body>
</html>
