<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴</title>
	<script src="http://code.jquery.com/jquery.js"></script>
	
	<script>
	
	function form_check() {
				
		if($('#id').val().length == 0) {
			alert("아이디는 필수사항입니다.");
			$('#id').focus();
			return;
		}
		
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
		
		submit_ajax();
	}
	
	function submit_ajax() {
		var queryString = $("#reg_frm").serialize();
		$.ajax({
			url: '/Project/DeleteProcess', /* joinOk.jsp 호출시 JoinProcess를 joinOk.jsp로 변경*/
			type: 'POST',
			data: queryString,
			dataType: 'text',
			success: function(json) {
				var result = JSON.parse(json);
				if (result.code=="success") {
					alert(result.desc)
					window.location.replace("login.jsp");
				} else {
					alert(result.desc);
					history.go(0);
				}
			}	
		});
	}
		
</script>
</head>
<body>
	<form id="reg_frm">
		아이디 : <input type="text" id="id" name="id" size="20"><br>
		비밀번호 : <input type="password" id="pw" name="pw" size="20"><br>
		비밀번호 확인 : <input type="password" id="pw_check" name="pw_check" size="20"><br>
		<input type="button" value="회원탈퇴" onclick="form_check()">&nbsp;&nbsp;&nbsp;
		<input type="button" value="로그인" onclick="javascript:window.location='login.jsp'">	
	</form>
</body>
</html>