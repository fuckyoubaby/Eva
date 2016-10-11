<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>主页</title>

    <!-- Bootstrap -->
    <link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
	<style>
		body{background-color: #F3F4F5;}
	</style>


	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.11.0.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

<frameset cols="240,*" id="mainframe" frameborder="no" border="0" framespacing="0">
    <frame src="<%=basePath%>adminEnter/common/common_leftside.jsp" name="left" id="left" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="left" />
   <%--  <frame src="<%=basePath%>adminEnter/common/system_switch.jsp" name="mid" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" /> --%>
    <frameset rows="40,*,50"  frameborder="no" border="0" framespacing="0">
        <frame src="<%=basePath%>adminEnter/common/common_rightside_header.jsp" noresize="noresize" frameborder="no" name="top" scrolling="no" marginwidth="0" marginheight="0" target="righthead" />
        <frame src="<%=basePath%>adminEnter/common/common_main.jsp" name="main" id="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="main" />
        <frame src="<%=basePath%>adminEnter/common/common_footer.jsp" name="foot" id="foot" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="foot" />
    </frameset>
 </frameset>
<noframes>
	<body>你的浏览器不支持框架</body>
</noframes>
</html>