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
					<li><a href="#">OUTER</a>
						<ul class="submenu">
							<li><a href="#"> 코트</a></li>
							<li><a href="#"> 패딩</a></li>
							<li><a href="#"> 가디건</a></li>
						</ul></li>
					<li><a href="#">TOP</a>
						<ul class="submenu">
							<li><a href="#"> 티셔츠</a></li>
							<li><a href="#"> 블라우스</a></li>
							<li><a href="#"> 맨투맨</a></li>
						</ul></li>
					<li><a href="#">BOTTOM</a>
						<ul class="submenu">
							<li><a href="#"> 청바지</a></li>
							<li><a href="#"> 슬랙스</a></li>
							<li><a href="#"> 치마</a></li>
						</ul></li>
					<li><a href="#">SHOES</a>
						<ul class="submenu">
							<li><a href="#"> 로퍼</a></li>
							<li><a href="#"> 샌들</a></li>
						</ul></li>
					<li><a href="#">BAG</a>
						<ul class="submenu">
							<li><a href="#"> 크로스백</a></li>
							<li><a href="#"> 토트백</a></li>
							<li><a href="#"> 클러치</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav login">
					<jsp:include page="../member/login_ok.jsp"></jsp:include>
				</ul>
			</div>
		</div>
