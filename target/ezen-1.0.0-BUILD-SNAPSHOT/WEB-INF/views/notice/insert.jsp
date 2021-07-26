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
<script src="/resources/ckeditor/ckeditor.js"></script>
<link href="/resources/css/notice/insert.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div class="body">
	<form class="i_form" action="/notice/insert"  method="post" autocomplete="off">
		<div class="title">공지글 작성	 <i class="fas fa-pencil-alt"></i></div>
  		
  		<div>
			<label for="n_title">제목</label>
			<input type="text" id="n_title" name="n_title" />
  		</div>
   
     <textarea rows="5" cols="50" id="n_content" name="n_content"></textarea>
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
    	<input id="n_id" name="n_id">
    	 ${admin.a_name}
    	
   </div ><br>
   <div class="i_btn">
    	<button class="submit btn" type="submit">작성</button>
    </div>	
  </form>


</div>
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>