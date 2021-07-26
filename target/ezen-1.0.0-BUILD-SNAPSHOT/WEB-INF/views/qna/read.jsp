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
 
  <form role="form" method="post" autocomplete="off">
  
  <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
  
  
   <p>
    <label for="qna_num">글번호</label><input type="text" id="qna_num" name="qna_num" value="${read.qna_num}" readonly="readonly" />
   </p>
   
   </form>
   <p>
    <label for="qna_title">글 제목</label><input type="text" id="qna_title" name="qna_title" value="${read.qna_title}" readonly="readonly"  />
   </p>
   <p>
    <label for="qna_content">글 내용</label><textarea id="qna_content" name="qna_content" readonly="readonly" >${read.qna_content}</textarea>
   </p>
   <p>
    <label for="qna_id">작성자</label><input type="text" id="qna_id" name="qna_id" value="${read.qna_id}" readonly="readonly" /><br />
    <label>작성 날짜</label> <span><fmt:formatDate value="${read.qna_regDate}" pattern="yyyy-MM-dd" /></span>
   </p>
   <p>
    
  <button type="button" id="list_btn">목록</button><button id="update_btn">수정</button><button id="delete_btn">삭제</button>


<script>
 
 // 폼을 변수에 저장
 var formObj = $("form[role='form']");
 
 //목록 버튼 클릭
 $("#list_btn").click(function(){
	 self.location="/qna/listSearch?"
			 + "page=${scri.page}&perPageNum=${scri.perPageNum}"
			 + "&searchType=${scri.searchType}&keyword=${scri.keyword}";
 
 });
 
 // 수정 버튼 클릭
 $("#update_btn").click(function(){
  
  formObj.attr("action", "/qna/update");
  formObj.attr("method", "get");  
  formObj.submit();     
  
 });
 
 
 // 삭제 버튼 클릭
 $("#delete_btn").click(function(){
  
  formObj.attr("action", "/qna/delete");
  formObj.attr("method", "get");  
  formObj.submit();
  
 });
 </script>
   </p>  
 

 </section>
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>