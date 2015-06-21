<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addQuestionPage.jsp' starting page</title>
    
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
     	#studentCreate{margin:0 auto;width:53%;overflow:hidden;}
	.form-group{text-align:center;overflow:hidden;}
	.form-group{width:60%;overflow:hidden;}
	h1{font-weight:bolder; font-family:"经典圆体繁", "microsoft yahei", "Arial Rounded MT Bold", "Helvetica Rounded", Arial, sans-serif;
text-shadow: 0 8px 9px #c4b59d, 0px -2px 1px #fff;}
  </style>
  <body>
   <h1 align="center">添加考题</h1>
    <hr>
    	<form id="studentCreate" action="<%=basePath %>addQuestionKuServlet" name="form1" method="post" class="form-horizontal" onsubmit="return isValidate(form1)">
							<div class="form-group">									
									<label for="type_Code" class="col-md-4 control-label">考题编号：</label>
								   <div class="col-md-8">
									<input type="text" class="form-control input-sm" id="type_Code" name="type_Code" onblur="usernameCheck(form1)" /><span id="tip"></span>
								   </div>
							</div>	   
								<div class="form-group">
									<label for="questionName" class="col-md-4 control-label">题目：</label>
									<div class="col-md-8">
										<input type="text" class="form-control input-sm" id="questionName" name="questionName" />
									</div>
								</div>
								<div class="form-group">
									<label for="optionA" class="col-md-4 control-label">选项A：</label>
									<div class="col-md-8">
										<input type="text" class="form-control input-sm" id="optionA" name="optionA" />
									</div>
								</div>
								<div class="form-group">
									<label for="optionB" class="col-md-4 control-label">选项B：</label>
									<div class="col-md-8">
										<input type="text" class="form-control input-sm" id="optionB" name="optionB" />
									</div>
								</div>
								<div class="form-group">
									<label for="optionC" class="col-md-4 control-label">选项C：</label>
									<div class="col-md-8">
										<input type="text" class="form-control input-sm" id="optionC" name="optionC" />
									</div>
								</div>
								<div class="form-group">
									<label for="optionC" class="col-md-4 control-label">选项D：</label>
									<div class="col-md-8">
										<input type="text" class="form-control input-sm" id="optionD" name="optionD" />
									</div>
								</div>
								<div class="form-group">
									<label for="answer" class="col-md-4 control-label">答案：</label>
									<div class="col-md-8">
										<input type="text" class="form-control input-sm" id="answer" name="answer" />
									</div>
								</div>
								<div class="form-group">
									<label for="comment" class="col-md-4 control-label">备注：</label>
									<div class="col-md-8">
										<input type="text" class="form-control input-lg" id="comment" name="comment" />
									</div>
								</div>
								<div class="form-group">
							     	<div class="col-sm-offset-2 col-md-12">
               <button type="submit" class="btn btn-success" id="register">确认添加考题类型</button>
               <a class="btn btn-info" href="ListAllQuestion" role="button">返回主页</a>
								</div>	
								</div>							
							</form>
  </body>
</html>
