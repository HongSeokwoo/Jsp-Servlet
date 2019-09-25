<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery.js"></script>   
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="961105134197-k7vhik09ob5mc90icittrtab6135e09r.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

<title>로그아웃</title>
</head>
<body>
		<%
			session.invalidate();
			response.sendRedirect("login.jsp");
		%>
	

</body>
</html>