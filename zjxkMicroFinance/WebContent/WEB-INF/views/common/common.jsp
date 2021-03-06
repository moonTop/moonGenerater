<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link rel="stylesheet" type="text/css" rel="stylesheet" href="<c:url value='/themes/default/style.css'/>" media="screen">
<link rel="stylesheet" type="text/css"  rel="stylesheet" href="<c:url value='/themes/css/core.css'/>"  media="screen">

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
    var contextPath = "<%=request.getContextPath() %>";
    /**
     * ajax 请求超时全局事件
     */
    $.ajaxSetup({
        contentType : "application/x-www-form-urlencoded;charset=utf-8",
        timeout : 0,
        cache : false,
        complete : function(XHR, TS) {

        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
        	var resText = XMLHttpRequest.responseText;
            if (resText == "SessionTimeout") {
            	alert("请求超时，请重新登录!");
            	window.open(contextPath + '/views/manage/login.jsp', '_top');
            	return;
            }
            alert("AJAX异常[" + JSON.stringify(XMLHttpRequest) + "]");
        }
    }); 
</script>
