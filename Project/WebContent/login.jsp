<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<meta name="google-signin-client_id" content="961105134197-k7vhik09ob5mc90icittrtab6135e09r.apps.googleusercontent.com">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- (2) LoginWithNaverId Javscript SDK -->
	<script src="naveridlogin_js_sdk_2.0.0.js"></script>

	<!-- (3) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	 crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	 crossorigin="anonymous">

	<style type="text/css">
	.header,body{padding-bottom:20px}.header,.jumbotron{border-bottom:1px solid #e5e5e5}body{padding-top:20px}.footer,.header,.marketing{padding-right:15px;padding-left:15px}.header h3{margin-top:0;margin-bottom:0;line-height:40px}.footer{padding-top:19px;color:#777;border-top:1px solid #e5e5e5}@media (min-width:768px){.container{max-width:730px}}.container-narrow>hr{margin:30px 0}.jumbotron{text-align:center}.jumbotron .btn{padding:14px 24px;font-size:21px}.marketing{margin:40px 0}.marketing p+h4{margin-top:28px}@media screen and (min-width:768px){.footer,.header,.marketing{padding-right:0;padding-left:0}.header{margin-bottom:30px}.jumbotron{border-bottom:0}}
	</style>
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
	var profile = googleUser.getBasicProfile();
	var queryString = "name=" + profile.getName();
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
					var auth2 = gapi.auth2.getAuthInstance();
					auth2.signOut().then(function () {
					console.log('User signed out.');
					    
					$('#login').css('display', 'block');
					$('#logout').css('display', 'none');

					    });
				} else {
					alert(result.desc);
				}
			}	
		});
}

/* 페이스북 로그인 */
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
      testAPI();
    } else {
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : 1118482788349344,
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v4.0' // use graph api version 2.8
    });

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
   	 var name = response.name;
	 var queryString = "name=" + name;
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
	});
  }
  
  /* 카카오 로그인 */

    Kakao.init('ae0074795c78ef370691b151aabc5757');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          //alert(JSON.stringify(authObj));
          signIn(authObj);
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };

    function signIn(authObj) {
        //console.log(authObj);
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
            	var name = res.properties.nickname;
           	 	var queryString = "name=" + name;
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
         })
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
		<div id="login" class="g-signin2" data-onsuccess="onSignIn"></div>
    	<img id="upic" src=""><br>
    	<span id="uname"></span>
		</div>

		
		<!-- 페이스북 로그인 -->
		<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
		</fb:login-button>
		<!-- 카카오 로그인 -->
		<div id="login" style="display: block">
    	<a id="custom-login-btn" href="javascript:loginWithKakao()">
    	<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
    	</a>
		</div>
	</form>
</body>
</html>