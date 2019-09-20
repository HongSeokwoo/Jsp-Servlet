<%@page import="com.study.jsp.dto.MemberDto" %>
<%@page import="com.study.jsp.dao.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = (String)session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getMember(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP/Servlet 21-1</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script>

function form_check() {
	if($('#pw').val().length == 0) {
		alert("비밀번호는 필수사항입니다.");
		$('#pw').focus();
		return;
	}
	
	if($('#pw').val() != $('#pw_check').val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$('#pw').focus();
		return;
	}
	
	if($('#eMail').val().length == 0) {
		alert("메일은 필수사항입니다.");
		$('#eMail').focus();
		return;
	}
	
	submit_ajax();
}

function submit_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/Project/ModifyProcess',
		type: 'POST',
		data: queryString,
		dataType: 'text',
		success: function(json) {
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert(result.desc)
				window.location.replace("list.do");
			} else {
				alert(result.desc);
			}
		}	
	});
}
</script>
</head>
<body>
	<form id="reg_frm">
		아이디 : <%= dto.getId() %><br>
		비밀번호 : <input type="password" id="pw" name="pw" size="20"><br>
		비밀번호 확인 : <input type="password" id="pw_check" name="pw_check" size="20"><br>
		이름 : <%= dto.getName() %><br>
		메일 : <input type="text" id="eMail" name="eMail" size="20" value="<%= dto.geteMail() %>"><br>
		주소 : <input type="text" id="address" name="address" size="50" value="<%= dto.getAddress() %>"><br>
		<input type="button" value="수정" onclick="form_check()">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="취소" onclick="javascript:window.location='main.jsp'">
	</form>
</body>
</html>