<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%!
    	Connection con;
    	Statement stmt;
    	ResultSet resultSet;
    	
    	String driver = "oracle.jdbc.driver.OracleDriver";
    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String uid = "scott";
    	String upw = "tiger";
    	String query = "select id, pw from member";
    	
    	String name, id, pw;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	탈퇴를 하실려면 아이디와 비밀번호를 입력해 주세요.
	<form action="withdrawalProcess" method="post">
	아이디 : <input type="id" name="id" size="10"><br>	
	비밀번호 : <input type="password" name="pw" size="10"><br>
			   <input type="submit" value="확인">
	</form>
</body>
</html>