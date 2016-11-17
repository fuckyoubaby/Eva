<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style type="text/css" media="screen">
             html, body {
                     height: 100%;width: 100%;
                 }

             body {
                                margin: 0;
                                padding: 0;
                                overflow: auto;
                            }

             #flashContent {
                                display: none;
                            }
         </style>
         <!--首先引入相关的js文件-->
    <script type="text/javascript" src="<%=basePath %>/js/jquery-1.11.0.js"></script>
         <script type="text/javascript" src="<%=basePath %>/js/flexpaper.js"></script>

        <script type="text/javascript" src="<%=basePath %>/js/swfobject.js"></script>
        
         <!--配置-->
         <script type="text/javascript">
         
			//alert("filename = "+ ${fileFileName });
             var swfVersionStr = "10.0.0";
             var xiSwfUrlStr = "swf/myflexpaper.swf";

             var flashvars = {
                     SwfFile: decodeURI("../../upload/experience/${fileFileName }"),
                         Scale: 0.6,
                         ZoomTransition: "easeOut",
                         ZoomTime: 0.5,
                         ZoomInterval: 0.1,
                         FitPageOnLoad: false,
                         FitWidthOnLoad: true,
                         PrintEnabled: false,
                         FullScreenAsMaxWindow: false,
                         ProgressiveLoading: true,
                         PrintToolsVisible: false,
                         ViewModeToolsVisible: true,
                         ZoomToolsVisible: true,
                         FullScreenVisible: true,
                         NavToolsVisible: true,
                         CursorToolsVisible: true,
                         SearchToolsVisible: true,
                         localeChain: "en_US"
             };
             var params = {
                 }
             params.quality = "high";
             params.bgcolor = "#333333";
             params.allowscriptaccess = "sameDomain";
             params.allowfullscreen = "true";
             var attributes = {};
             attributes.id = "myflexpaper";
             attributes.name = "myflexpaper";
             swfobject.embedSWF(
                         "swf/myflexpaper.swf", "flashContent",
                         "100%", "100%",
                         swfVersionStr, xiSwfUrlStr,
                         flashvars, params, attributes);
             swfobject.createCSS("#flashContent", "display:block;text-align:left;");


         </script>

     </head>
 <body>
     <div style=" width: 100%;height: 100%;">
             <div id="flashContent">
                 <p>
                     To view this page ensure that Adobe Flash Player version
                     10.0.0 or greater is installed.
                 </p>

             </div>

         </div>
 </body>
 </html>