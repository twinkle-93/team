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
<link href="/resources/css/notice/insert.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
<style type="text/css">
	label {width: 60px; height: 30px; text-align: justify;}
	input {width: 250px;}
</style>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
		<div style="color:green; font-size: 3em; text-align: center; margin: 10px 0 40px 0;">
		 	공지글 수정
		<i class="fas fa-pencil-alt"></i></div>
<hr />
	<form role="form" method="post" autocomplete="off"
	style="width: 600px; height: 600px; margin: auto; margin-top: 50px;">
		<div>
		 
			<input type="hidden" id="n_num" name="n_num" value="${update.n_num}" readonly="readonly"/>
			
			<label for="n_title">제목</label> 
			<input type="text" id="n_title" name="n_title" value="${update.n_title}"/>
			
			
			<span style="float: right;">
			<i class="far fa-clock"></i>
			<fmt:formatDate value="${update.n_regdate}" pattern="yyyy-MM-dd" /></span>
			
		</div><br>
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
			<input type="text" id="n_id" name="n_id" value="${update.n_id}"readonly="readonly"/><br>
		</div>	
		<div style="float: right;">
		       <button style="background: #8cd98c;" class="btn" type="submit">수정</button>
		       <button style="background: #ff6666;" class="btn" id="cancel_btn">취소</button>
	    </div>

        <script>
 S
 var formObj = $("form[role='form']");
 
 $("#cancel_btn").click(function(){   
     formObj.attr("action", "/notice/read?n_num=" + $("#n_num").val());
     formObj.attr("method", "get");  
     formObj.submit();
    });
 </script>
        </form> 
        </body>
<jsp:include page="../home/footer.jsp"></jsp:include>  
</html>