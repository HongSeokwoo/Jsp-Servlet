<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String result;
		int num1, num2, result2;
	%>
	<%
		
		num1 = Integer.parseInt(request.getParameter("num1"));
		num2 = Integer.parseInt(request.getParameter("num2"));
		result = request.getParameter("result");
		
		if (result.equals("plus")) {
			result2 = num1 + num2;
			out.println(num1 + "+" + num2 + "=" + result2);
		} else if (result.equals("minus")) {
			result2 = num1 - num2;
			out.println(num1 + "-" + num2 + "=" + result2);
		} else if (result.equals("multi")) {
			result2 = num1 * num2;
			out.println(num1 + "*" + num2 + "=" + result2);
		} else if (result.equals("div")) {
			result2 = num1 / num2;
			out.println(num1 + "/" + num2 + "=" + result2);
		}
	%>
</body>
</html>