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
<link href="/resources/css/qna/list.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
 <div class="body">
 	<div class="title">
 		Q & A <i class="fas fa-question"></i> 
 	</div>
 	<div class="insert">
  		<a class="btn" href="/qna/insert" id="insert_btn">글쓰기</a>
  	</div>
  	<div class="table_body">
  <table class="table">
  	<thead>
	   	<tr class="tab_head">
	   		<th class="tab_num">번호</th>
	   		<th class="tab_title">글제목</th>
	   		<th class="tab_writer">작성자</th>
	   		<th class="tab_day">작성일자</th>
	   	</tr>
	</thead>	   	
   <c:forEach items="${map.to.list}" var="qna">
   				<tbody>
					<tr>
						<td class="tab_b_num">${qna.qna_num}</td>
						<td class="tab_b_title"><a style="color: black; "href="/qna/read/${qna.qna_id}/${qna.qna_num}" data-toggle="tooltip" title="클릭하시면 상세보기로 넘어갑니다.">${qna.qna_title}
						[${qna.qna_recnt}]</a></td>
						<td class="tab_b_writer">${qna.qna_id}</td>
						<td class="tab_b_day">
							<fmt:formatDate  value="${qna.qna_regDate}" pattern="yyyy-MM-dd"/>
							</td>
					</tr>
				</tbody>

				</c:forEach>
  
  </table>
  </div>
  <div class="search">
  <form action="/qna/list" method="post">
			<select class="search_option" name="search_option">
				<option value="all"<c:if test="${map.search_option=='all'}">selected</c:if>>전체</option>
				<option value="qna_id"<c:if test="${map.search_option=='qna_id'}">selected</c:if>>작성자</option>
				<option value="qna_title"<c:if test="${map.search_option=='qna_title'}">selected</c:if>>제목</option>
				<option value="qna_content"<c:if test="${map.search_option=='qna_content'}">selected</c:if>>내용</option>
			</select>
			<input class="search_input" name="keyword" value="${map.keyword}">
			<input class="search_submit" type="submit" value="조회">			
		</form>
		
		<c:if test="${!empty map.keyword}">
				<br>${map.count}개의 게시물이 있습니다.
		</c:if>
		
		<!-- 210716 검색에 따른 페이징처리 정리 -->
		<c:if test="${empty map.keyword}">
			<jsp:include page="page.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${!empty map.keyword}">
			<jsp:include page="page_search.jsp"></jsp:include>
		</c:if>
  </div>
</div>
<div class="blank"></div>
<script type="text/javascript">
	$(document).on("click", "#insert_btn", function() {
		event.preventDefault();
		
		var login = '${login.m_id}';
		
		if(!login){
			alert("로그인 후 이용 하실 수 있습니다.");
			location.assign("/member/loginGet");
		}
		else{
			location.assign("/qna/insert");
		}
	});
</script>

<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>