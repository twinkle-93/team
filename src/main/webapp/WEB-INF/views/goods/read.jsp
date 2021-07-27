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
<link href="/resources/css/goods/read.css" rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
<script src="/resources/js/goods.js" type="text/javascript"></script>
<style type="text/css">
label {width:80px; height: 30px; text-align: justify;}
</style>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div class="full">
	<div style="margin: 20px 0; text-align: right;">
			<%-- <label class="r_code">상품 코드 : ${dto.g_code}</label>  --%>
			<label><i class="far fa-clock"></i> 등록날짜</label> ${dto.g_updateDate}
	</div>
	<div class="read">
		
		
		<div class="thumbnailView">
			<img src="/resources/img/product/thumbnail/_s_${dto.g_code}.png"> <!-- 임시 -->
		</div>
		
		<div>
			<label class="category">카테고리</label>
			 ${dto.g_category_large}/${dto.g_category_small}
		</div>
		
		<div  class="name">
			<p>${dto.g_name}</p>
		</div>
		
		<div  class="price">
			<label>Price</label>
			<fmt:formatNumber value="${dto.g_price}" pattern="###,###"/>원
		</div>
		
		<div  class="size">
			<label>사이즈</label>&ensp;${dto.g_size}
		</div>
		
		<div  class="amount">
			<label>수량</label>&ensp;${dto.g_amount}
		</div>
		
		<div class="point">
			<label >적립 포인트</label>&ensp;${dto.g_point}
		</div>
		
		<div>
			<label class="content">상품소개</label>
			<p style="height: 144px;">${dto.g_content}</p>
		</div>
		<!-- 장바구니 폼(테스트) -->
		
			<form action="/cart/insert" method="post">
				<input type="hidden" name="c_g_code" value="${dto.g_code}">
				<input type="hidden" name="c_g_name" value="${dto.g_name}">
				<input type="hidden" name="c_g_price" value="${dto.g_price}">
				<select name="c_amount">
					<c:forEach begin="1" end="10" var="i">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>&nbsp;개
				<%-- <fmt:formatNumber pattern="###,###,###" value="${dto.g_price * i}"/> 원
				<span>${dto.g_price}</span> --%>
				
					<button style="width: 120px; margin-left: 30px;"  class="btn" type="submit">
					<i class="fas fa-shopping-cart"></i></button>
				
			</form>
		
	</div>	
	<!-- <div id="multipleImgView" style="text-align: center;"></div> -->
		<br>
		<div class="buttonList">
			<button id="listBtn">목록</button>
			<button id="updateBtn">수정</button>
			<button id="deleteBtn">삭제</button>
		</div>
</div>
	<form id="deletePost" action="/goods/delete/${dto.g_code}?curPage=${curPage}" method="post"></form>
	
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#homeBtn").click(function(event) {
				event.preventDefault();
				location.assign("/");
			});
			
			$("#listBtn").click(function(event) {
				event.preventDefault();
				location.assign("/goods/list/${curPage}");
			});
			
			$("#updateBtn").click(function(event) {
				event.preventDefault();
				location.assign("/goods/update/${dto.g_code}?curPage=${curPage}");
			});
			
			$("#deleteBtn").click(function(event) {
				event.preventDefault();
				$("#deletePost").submit();
			});
			
			var g_code = ${dto.g_code};
			
			getAttach(g_code);
			
			function getAttach(g_code) {
				$.getJSON("/goods/getAttach/"+g_code, function(result) {
					for (var i = 0; i < result.length; i++) {
						var filename = result[i];
						
						var msg = uploadViewForm(filename);
						$("#multipleImgView").append(msg);
						console.log(msg);
					}
				});
			}
			
		
		});
	</script>
	
<jsp:include page="../home/footer.jsp"></jsp:include>

</body>
</html>