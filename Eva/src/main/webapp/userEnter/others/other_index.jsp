<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'other_index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<frameset rows="100,*"  frameborder="no" border="0" framespacing="0">
    	<frame src="<%=basePath%>/userEnter/others/other_items_main.jsp" noresize="noresize" frameborder="no" name="top" scrolling="no" marginwidth="0" marginheight="0" target="head" />
        <frame src="<%=basePath%>/userEnter/others/training_list.jsp" name="rightmain" id="rightmain" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="rightmain" />
    </frameset>
  </head>
  
  <body>您的浏览器不支持框架。</body>
</html>
