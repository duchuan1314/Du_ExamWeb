<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editQuestion.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
     <h1 align="center">查看考题类型</h1>
    <hr>
  	<form id="studentCreate" action="<%=basePath %>seeQuestionType?id=${question.id}" name="form1" method="post" class="form-horizontal" onsubmit="return isValidate(form1)">
							<div class="form-group">									
									<label for="name" class="col-md-4 control-label">考题编号：</label>
								   <div class="col-md-8">
									<input type="text" class="form-control input-lg" id="name" name="qnumber" onblur="usernameCheck(form1)"  value="${question.typeCode} " disabled/><span id="tip"></span>
								   </div>
							</div>	   
								<div class="form-group">
									<input type="hidden" id="sid" name="sid" />
									<label for="password" class="col-md-4 control-label">考题类型：</label>
									<div class="col-md-8">
										<input type="text" class="form-control input-lg" id="password" name="qname" value="${question.typeName} " disabled/>
									</div>
								</div>
								<div class="form-group">
							     	<div class="col-sm-offset-2 col-md-12">
               <a class="btn btn-info" href="ListAllQuestion?pageNum=1" role="button">返回主页</a>
								</div>	
								</div>							
							</form>
  
  </body>
</html>
