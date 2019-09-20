<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
function submit_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/Jsp21-HW-DAO-Ajax/LoginProcess',
		type: 'POST',
		data: queryString,
		dataType: 'text',
		success: function(json) {
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("main.jsp");
			} else {
				alert(result.desc);
			}
		}	
	});
}
</script>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form id="reg_frm">
		아이디 : <input type="text" name="id"
						value="<% if(session.getAttribute("id") != null)
									out.println(session.getAttribute("id"));
								%>"> <br>
		비밀번호 : <input type="password" name="pw"><br><p>
		<input type="button" value="로그인" onclick="submit_ajax()"> &nbsp;&nbsp;
		<input type="button" value="회원가입" onclick="javascript:window.location='join.jsp'">
	</form>
</body>
</html>