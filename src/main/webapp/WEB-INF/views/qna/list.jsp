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
<link href="/resources/css/member/login.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
 <section id="container">
  <h2>글 목록</h2>
  <a href="/qna/insert">insert</a>
  <table>
   <tr><th>번호</th><th>글제목</th><th>글내용</th><th>작성자</th><th>작성일자</th></tr>
   <c:forEach items="${map.to.list}" var="qna">
					<tr>
						<td>${qna.qna_num}</td>
						<td><a style="color: green; "href="/qna/read/${qna.qna_id}/${qna.qna_num}" data-toggle="tooltip" title="클릭하시면 상세보기로 넘어갑니다.">${qna.qna_title}</a></td>
						<td>${qna.qna_content}</td>
						<td>${qna.qna_id}</td>
						<td>
							<fmt:formatDate  value="${qna.qna_regDate}" pattern="yyyy-MM-dd"/>
							</td>
					</tr>


				</c:forEach>
  <!-- 목록 시작
   <c:forEach items="${map.to.list}" var="list">
   <tr>
    <td>${list.qna_num}</td>
    
    <td>
    <a href="/qna/read?qna_num=${list.qna_num}&
                                page=${scri.page}&
                               perPageNum=${scri.perPageNum}&
                               searchType=${scri.searchType}& 
                               keyword=${scri.keyword}">${list.qna_title}</a>
    </td>
    
    <td>${list.qna_id}</td>
    <td><fmt:formatDate value="${list.qna_regDate}" pattern="yyyy-MM-dd" /></td>
   </tr>
   </c:forEach>
  목록 끝 -->
  </table>
  <form action="/qna/list" method="post">
			<select name="search_option">
				<option value="all"<c:if test="${map.search_option=='all'}">selected</c:if>>전체</option>
				<option value="qna_id"<c:if test="${map.search_option=='qna_id'}">selected</c:if>>작성자</option>
				<option value="qna_title"<c:if test="${map.search_option=='qna_title'}">selected</c:if>>제목</option>
				<option value="qna_content"<c:if test="${map.search_option=='qna_content'}">selected</c:if>>내용</option>
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
  
</section>

<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>