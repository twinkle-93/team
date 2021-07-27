<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link href="/resources/css/member/list.css" rel="stylesheet"
	type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div
		style="font-size: 3em; text-align: center; margin: 40px 0; color: green;">
		qna 게시판 <i class="fas fa-user-friends"></i>
	</div>
	<div
		style="width: 100px; height: 100px; margin: auto; text-align: center;"></div>
	<div>



		<table class="table">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${map.to.list}" var="qna">
					<tr>
						<td>${qna.qna_num}</td>
						<td><a style="color: green; "href="/qna/read/${qna.qna_id}/${qna.qna_num}" data-toggle="tooltip" title="클릭하시면 상세보기로 넘어갑니다.">${qna.qna_title}</a></td>
						<td>${qna.qna_content}</td>
						<td>${qna.qna_id}</td>
						<td>
							<fmt:parseDate  value="${qna.qna_regDate}" var="day" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate value="${day}" pattern="yyyy년 MM월 dd일"/> 
							</td>
					</tr>


				</c:forEach>
			</tbody>
		</table>
		<!-- class="table"  -->
	</div>
    


	<!-- search 기능 구현 할 곳 -->
		<!-- list.search.POST 에서 list.jsp 방향으로 추가 해줄것들 E.L로 받아 와보자 -->
		<!-- 검색관련 폼 태그 추가 -->
		<form action="/qna/list" method="post">
			<select name="search_option">
				<option value="all"<c:if test="${map.search_option=='all'}">selected</c:if>>전체</option>
				<option value="qna_id"<c:if test="${map.search_option=='qna_id'}">selected</c:if>>작성자</option>
				<option value="qna_title"<c:if test="${map.search_option=='qna_title'}">selected</c:if>>제목</option>
				<option value="qna_content"<c:if test="${map.search_option=='qna_content'}">selected</c:if>>내용</option>
			</select>
			<input name="keyword" value="${map.keyword}">
			<input type="submit" value="조회">			
			<a href="insert"class="btn">글쓰기</a>
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
		
	
	
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>