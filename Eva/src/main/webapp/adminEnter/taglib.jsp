<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="ch" uri="/mytaglib" %>

<%
	String path =request.getContextPath();
    int port = request.getServerPort();
    String basePath = null;
    if(port==80){
    	basePath=request.getScheme()+"://"+request.getServerName()+path;
    }else{
    	basePath=request.getScheme()+"://"+request.getServerName()+":"+port+path;
    }
    request.setAttribute("basePath",basePath);
%>