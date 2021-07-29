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
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
<script src="/resources/js/goods.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include><br><br>
	<div class="body">
	<form class="r_form">
	<div class="title">회원 상세정보 <i class="fas fa-search"></i></div>
	
		<label>아이디</label> ${dto.m_id}<br>
		
		<label>이름</label> ${dto.m_name}<br>
		
		<label>생년월일</label>
		<fmt:parseDate value="${dto.m_birth}" var="day" pattern="yyyy-MM-dd"></fmt:parseDate>
		<fmt:formatDate value="${day}" pattern="yyyy년 MM월 dd일"/><br>
		
		<label>이메일</label> ${dto.m_email}<br>
		
		<label>우편번호</label> ${dto.m_zipCode}<br>
		
		<label>주소</label>
		${dto.m_adress} ${dto.m_detailAdress}<br>
		
		<label>핸드폰번호</label> ${dto.m_phone}<br>
		
		<label>성별</label> ${dto.m_gender}<br>
		<br>
		
	<div style="text-align: center;">
		<c:choose>
			<c:when test="${!empty admin}">
				<button class="btn" id="listBtn">목록</button>
				<button class="btn" id="updateBtn">수정</button>
				<button class="btn" id="deleteBtn">삭제</button>
			</c:when>
			<c:otherwise>
				<c:if test="${!empty login}">
					<button class="btn" id="updateBtn">수정</button>
				</c:if>
			</c:otherwise>
		</c:choose>
	
	</div>
	</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#insertBtn").click(function(event) {
				event.preventDefault();
				location.assign("/member/insert");
			});
			$("#listBtn").click(function(event) {
				event.preventDefault();
				location.assign("/member/list");
			});
			$("#updateBtn").click(function(event) {
				event.preventDefault();
				location.assign("/member/update/${dto.m_id}");
			});
			$("#deleteBtn").click(function(event) {
				event.preventDefault();
				location.assign("/member/delete/${dto.m_id}");
			});
			
		});
	</script>
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>