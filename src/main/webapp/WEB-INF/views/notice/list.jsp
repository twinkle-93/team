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
<link href="/resources/css/notice/list.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div class="body">
	<div class="title">공지사항 <i class="fas fa-exclamation"></i></div>
		<c:choose>
			<c:when test="${!empty admin}">
				<a class="l_btn btn" href="/notice/insert">작성</a>
			</c:when>
		</c:choose>
	
		<table class="table">
			<thead>
				<tr>
					<th style="width: 50px;">번호</th>
					<th style="width: 250px;">제목</th>
					<th style="width: 30px;">작성자</th>
					<th style="width: 50px;">작성일자</th>
				</tr>
			</thead>
			 <tbody>
			 <!-- 목록 시작 -->
				<c:forEach items="${map.to.list}" var="list">
				<tr>
					<td>${list.n_num}</td>
					<td class="n_title">
					<a  class=a_tag href="/notice/read/${list.n_num}">${list.n_title}</a>
					</td>
					<td>${list.n_id}</td>
					<td>
					<fmt:formatDate value="${list.n_regDate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				</c:forEach>
			<!-- 목록 끝 -->
			 </tbody>
		</table>
		<div class="page">
			<jsp:include page="page.jsp"></jsp:include>
		</div>
	<div class="blank"></div>
	</div>
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>