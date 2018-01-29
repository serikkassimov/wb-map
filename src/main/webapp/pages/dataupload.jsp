<%--
  Created by IntelliJ IDEA.
  User: Serik
  Date: 22.12.2015
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<c:url value="/pages/css/jquery-ui-1.10.0.custom.css"/>" type="text/css" />
    <script type="text/javascript" src="<c:url value="/pages/js/jquery-1.11.3.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/jquery-ui-1.9.2.custom.min.js" />"></script>
</head>
<body>
<script>
    $(function () {
        console.log("loadfiles");
        $('#datafiles').load('${pageContext.request.contextPath}/getdatafiles');
    })
    function setmain(filename) {
        $.get('${pageContext.request.contextPath}/setmain' + "?filename=" + filename, function () {
            location.reload();
        });
    }
    function download(filename) {
        window.open("${pageContext.request.contextPath}/download?filename=" + filename);
    }
</script>

<style>

</style>
<h1>Please select data file to upload :</h1>
<form method="POST" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data">
    <input class="ui-button" type="file" name="file"/>
    <input class="ui-button" type="submit" value="upload"/>
</form>

<h1>Data files on application</h1>
<div id="datafiles">
</div>
<a href="${pageContext.request.contextPath}/map" target="_blank">See map</a>
<a href="${pageContext.request.contextPath}/logout">LogOut</a>
</body>
</html>
