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
 <script src="/resources/ckeditor/ckeditor.js"></script>
<link href="/resources/css/notice/update.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div class="body">
		<div class="title">
		 	공지글 수정
		<i class="fas fa-pencil-alt"></i></div>
	<form role="form" method="post" autocomplete="off">
			<input type="hidden" id="n_num" name="n_num" value="${update.n_num}" readonly/>
			
			<label for="n_title">제목</label> 
			<input type="text" id="n_title" name="n_title" value="${update.n_title}"/>
			
			<span class="day">
			<i class="far fa-clock"></i>
			<fmt:formatDate value="${update.n_regdate}" pattern="yyyy-MM-dd" /></span>
			
		<textarea rows="5" cols="50" id="n_content" name="n_content">${update.n_content}</textarea>
		<script>	
			var ckeditor_config = {
			  resize_enaleb : false,
			  enterMode : CKEDITOR.ENTER_BR,
			  shiftEnterMode : CKEDITOR.ENTER_P,
			 /*  filebrowserUploadUrl : "/admin/goods/ckUpload"   이미지 업로드시! 필요없음*/
			};
		
			CKEDITOR.replace("n_content", ckeditor_config);
		</script><br>
		<div>
			<label for="n_id">작성자</label>
			<input type="text" id="n_id" name="n_id" value="${update.n_id}" readonly><br>
		</div>	
		<div class="u_btn">
		       <button class="btn submit" type="submit">수정</button>
		       <button class="btn" id="cancel_btn">취소</button>
	    </div>

        </form> </div>
	<script>

	var formObj = $("form[role='form']");
 
		 $("#cancel_btn").click(function(){   
		     formObj.attr("action", "/notice/read?n_num=" + $("#n_num").val());
		     formObj.attr("method", "get");  
		     formObj.submit();
		    });
	</script>
        </body>
<jsp:include page="../home/footer.jsp"></jsp:include>  
</html>