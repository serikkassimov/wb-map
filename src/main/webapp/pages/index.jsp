<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Main page</title>
    <link rel="stylesheet" href="<c:url value="/pages/css/jquery-ui-1.10.0.custom.css"/>" type="text/css" />
    <script type="text/javascript" src="<c:url value="/pages/js/jquery-1.11.3.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/jquery-ui-1.9.2.custom.min.js" />"></script>

</head>

<body>
<sec:authorize access="isAuthenticated()">
    <p>You login: <sec:authentication property="principal.username" /></p>
    <p>You group: <sec:authentication property="principal.authorities" /></p>
</sec:authorize>
<li><a href="${pageContext.request.contextPath}/map"><!--img src="/static/images/flat/128/report1.png"/-->Map</a></li>
<li><a href="${pageContext.request.contextPath}/dataupload"><!--img src="/static/images/flat/128/calendar-icons.png"/-->Data Edit</a></li>
<li><a href="${pageContext.request.contextPath}/logout"><!--img src="/static/images/flat/128/calendar-icons.png"/-->Logout</a></li>

</body>
</html>
