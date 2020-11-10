<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />

<link rel="stylesheet" type="text/css" href="../resources/css/views/group/result.css">
<body class="flex-container">
<div class="result-box">
    <div>
        <h1 class="font-weight-bold">등록완료!</h1>
        <img src="../resources/img/result.jpg">
    </div>
    <a class="btn btn-outline-info" href="/group/${groupNum}">등산모임 페이지로</a>
    <a class="btn btn-danger" href="/calendar.do">나의 등산일정 확인</a>
</div>
</body>
</html>
