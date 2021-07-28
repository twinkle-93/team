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
<link href="/resources/css/goods/goods_list_large.css" rel="stylesheet" type="text/css">
<link href="/resources/css/main/home.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div class="body">
	<div class="top">
		<div class="category">
			 <c:choose>
         <c:when
            test="${g_category_large == '아우터' || g_category_small == '코트' || g_category_small == '패딩' || g_category_small == '가디건'}">
            <div class="l_cate_title">
			OUTER
			</div>
            <ul class="navbar-nav" id="g_category_nav">
               <li><a href="/goods/list/categorys/코트"> 코트</a></li>
               <li><a href="/goods/list/categorys/패딩"> 패딩</a></li>
               <li><a href="/goods/list/categorys/가디건"> 가디건</a></li>
            </ul>
         </c:when>
         <c:when
            test="${g_category_large == '상의' || g_category_small == '티셔츠' ||g_category_small == '블라우스' ||g_category_small == '맨투맨'}">
            <div class="l_cate_title" >
			TOP
			</div>
           <ul class="navbar-nav" id="g_category_nav">
               <li><a href="/goods/list/categorys/티셔츠"> 티셔츠</a></li>
               <li><a href="/goods/list/categorys/블라우스"> 블라우스</a></li>
               <li><a href="/goods/list/categorys/맨투맨"> 맨투맨</a></li>
            </ul>
         </c:when>
         <c:when
            test="${g_category_large == '하의' || g_category_small == '청바지' ||g_category_small == '슬랙스' ||g_category_small == '치마'}">
            <div class="l_cate_title">
			BOTTON
			</div>
          <ul class="navbar-nav" id="g_category_nav">
               <li><a href="/goods/list/categorys/청바지"> 청바지</a></li>
               <li><a href="/goods/list/categorys/슬랙스"> 슬랙스</a></li>
               <li><a href="/goods/list/categorys/치마"> 치마</a></li>
            </ul>
         </c:when>
         <c:when
            test="${g_category_large == '신발' ||g_category_small == '로퍼' ||g_category_small == '샌들'}">
            <div class="l_cate_title">
			SHOES
			</div>
            <ul class="navbar-nav" id="g_category_nav">
               <li><a href="/goods/list/categorys/로퍼"> 로퍼</a></li>
               <li><a href="/goods/list/categorys/샌들"> 샌들</a></li>
            </ul>
         </c:when>
         <c:when
            test="${g_category_large == '가방' ||g_category_small == '크로스백' ||g_category_small == '토트백' ||g_category_small == '클러치'}">
            <div class="l_cate_title">
			BAG
			</div>
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
			<ul style="width: 1120px; height: 100%;margin: auto;">
				<c:forEach items="${map.to.list}" var="goods">
				<li style="width: 200px; height: 250px; display: inline-block; margin: 0px 10px 100px 10px;">
				<img src="/resources/img/pants1.jpg" onmouseout="this.src='/resources/img/pants1_1.jpg'"
				onmouseover="this.src='/resources/img/pants1.jpg'" style="width: 200px; height: 250px; margin: 0px;">
				<div style="text-align: center; margin: 15px;">
					<a class="g_name" href="/goods/read/${goods.g_code}?curPage=${map.to.curPage}">${goods.g_name}</a>
					<p class="g_price"><fmt:formatNumber value="${goods.g_price}" pattern="###,###"></fmt:formatNumber> 원</p>
				</div>	
				</li>
				</c:forEach>
			</ul>
		</div>
		<div style="height: 200px;"></div>
	</div>
	
	
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>