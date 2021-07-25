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
 
  <form action="/qna/insert" method="post" autocomplete="off">
   <p>
    <label for="qna_title">글 제목</label><input type="text" id="qna_title" name="qna_title" />
   </p>
   <p>
    <label for="qna_content">글 내용</label><textarea id="qna_content" name="qna_content"></textarea>
   </p>
   <p>
    <label for="qna_id">작성자</label><input type="text" id="qna_id" name="qna_id" />
   </p>
   <p>
   <label for="qna_pw">비밀번호</label><input type="text" id="qna_pw" name="qna_pw" />
    <button type="submit">작성</button>
   </p>  
  </form>

 </section>

<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>