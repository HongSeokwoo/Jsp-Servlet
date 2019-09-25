<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<style>
.list {
	background-color: gray;
}
</style>
<body>

	<table class="table table-dark" width="500" cellpadding="0"
		cellspacing="0" border="1">
		<div class="container">
			<div class="row justify-content-start">
				<div class="col list">
			<tr>
				<td>번호</td>
				<td>${content_view.bId}</td>
			</tr>
			<tr>
				<td>히트</td>
				<td>${content_view.bHit}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${dto.bName}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${content_view.bContent}</td>
			</tr>
		</div>
		</div>
		</div>
		<tr>
			<td colspan="2"><a href="modify_view.do?bId=${content_view.bId}">수정</a>
				&nbsp;&nbsp; <a
				href="list.do?page=<%=session.getAttribute("cpage")%>">목록보기</a>
				&nbsp;&nbsp; <a href="delete.do?bId=${content_view.bId}">삭제</a>
				&nbsp;&nbsp; <a href="reply_view.do?bId=${content_view.bId}">답변</a>
			</td>
		</tr>
	</table>

</body>
</html>