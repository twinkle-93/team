<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>	
<link href="/resources/css/goods/update.css" rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>

	<div class="full"><br>
	
	<form action="/goods/update" method="post">
		<div class="inputArea"> 
		 <label>1차 분류</label>
		  <select onchange="categoryChange(this)" name ="g_category_large">
		     <option>${dto.g_category_large}</option>
		     <option value="아우터">아우터</option>
		     <option value="상의">상의</option>
		     <option value="하의">하의</option>
		   </select>
		   &emsp;&emsp;&nbsp;&nbsp;
		 <label>2차 분류</label>
		    <select id="good" name="g_category_small">
		   <option>${dto.g_category_small}</option>
		   <option>
		   </select>
		</div>
	
		<div>
		 <label for="g_name">상품명</label>
		 <input id="g_name" name="g_name" value="${dto.g_name}">
		 &emsp;
		 <label for="g_code">상품 코드</label>
		 <input type="hidden" name="g_code" value="${dto.g_code}">
		</div>
		
		
		<label>사이즈</label>
		  <select name="g_size">
			  <option>${dto.g_size}</option>
			  <option value="S">S</option>
			  <option value="M">M</option>
			  <option value="L">L</option>
			  <option value="XL">XL</option>
		 </select>
		 
		<div>
		 <label for="g_price">상품 가격</label>
		 <input id="g_price" name="g_price" value="${dto.g_price}">
		  &emsp;
		 <label style="width: 80px;" for="g_point" >적립 포인트</label>
		 <input id="g_point" name="g_point" value="${dto.g_point}">
		</div>
		
		<div>
		 <label for="g_amount">상품 수량</label>
		 <input id="g_amount" name="g_amount" value="${dto.g_amount}">
		</div>
		
		<div>
		 <label for="g_content">상품 소개</label>
		 <textarea rows="5" cols="50" id="g_content" name="g_content">${dto.g_content}</textarea>
		 <script>
			 var ckeditor_config = {
			   resize_enaleb : false,
			   enterMode : CKEDITOR.ENTER_BR,
			   shiftEnterMode : CKEDITOR.ENTER_P,
			  /*  filebrowserUploadUrl : "/admin/goods/ckUpload"   이미지 업로드시! 필요없음*/
			 };
			 
			 CKEDITOR.replace("g_content", ckeditor_config);
		</script>
		</div><br>
		
		<label for="g_files">이미지 첨부</label>
		<input id="g_files" name="g_files" type="file"><br>
		
		<div>
			<input class="update_btn" type="submit" value="수정">
			<input class="submit" type="reset" value="초기화">
		</div>
	
	</form>
	</div>

	<jsp:include page="../home/footer.jsp"></jsp:include>
	
</body>
</html>