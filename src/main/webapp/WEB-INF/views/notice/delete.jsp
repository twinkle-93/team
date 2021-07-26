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
<!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
 
</head>
<body>

<div id="root">
 <header>
  <h1>공지사항 게시판</h1>
 </header>

<hr />
 
 <nav>
  처음화면 - 글쓰기 - 로그인
 </nav>

<hr />

 <section id="container">
 
  <form role="form"  method="post" autocomplete="off">
   <p>
   
   <label for="n_num">글번호</label>
   <input type="text" id="n_num" name="n_num" value="${delete}"readonly="readonly"/> 
   </p>
   
   <p> 정말로 삭제하시겠습니까?</p>
  
   <p>
   <button type="submit">예, 삭제합니다.</button><br />
    <button id="cancel_btn">아니오, 삭제하지 않습니다.</button>
    
    
    <script>
    // 폼을 변수에 저장
    var formObj = $("form[role='form']"); 
    
    // 취소 버튼 클릭
    $("#cancel_btn").click(function(){   
     formObj.attr("action", "/notice/read?bno=" + $("#n_num").val());
     formObj.attr("method", "get");  
     formObj.submit();     
     
    });
    </script>
   
   </p>
  </form>         
 </section>    
  </div>
  </body>
</html>