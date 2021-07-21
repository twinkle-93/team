<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<div class="jumbotron">
	 	<div class="container">
	   		<div>
	   		<a href="/">
			<i class="fas fa-seedling fa-2x"></i>
			<i class="fas fa-seedling fa-2x"></i>
			<i class="fas fa-seedling fa-2x"></i></a>
	   		<p><a href="/">Spring</a></p>
	   		</div>
	   		봄처럼 싱그러운 쇼핑몰
   		</div>
	 
	 <div class="container-fluid">
				<ul class="nav navbar-nav myMenu">
					<li><a href="/goods/list/categoryl/아우터">OUTER</a>
						<ul class="submenu">
							<li><a href="/goods/list/categorys/코트"> 코트</a></li>
							<li><a href="/goods/list/categorys/패딩"> 패딩</a></li>
							<li><a href="/goods/list/categorys/가디건"> 가디건</a></li>
						</ul></li>
					<li><a href="/goods/list/categoryl/상의">TOP</a>
						<ul class="submenu">
							<li><a href="/goods/list/categorys/티셔츠"> 티셔츠</a></li>
							<li><a href="/goods/list/categorys/블라우스"> 블라우스</a></li>
							<li><a href="/goods/list/categorys/맨투맨"> 맨투맨</a></li>
						</ul></li>
					<li><a href="/goods/list/categoryl/하의">BOTTOM</a>
						<ul class="submenu">
							<li><a href="/goods/list/categorys/청바지"> 청바지</a></li>
							<li><a href="/goods/list/categorys/슬랙스"> 슬랙스</a></li>
							<li><a href="/goods/list/categorys/치마"> 치마</a></li>
						</ul></li>
					<li><a href="/goods/list/categoryl/신발">SHOES</a>
						<ul class="submenu">
							<li><a href="/goods/list/categorys/로퍼"> 로퍼</a></li>
							<li><a href="/goods/list/categorys/샌들"> 샌들</a></li>
						</ul></li>
					<li><a href="/goods/list/categoryl/가방">BAG</a>
						<ul class="submenu">
							<li><a href="/goods/list/categorys/크로스백"> 크로스백</a></li>
							<li><a href="/goods/list/categorys/토트백"> 토트백</a></li>
							<li><a href="/goods/list/categorys/클러치"> 클러치</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav login">
					<jsp:include page="../member/login_ok.jsp"></jsp:include>
				</ul>
			</div>
		</div>
