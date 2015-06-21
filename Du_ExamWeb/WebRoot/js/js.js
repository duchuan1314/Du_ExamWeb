function isValidate(form){
	username = form.username.value;
	password = form.password.value;
	if(!minlength(username,3)){
		layer.tips('用户名长度不能小于3', '.username', {
		    tips: [2, '#78BA32'],
		    tipsMore:true
		});
		form.username.focus();
		return false;
	}
    if(!maxlength(username,10)){
    	layer.tips('用户名长度不能大于10', '.username', {
		    tips: [2, '#78BA32'],
		    tipsMore:true
		});
    	form.username.focus();
    	return false;
    }
    if(!minlength(password,6)){
    	layer.tips('密码长度不能小于6', '.pwd', {
		    tips: [2, '#E84000'],
		    tipsMore:true
		});
    	form.password.focus();
    	return false;
    }
   if(!maxlength(password,12)){
	   layer.tips('密码长度不能大于12', '.pwd', {
		    tips: [2, '#E84000'],
		    tipsMore:true
		});
	   form.password.focus();
	   return false;
   }	
   return true;
}
 function minlength(str,length){
	 if(str.length>=length){return true;}
	 else {return false;}
 }
 function maxlength(str,length){
	 if(str.length<=length) {return true;}
	 else {return false;}
 }
 
 var xmlreq=false;
 function createXmlHttpRequest(){
	 if(window.XMLHttpRequest){
	 xmlreq=new XMLHttpRequest();
	 }else if(window.ActiveXobject){
	 try{
	 xmlreq = new ActiveXobject("Msxm12.XMLHTTP");
	 }catch(e1){
	 try{
	 xmlreq = new ActiveXobject("Miscoft.XMLHTTP");
	 }catch(e2){
	 }
	 }
	 }
	 return xmlreq;
	 }
 
 function responseMethod(){
	 if(xmlreq.readyState==4&& xmlreq.status==200)
	 {
		 
		var responseContext = xmlreq.responseText;     //如果注册名检查有效   
		 
		if (responseContext == "2"){     
			document.getElementById("tip").innerHTML="该用户名已经被注册！请重新填写用户名！";
			 document.getElementById("register").disabled="true";
			 }
		 else{      
			 document.getElementById("tip").innerHTML="恭喜您，此用户名可以使用！";
			 document.getElementById("register").disabled="";
			 }
		 }
 }
 
 function usernameCheck(form2){
	 createXmlHttpRequest();
	 xmlreq.open("post","ValidationServlet?username="+form2.username.value+"&&password="+form2.password.value,true);
	 xmlreq.send(null);
	 xmlreq.onreadystatechange = responseMethod;
	 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 













