<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 	if(session.getAttribute("ValidMem") == null) {
 %>
 	<jsp:forward page="login.jsp"/>
 <%
 	}
 
 	String name = (String)session.getAttribute("name");
 	String id = (String)session.getAttribute("id");
 %>
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
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="961105134197-k7vhik09ob5mc90icittrtab6135e09r.apps.googleusercontent.com">
	
<title>Insert title here</title>

</head>
<body>

	<h1><%= name %>님 안녕하세요.</h1> <br>
	<form action="logout.jsp">
		<input type="submit"  value="로그아웃">&nbsp;&nbsp;&nbsp;
		<input type="button" value="정보수정"
			   onclick="javascript:window.location='modify.jsp'">&nbsp;
		<input type="button" value="회원탈퇴" onclick="javascript:window.location='delete.jsp'">	   
	</form>
	<h1>자유게시판</h1>
	<table class="table table-dark" width="500" cellpadding="0"
		cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td><c:forEach begin="1" end="${dto.bIndent}">-</c:forEach> <a
					href="content_view.do?bId=${dto.bId}">${dto.bTitle}</a></td>
				<td>${dto.bDate}</td>
				<td>${dto.bHit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><a href="write_view.do">글작성</a></td>
		</tr>
	</table>
	
	<ul class="pagination justify-content-center">

		<!-- 처음 -->
		<c:choose>
			<c:when test="${(page.curPage - 1) < 1 }">
				<li class="page-item disabled"><a class="page-link" href="#">
						&lt;&lt; &nbsp;</a></li>

			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="list.do?page=1"> &lt;&lt; &nbsp;</a></li>
			</c:otherwise>
		</c:choose>
		<!-- 이전 -->
		<c:choose>
			<c:when test="${(page.curPage - 1) < 1 }">
				<li class="page-item disabled"><a class="page-link" href="#">
						&lt; &nbsp;</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="list.do?page=${page.curPage - 1 }"> &lt; &nbsp;</a></li>
			</c:otherwise>
		</c:choose>

		<!-- 개별 페이지 -->
		<c:forEach var="fEach" begin="${page.startPage}" end="${page.endPage}"
			step="1">
			<c:choose>
				<c:when test="${page.curPage == fEach }">

					<li class="page-item active" aria-current="page">
					<span class="page-link"> 
					${fEach} &nbsp; 
						<span class="sr-only">(current)</span>
					</span></li>

				</c:when>

				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="list.do?page=${fEach}"> ${fEach} &nbsp;</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 다음 -->
		<c:choose>
			<c:when test="${(page.curPage + 1) > page.totalPage}">
				<li class="page-item disabled"><a class="page-link" href="">
						&gt; &nbsp;</a></li>

			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="list.do?page=${page.curPage + 1}"> &gt; &nbsp;</a></li>
			</c:otherwise>
		</c:choose>
		<!-- 끝 -->
		<c:choose>
			<c:when test="${page.curPage == page.totalPage}">
				<li class="page-item disabled"><a class="page-link" href="">
						&gt;&gt; &nbsp;</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="list.do?page=${page.totalPage}"> &gt;&gt; &nbsp;</a></li>
			</c:otherwise>
		</c:choose>

	</ul>
	<tr>
		<input type="text"><input type="button" value="찾기">
	</tr>
	<hr>
	<h1>공지사항 게시판</h1>
		<table class="table table-dark" width="500" cellpadding="0"
		cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td><c:forEach begin="1" end="${dto.bIndent}">-</c:forEach> <a
					href="content_view.do?bId=${dto.bId}">${dto.bTitle}</a></td>
				<td>${dto.bDate}</td>
				<td>${dto.bHit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><a href="write_view.do">글작성</a></td>
		</tr>
	</table>
	
	<ul class="pagination justify-content-center">

		<!-- 처음 -->
		<c:choose>
			<c:when test="${(page.curPage - 1) < 1 }">
				<li class="page-item disabled"><a class="page-link" href="#">
						&lt;&lt; &nbsp;</a></li>

			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="list.do?page=1"> &lt;&lt; &nbsp;</a></li>
			</c:otherwise>
		</c:choose>
		<!-- 이전 -->
		<c:choose>
			<c:when test="${(page.curPage - 1) < 1 }">
				<li class="page-item disabled"><a class="page-link" href="#">
						&lt; &nbsp;</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="list.do?page=${page.curPage - 1 }"> &lt; &nbsp;</a></li>
			</c:otherwise>
		</c:choose>

		<!-- 개별 페이지 -->
		<c:forEach var="fEach" begin="${page.startPage}" end="${page.endPage}"
			step="1">
			<c:choose>
				<c:when test="${page.curPage == fEach }">

					<li class="page-item active" aria-current="page">
					<span class="page-link"> 
					${fEach} &nbsp; 
						<span class="sr-only">(current)</span>
					</span></li>

				</c:when>

				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="list.do?page=${fEach}"> ${fEach} &nbsp;</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 다음 -->
		<c:choose>
			<c:when test="${(page.curPage + 1) > page.totalPage}">
				<li class="page-item disabled"><a class="page-link" href="">
						&gt; &nbsp;</a></li>

			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="list.do?page=${page.curPage + 1}"> &gt; &nbsp;</a></li>
			</c:otherwise>
		</c:choose>
		<!-- 끝 -->
		<c:choose>
			<c:when test="${page.curPage == page.totalPage}">
				<li class="page-item disabled"><a class="page-link" href="">
						&gt;&gt; &nbsp;</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="list.do?page=${page.totalPage}"> &gt;&gt; &nbsp;</a></li>
			</c:otherwise>
		</c:choose>

	</ul>
	<hr>
	<h1>자료실</h1>
	<table class="table table-dark" width="500" cellpadding="0"
		cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td><c:forEach begin="1" end="${dto.bIndent}">-</c:forEach> <a
					href="content_view.do?bId=${dto.bId}">${dto.bTitle}</a></td>
				<td>${dto.bDate}</td>
				<td>${dto.bHit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><a href="write_view.do">글작성</a></td>
		</tr>
	</table>
	totalCount : ${page.totalCount}
	<br> listCount : ${page.listCount}
	<br> totalPage : ${page.totalPage}
	<br> curPage : ${page.curPage}
	<br> pageCount : ${page.pageCount}
	<br> startPage : ${page.startPage}
	<br> endPage : ${page.endPage}
	<br>

</body>
</html>