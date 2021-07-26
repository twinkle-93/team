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
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
<script src="/resources/js/goods.js" type="text/javascript"></script>
 <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div class="body">
	<div class="title">공지사항 <i class="fas fa-exclamation"></i></div>
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
	    		<span class="day">작성일&nbsp;
	    		<span><fmt:formatDate value="${read.n_regdate}" pattern="yyyy-MM-dd" /></span>
	    		</span>
	    	</div>
	    <hr/><br>
	    	<div class="n_content">
				${read.n_content}
	    	</div>
	    <br><hr/><br>
	    <c:choose>
	    	<c:when test="${!empty admin}">
	    	<div class="a_btn">
	    	   <a class="btn n_list" href="/notice/list">목록</a>
		       <button class="btn" id="update_btn">수정</button>
		       <button class="btn" id="delete_btn">삭제</button>
	    	</div>
	    	</c:when>
	    	<c:otherwise>
	    		<c:if test="${!empty login || empty login}">
					<div class="m_btn">
	    	  		 <a class="btn n_list" href="/notice/list">목록</a>
	    			</div>
	    		</c:if>
	    	</c:otherwise>
	    </c:choose>	
	       </form>
</div>   
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

    