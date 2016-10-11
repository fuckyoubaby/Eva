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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>主页面</title>

    <!-- Bootstrap -->
    <link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">

	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.11.0.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <!--<frameset rows="50,*"  frameborder="no" border="0" framespacing="0">
  <frame src="common/common_rightside_header.html" noresize="noresize" frameborder="no" name="top" scrolling="no" marginwidth="0" marginheight="0" target="main" />
  <frameset cols="200,10,*" id="mainframe" frameborder="no" border="0" framespacing="0">
    <frame src="common/common_leftside.html" name="left" id="left" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="main" />
	<frame src="common/common_switch.html" name="mid" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" />
    <frame src="common/common_main.html" name="main" id="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="_self" />
  </frameset>
</frameset>-->

     <!-- <frame src="common/common_rightside_header.html" noresize="noresize" frameborder="no" name="top" scrolling="no" marginwidth="0" marginheight="0" target="main" />-->
      <frameset cols="230,10,*" id="mainframe" frameborder="no" border="0" framespacing="0">
          <frame src="<%=basePath%>/userEnter/common/common_leftside.jsp" name="left" id="left" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="left" />
          <frame src="common/common_switch.html" name="mid" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" />
          <frameset rows="40,*,30"  frameborder="no" border="0" framespacing="0">
              <frame src="<%=basePath%>/userEnter/common/common_rightside_header.jsp" noresize="noresize" frameborder="no" name="top" scrolling="no" marginwidth="0" marginheight="0" target="righthead" />
              <frame src="<%=basePath%>/userEnter/common/common_main.jsp" name="main" id="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="main" />
          </frameset>
          </frameset>

<noframes>
	<body>您的浏览器不支持框架。</body>
</noframes>
</html>