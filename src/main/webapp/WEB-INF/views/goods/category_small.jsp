<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link href="/resources/css/goods/goods_list_small.css" rel="stylesheet"
	type="text/css">
<link href="/resources/css/main/home.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div class="body">
		<div class="top">
			<div class="category">
				<c:choose>
					<c:when
						test="${g_category_large == '아우터' || g_category_small == '코트' || g_category_small == '패딩' || g_category_small == '가디건'}">
						<div class="l_cate_title">OUTER</div>
						<ul class="navbar-nav" id="g_category_nav">
							<li><a href="/goods/list/categorys/코트"> 코트</a></li>
							<li><a href="/goods/list/categorys/패딩"> 패딩</a></li>
							<li><a href="/goods/list/categorys/가디건"> 가디건</a></li>
						</ul>
					</c:when>
					<c:when
						test="${g_category_large == '상의' || g_category_small == '티셔츠' ||g_category_small == '블라우스' ||g_category_small == '맨투맨'}">
						<div class="l_cate_title">TOP</div>
						<ul class="navbar-nav" id="g_category_nav">
							<li><a href="/goods/list/categorys/티셔츠"> 티셔츠</a></li>
							<li><a href="/goods/list/categorys/블라우스"> 블라우스</a></li>
							<li><a href="/goods/list/categorys/맨투맨"> 맨투맨</a></li>
						</ul>
					</c:when>
					<c:when
						test="${g_category_large == '하의' || g_category_small == '청바지' ||g_category_small == '슬랙스' ||g_category_small == '치마'}">
						<div class="l_cate_title">BOTTON</div>
						<ul class="navbar-nav" id="g_category_nav">
							<li><a href="/goods/list/categorys/청바지"> 청바지</a></li>
							<li><a href="/goods/list/categorys/슬랙스"> 슬랙스</a></li>
							<li><a href="/goods/list/categorys/치마"> 치마</a></li>
						</ul>
					</c:when>
					<c:when
						test="${g_category_large == '신발' ||g_category_small == '로퍼' ||g_category_small == '샌들'}">
						<div class="l_cate_title">SHOES</div>
						<ul class="navbar-nav" id="g_category_nav">
							<li><a href="/goods/list/categorys/로퍼"> 로퍼</a></li>
							<li><a href="/goods/list/categorys/샌들"> 샌들</a></li>
						</ul>
					</c:when>
					<c:when
						test="${g_category_large == '가방' ||g_category_small == '크로스백' ||g_category_small == '토트백' ||g_category_small == '클러치'}">
						<div class="l_cate_title">BAG</div>
						<ul class="navbar-nav" id="g_category_nav">
							<li><a href="/goods/list/categorys/크로스백"> 크로스백</a></li>
							<li><a href="/goods/list/categorys/토트백"> 토트백</a></li>
							<li><a href="/goods/list/categorys/클러치"> 클러치</a></li>
						</ul>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="goods">
			<ul style="width: 1120px; height: 100%; margin: auto;">
				<c:forEach items="${map.to.list}" var="goods">
					<li
						style="width: 200px; height: 250px; display: inline-block; margin: 0px 10px 100px 10px;">

						<!-- 수정 --> 
						<!-- <img src="/resources/img/pants1.jpg" onmouseout="this.src='/resources/img/pants1_1.jpg'" onmouseover="this.src='/resources/img/pants1.jpg'" style="width: 200px; height: 250px; margin: 0px;"> -->

						<a href="/goods/read/${goods.g_code}?curPage=1"><img id="${goods.g_code}" src="#" style="width: 200px; height: 250px; margin: 0px;"></a>

						<div style="text-align: center; margin: 10px;">
							<p>
								<a href="/goods/read/${goods.g_code}?curPage=1">${goods.g_name}</a>
							</p>
							<p>${goods.g_price}원</p>
						</div>
					</li>

					<!-- 모든 아우터에 해당하는 값들이 나와야한다 -->

					<script type="text/javascript" src="/resources/js/goods.js"></script>
					<script type="text/javascript">
					$(document).ready(function() {
						getAttach();
						
						<!-- 이미지 불러오기 -->
						function getAttach() {
							$.getJSON("/goods/getAttach/${goods.g_code}", function(result) {
								
								for(var i=0; i<result.length; i++){
									var filename = result[i];
									console.log(filename);
									
									/* // 상품명과 상품의 파일명이 같아야만 img에 보이게끔 설정
									var result_sub = filename.substring(filename.lastIndexOf("_")+1).substring(0,2);
									console.log(result_sub);
									
									/* 제일 마지막 상품의 모습만 보여지게 된다 
									if(result_sub == "${goods.g_name}")*/ 
									
									$("img#${goods.g_code}").attr("src", "/goods/displayFile?filename="+filename);
								}
							});
						};
					});
				</script>
				</c:forEach>
			</ul>
		</div>
		<div style="margin: auto; text-align: center;">
			<jsp:include page="category_page_small.jsp"></jsp:include>
		</div>
		<div style="height: 100px;"></div>
	</div>


	<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>