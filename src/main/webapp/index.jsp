<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Whatever Company</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/js/META-INF/resources/webjars/bootstrap/3.0.0/css/bootstrap.css"/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/navbar.css"/>" rel="stylesheet">

    <%--Extjs core styles--%>
    <link href="<c:url value="/resources/js/META-INF/resources/webjars/extjs/4.2.1.883/resources/css/ext-all.css"/>" rel="stylesheet">

</head>

<body>
<script type="text/javascript" src="<c:url value="/resources/js/META-INF/resources/webjars/jquery/1.9.0/jquery.js"/>"></script>
<script type="text/javascript">
    var dept = '${param.dept}';
    var restSourceBase = '${pageContext.request.contextPath}/ws.wassup';
</script>

<div class="container">

    <!-- Static navbar -->
    <div class="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Whatever Company</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li id="btn_all"><a href="<c:url value="/index.jsp"/>">All Departments</a></li>
                <li id="btn_A"><a href="<c:url value="/index.jsp?dept=A"/>">Department B</a></li>
                <li id="btn_B"><a href="<c:url value="/index.jsp?dept=B"/>">Department B</a></li>
            </ul>
        </div>
    </div>

    <!-- Main component for a primary call to action -->
    <div class="jumbotron">
        <c:if test="${empty param.dept}">
            <h2>All Departments</h2>
            <script type="text/javascript">
                var restSource = restSourceBase;
                (function() {$('#btn_all').addClass('active')})();
            </script>
        </c:if>
        <c:if test="${not empty param.dept}">
            <h2>Department: ${param.dept}</h2>
            <script type="text/javascript">
                var restSource = restSourceBase + "?dept=" + dept;
                (function() {$('#btn_' + dept).addClass('active')})();
            </script>
        </c:if>
        <br/>

        <div id="employee-table"><%--extjs content placeholder--%></div>
    </div>

</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="<c:url value="/resources/js/META-INF/resources/webjars/bootstrap/3.0.0/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/META-INF/resources/webjars/extjs/4.2.1.883/bootstrap.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/employee-grid.js"/>"></script>
</body>
</html>
