<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="modify.do" method="post">
			<input type="hidden" name="bId" value="${content_view.bId}">
			<tr>
				<td> 번호 </td>
				<td> ${content_view.bId} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${content_view.bHit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="bName" value="${content_view.bName}"></td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="bTitle" value="${content_view.bTitle}"></td>
			</tr>
			
			<tr>
				<td> 내용 </td>
				<td>
					<textarea name="bContent" id="summernote" rows="10" cols="100">${content_view.bContent}</textarea>
					 <script>
    						$(document).ready(function() {
        					$('#summernote').summernote();
   					 	});
 					 </script>
				</td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp;
				<a href="content_view.do?bId=${content_view.bId}">취소</a> &nbsp;&nbsp;
				<a href="list.do">목록보기</a> &nbsp;&nbsp;
			<tr>
				<td colspan="2">
					<a href="JavaScript:form_check();">수정완료</a> &nbsp;&nbsp;
					<a href="content_view.do?bId=${content_view.bId}">취소</a> &nbsp;&nbsp;
					<a href="list.do?page=<%= session.getAttribute("cpage") %>">목록보기</a> &nbsp;&nbsp;
				</td>
			</tr>
		</form>
	</table>
	
</body>
</html>