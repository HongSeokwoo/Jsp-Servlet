<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="961105134197-k7vhik09ob5mc90icittrtab6135e09r.apps.googleusercontent.com">
<script>
function submit_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/Project/LoginProcess',
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

/* 구글 로그인 */
function onSignIn(googleUser) {
	var queryString = googleUser.getBasicProfile();
	$.ajax({
		url: '/Project/GoogleLogin',
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
		<input type="button" value="회원탈퇴" onclick="javascript:window.location='delete.jsp'">	
	
	
		<!-- 구글 로그인 -->
		<div id="login" name="google" class="g-signin2" data-onsuccess="onSignIn"></div>
    	<img id="upic" src=""><br>
    	<span id="uname"></span>
		</div>
	</form>
</body>
</html>