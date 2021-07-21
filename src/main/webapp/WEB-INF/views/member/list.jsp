<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link href="/resources/css/member/list.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div style="font-size: 3em; text-align: center; margin: 40px 0; color: green;">회원목록 <i class="fas fa-user-friends"></i></div>
	<div style="width: 800px; height: 600px; margin: auto; text-align: center;">
		<div>
			<table class="table" >
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>이메일</th>
						<th>핸드폰번호</th>
						<th>생년월일</th>
						<th>가입일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${map.to.list}" var="member">
						<tr>
							<td><a style="color: green; "href="/member/read/${member.m_id}" data-toggle="tooltip" title="클릭하시면 상세보기로 넘어갑니다.">${member.m_id}</a></td>
							<td>${member.m_name}</td>
							<td>${member.m_gender}</td>
							<td>${member.m_email}</td>
							<td>${member.m_phone}</td>
							<td>
							<fmt:parseDate  value="${member.m_birth}" var="day" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate value="${day}" pattern="yyyy년 MM월 dd일"/> 
							</td>
							<td>
							<fmt:parseDate  value="${member.m_updateDate}" var="day" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate value="${day}" pattern="yyyy-MM-dd"/> 
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table><!-- class="table"  -->
		</div>
		
		<!-- search 기능 구현 할 곳 -->
		<!-- list.search.POST 에서 list.jsp 방향으로 추가 해줄것들 E.L로 받아 와보자 -->
		<!-- 검색관련 폼 태그 추가 -->
		<form action="/member/list" method="post">
			<select name="search_option">
				<option value="all"<c:if test="${map.search_option=='all'}">selected</c:if>>전체</option>
				<option value="m_name"<c:if test="${map.search_option=='m_name'}">selected</c:if>>회원명</option>
				<option value="m_id"<c:if test="${map.search_option=='m_id'}">selected</c:if>>아이디</option>
				<option value="m_phone"<c:if test="${map.search_option=='m_phone'}">selected</c:if>>핸드폰번호</option>
			</select>
			<input name="keyword" value="${map.keyword}">
			<input type="submit" value="조회">
		</form>
		
		<c:if test="${!empty map.keyword}">
				${map.count}개의 게시물이 있습니다.
		</c:if>
		
		<!-- 210716 검색에 따른 페이징처리 정리 -->
		<c:if test="${empty map.keyword}">
			<jsp:include page="page.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${!empty map.keyword}">
			<jsp:include page="page2.jsp"></jsp:include>
		</c:if>
		
	</div>
	
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>