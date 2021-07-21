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
<link href="/resources/css/notice/read.css" rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
<script src="/resources/js/goods.js" type="text/javascript"></script>
 <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div style="font-size: 3em; text-align: center; margin: 40px 0; color: green;">
		공지사항
		<i class="fas fa-exclamation"></i>
	</div>
	
	<div style="width: 600px; height: 600px; margin: auto;">
		<form role="form" method="post">
		<hr/>
	   		<div>
	   			<input type="hidden" name="n_num" value="${read.n_num}">
	   			<label>제목</label>
		    	${read.n_title}
		    </div>
		    <div>
	    		<label>작성자</label>
	    		${read.n_id}
	    		<span style="float: right;">작성일&nbsp;
	    		<span><fmt:formatDate value="${read.n_regdate}" pattern="yyyy-MM-dd" /></span>
	    		</span>
	    	</div>
	    <hr/><br>
	    	<div>
				${read.n_content}
	    	</div>
	    <br><hr/><br>	
	    	<div style="float: right;">
		       <button style="background: #8cd98c;" class="btn" id="update_btn">수정</button>
		       <button style="background: #ff6666;" class="btn" id="delete_btn">삭제</button>
	    	</div>
	       </form>   
<script type="text/javascript">
	 var formObj = $("form[role='form']");
	 
	 $("#update_btn").click(function(){
	  
	  formObj.attr("action", "/notice/update");
	  formObj.attr("method", "get");  
	  formObj.submit();     
	  
	 });
	 
	 
	 $("#delete_btn").click(function(){
	  
	  formObj.attr("action", "/notice/delete");
	  formObj.attr("method", "get");  
	  formObj.submit();
	  
	 });
 </script>
           
  </div>
  
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>

    