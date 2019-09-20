<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> include.jsp 페이지 입니다. </h1>
	<%@ include file="include01.jsp" %>  <!-- 다른 페이지 삽입 하는 페이지  -->	
	<h1> 다시 include.jsp 페이지 입니다. </h1>
</body>
</html>