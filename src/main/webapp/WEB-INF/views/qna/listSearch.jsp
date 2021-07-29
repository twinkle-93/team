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
   <tr><th>글번호</th><th>작성자</th><th>글제목</th><th>작성일자</th></tr>
   
  <!-- 목록 시작 -->
   <c:forEach items="${list}" var="list">
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
   <!-- 목록 끝 -->
  </table>
  
  <div class="search">
 <select name="searchType">
  <option value="qna_n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
  <option value="qna_i"<c:out value="${scri.searchType eq 'qna_i' ? 'selected' : ''}"/>>작성자</option>
  <option value="qna_t"<c:out value="${scri.searchType eq 'qna_t' ? 'selected' : ''}"/>>제목</option>
  <option value="qna_c"<c:out value="${scri.searchType eq 'qna_c' ? 'selected' : ''}"/>>내용</option>
  <option value="qna_tc"<c:out value="${scri.searchType eq 'qna_tc' ? 'selected' : ''}"/>>제목+내용</option>
 </select>
 
 <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

 <button id="searchBtn">검색</button>
 
 <script>
 $(function(){
  $('#searchBtn').click(function() {
   self.location = "listSearch"
     + '${pageMaker.makeQuery(1)}'
     + "&searchType="
     + $("select option:selected").val()
     + "&keyword="
     + encodeURIComponent($('#keywordInput').val());
    });
 });   
 </script>
</div>
  
  <div>
 <ul>
  <c:if test="${pageMaker.prev}">
   <li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
  </c:if> 
  
  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
   <li><a href="listSearch${pageMaker.makeQuery(idx)}">${idx}</a></li>
  </c:forEach>
    
  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
   <li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
  </c:if> 
 </ul>
</div>

</section>

<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>