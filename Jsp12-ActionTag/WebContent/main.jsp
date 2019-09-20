<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP/Servllet12-1</title>
</head>
<body>
	
	<h1>main.jsp 페이지 입니다.</h1>
	
	<jsp:forward page="sub.jsp" />
	<!-- 주소는 바뀌지 않고 sub.jsp페이지로 넘어감. -->
</body>
</html>