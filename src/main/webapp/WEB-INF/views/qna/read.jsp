<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>	
<link href="/resources/css/member/read.css" rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
<script src="/resources/js/goods.js" type="text/javascript"></script>
<style type="text/css">
	label {width:100px; height: 40px; text-align: justify;}
	.btn {margin: 10px;}
</style>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div style="width: 100%; height: 100%;">
		<div style="width: 300px; height: 600px; margin: auto; ">
	<div style="font-size: 3em; text-align: center; margin: 40px 0; color: green;">글 상세정보 <i class="fas fa-search"></i></div>
<br>
	<form style="margin: auto;">
	
		<label>작성자</label> ${dto.qna_id}<br>
		
		<label>제목</label> ${dto.qna_title}<br>
		
		<label>내용</label> ${dto.qna_content}<br>
		
		<label>작성일자</label>
		<fmt:parseDate value="${dto.qna_regDate}" var="day" pattern="yyyy-MM-dd"></fmt:parseDate>
		<fmt:formatDate value="${day}" pattern="yyyy년 MM월 dd일"/><br>
		
		
	</form><br><br>
	<div style="text-align: center;">
	<!-- 관리자거나 로그인한 아이디일 경우 버튼이 보인다 -->
		<c:if test="${!empty admin}">
			<button class="btn" id="listBtn">목록</button>
		</c:if>
			<button style="background: #8cd98c; width: 80px;" class="btn" id="updateBtn">수정</button>
			<button style="background: #ff6666;" class="btn" id="deleteBtn">삭제</button>
	</div>
	</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#insertBtn").click(function(event) {
				event.preventDefault();
				location.assign("/qna/insert");
			});
			$("#listBtn").click(function(event) {
				event.preventDefault();
				location.assign("/qna/list");
			});
			$("#updateBtn").click(function(event) {
				event.preventDefault();
				location.assign("/qna/update/${dto.qna_id}/${dto.qna_num}");
			});
			$("#deleteBtn").click(function(event) {
				event.preventDefault();
				location.assign("/qna/delete/${dto.qna_id}");
			});
			
		});
	</script>
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>