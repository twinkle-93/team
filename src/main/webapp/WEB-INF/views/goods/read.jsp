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
<link href="/resources/css/read.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="main_top.jsp"></jsp:include>
<div class="full">
	<div class="read">
		<div>
			<span class="r_code">상품 코드 : ${dto.g_code}</span> 
			<span class="pull-right">
			<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
			등록 날짜:	${dto.g_updateDate}</span>
		</div>
		
		<div>
			<img src="/resources/img/product/thumbnail/_s_${dto.g_code}.png">
		</div>
		
		<div>
			<p class="category">카테고리 : ${dto.g_category_large}>${dto.g_category_small}</p>
		</div>
		
		<div>
			<p class="name">${dto.g_name}</p>
		</div>
		
		<div id="thumbnailImg"></div>
		
		<div>
			<p class="price">가격 : 
			<fmt:formatNumber value="${dto.g_price}" pattern="###,###"/>원</p>
		</div>
		
		<div>
			<p class="size">사이즈 : ${dto.g_size}</p>
		</div>
		
		<div>
			<p class="amount">수량 : ${dto.g_amount}</p>
		</div>
		
		<div>
			<p class="point">적립 포인트 : ${dto.g_point}</p>
		</div>
		
		<div>
			<p class="content">상품소개</p>
			${dto.g_content}
		</div>
		
		<div id="multipleImgView"></div>
	</div>	
		<div class="buttonList">
			
			<button id="listBtn">목록</button>
			<button id="updateBtn">수정</button>
			<button id="deleteBtn">삭제</button>
		</div>
</div>
	<form id="deletePost" action="/goods/delete/${dto.g_code}" method="post"></form>
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#homeBtn").click(function(event) {
				event.preventDefault();
				location.assign("/");
			})
			
			$("#listBtn").click(function(event) {
				event.preventDefault();
				location.assign("/goods/list");
			})
			
			$("#updateBtn").click(function(event) {
				event.preventDefault();
				location.assign("/goods/update/${dto.g_code}");
			})
			
			$("#deleteBtn").click(function(event) {
				event.preventDefault();
				$("#deletePost").submit();
			})
			
			var gCode = ${dto.g_code};
			getAttach(gCode); 
			
		})
		
		
		 function getAttach(gCode){
		$.getJSON("/goods/getAttach/"+gCode, function(result) {
			for(var i=0;i<result.length;i++){
				var filename = result[i];
				
				var msg = uploadViewForm(getLinkText(filename), filename);
				$("#multipleImgView").append(msg);
			}
		}); 
		
		
 		var imgSrc = "/product/thumbnail/_s_"+${dto.g_code};
		var msg = thumbnailView(imgSrc, filename);
        $("#multipleImgView").append(msg); 
	}
		
		
		
	</script>
	
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>