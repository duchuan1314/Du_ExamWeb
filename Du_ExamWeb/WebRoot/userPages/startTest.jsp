<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'startTest.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="./js/iCheck/skins/all.css" />
<link rel="stylesheet" type="text/css" href="./js/iCheck/demo/css/custom.css" />
<script type="text/javascript" src="./js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="./js/tablecloth.js"></script>
<script type="text/javascript" src="./js/layer/layer/layer.js"></script>
<script type="text/javascript" src="./js/iCheck/icheck.min.js"></script>
</head>
<style type="text/css">
 body{background-color:#F1F1F1;}
 h1 {
 	text-align:center;
	font-weight: bolder;
	font-family: "经典圆体繁", "microsoft yahei", "Arial Rounded MT Bold", "Helvetica Rounded", Arial, sans-serif;
	text-shadow: 0 8px 9px #c4b59d, 0px -2px 1px #fff;
	font-size:36px;
}
input{padding-left:1em;}
</style>
<body>
   <h1>请认真答题！</h1>
   <hr>
   <div class="container" >
   <div class="row">
    <div class="col-md-7 col-md-offset-3 demo-list">
	<form action="TurnInServlet" method="post">
		<c:forEach items="${questionTypes }" var="questionType"  varStatus="status">
			<c:if test="${status.index+1 ==1 }">一、</c:if>
			<c:if test="${status.index+1 ==2 }">二、</c:if>
			<c:if test="${status.index+1 ==3 }">三、</c:if>
  ${questionType.typeName }(共${questionType.questionNum }道题，每题${questionType.grade }分)<br>
			<c:forEach items="${questionType.questions }" var="question" varStatus="status2">
  ${status2.index+1 }.${question.questionName }<br>
				<c:choose>
					<c:when test="${questionType.typeName=='判断题' }">
						<input type="radio" value="${question.optionA }" name="${question.id }" />${question.optionA }<br>
						<input type="radio" value="${question.optionB }" name="${question.id }" />${question.optionB }<br>
					</c:when>
					<c:when test="${questionType.typeName=='单选题' }">
						A.<input type="radio" value="A" name="${question.id }" />${question.optionA }<br>
						B.<input type="radio" value="B" name="${question.id }" />${question.optionB }<br>
						C.<input type="radio" value="C" name="${question.id }" />${question.optionC }<br>
						D.<input type="radio" value="D" name="${question.id }" />${question.optionD }<br>
					</c:when>
					<c:otherwise>
						A.<input type="checkbox" value="A" name="${question.id }" />${question.optionA }<br>
						B.<input type="checkbox" value="B" name="${question.id }" />${question.optionB }<br>
						C.<input type="checkbox" value="C" name="${question.id }" />${question.optionC }<br>
						D.<input type="checkbox" value="D" name="${question.id }" />${question.optionD }<br>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:forEach>
		<br>
		<input class="btn btn-danger btn-lg"  type="submit" value="提交试卷">
	</form>
    </div>	
 </div>
</div>
<script type="text/javascript">
 $(function(){
	 layer.msg('考试开始！', {
		    icon: 6,
		    time: 2000 ,
		    shift:6
		}, function(){
		});  
 });
</script>
</body>
</html>
