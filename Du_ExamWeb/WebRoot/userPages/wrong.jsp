<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'wrong.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="./js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="./js/layer/layer/layer.js"></script>
<script type="text/javascript">
$(function(){
layer.open({
    type: 1,
    title: ['ERROR', 'font-size:34px;color:#f00;text-align:center'],
    icon:5,
    shade:[0.6, '#7CFC00'],
    shift:1,
    closeBtn: false,
    skin: 'layui-layer-lan',
    content: $('#content')
});
});
</script>
<style type="text/css">
#contetn a{text-decoration:none;}
#content{
height:70px;
line-height:70px;
overflow:hidden;
}
.one{font-size:28px;color:#F83149;font-weight:bolder;}
.two{font-size:24px;color:#000000;font-weight:bolder;}
.three{font-size:28px;color:#FB3B4E;font-weight:bolder;}
.four{font-size:24px;color:#0CE854;font-weight:bolder;}
.five{font-size:28px;color:#1857DE;font-weight:bolder;}
.six{font-size:24px;color:#F831A1;font-weight:bolder;}
.seven{font-size:22px;color:#E84418;font-weight:bolder;}

.one:hover{font-size:28px;color:#0EFFE6;font-weight:bolder;}
.two:hover{font-size:24px;color:#0EFFE6;font-weight:bold;}
.three:hover{font-size:28px;color:#0EFFE6;font-weight:bolder;}
.four:hover{font-size:24px;color:#F83149;font-weight:bold;}
.five:hover{font-size:28px;color:#1857DE;font-weight:bolder;}
.six:hover{font-size:24px;color:#0EFFE6;font-weight:bolder;}
.seven:hover{font-size:22px;color:#0EFFE6;font-weight:bold;}

</style>
  </head>
  
  <body>
  <div id="content" style="text-align:center">
         <a href="<%=basePath %>"><i class="one">亲</i><i class="two">!</i><i class="three">请</i><i class="four">重</i><i class="seven">新</i><i class="five">登</i><i class="six">陆</i></a>
  </div>
  </body>
</html>
