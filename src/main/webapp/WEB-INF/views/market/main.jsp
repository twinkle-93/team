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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<link href="/resources/css/goods/main.css" rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div style="width: 100%; height: 550px; z-index: 2;" id="myCarousel"
		class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active">
				<img src="/resources/img/test1.jpg"
					style="width: 100%; height: 550px;">
			</div>

			<div class="item">
				<img src="/resources/img/test2.jpg"
					style="width: 100%; height: 550px;">
			</div>

			<div class="item">
				<img src="/resources/img/test3.jpg"
					style="width: 100%; height: 550px;">
			</div>
		</div>
		<a class="carousel-control" href="#myCarousel" data-slide="prev">
		</a> <a class="carousel-control" href="#myCarousel" data-slide="next">
		</a>
	</div>

	<div style="text-align: center; margin-top: 70px; margin-bottom: 50px;">
		<h2>
			Weekly Best <i class="far fa-thumbs-up"></i>
		</h2>
	</div>
	<div style="margin: auto; width: 1260px; height: 2000px; z-index: 5;">
		<ul>
			<li style="width: 400px; height: 500px; display: inline-block;">
				<img src="/resources/img/pants1.jpg"
				onmouseout="this.src='/resources/img/pants1_1.jpg'"
				onmouseover="this.src='/resources/img/pants1.jpg'"
				style="width: 350px; height: 400px; margin: 20px;">
				<div style="text-align: center;">
					<p>파란색 숏팬츠</p>
					<p>16000원</p>
				</div>
			</li>
			<li style="width: 400px; height: 500px; display: inline-block;">
				<img src="/resources/img/outer1.jpg"
				onmouseout="this.src='/resources/img/outer1_1.jpg'"
				onmouseover="this.src='/resources/img/outer1.jpg'"
				style="width: 350px; height: 400px; margin: 20px;">
				<div style="text-align: center;">
					<p>파란색 숏팬츠</p>
					<p>16000원</p>
				</div>
			</li>
			<li style="width: 400px; height: 500px; display: inline-block;">
				<img src="/resources/img/outer1.jpg"
				onmouseout="this.src='/resources/img/outer1_1.jpg'"
				onmouseover="this.src='/resources/img/outer1.jpg'"
				style="width: 350px; height: 400px; margin: 20px;">
				<div style="text-align: center;">
					<p>파란색 숏팬츠</p>
					<p>16000원</p>
				</div>
			</li>
			<li style="width: 400px; height: 500px; display: inline-block;">
				<img src="/resources/img/outer1.jpg"
				onmouseout="this.src='/resources/img/outer1_1.jpg'"
				onmouseover="this.src='/resources/img/outer1.jpg'"
				style="width: 350px; height: 400px; margin: 20px;">
				<div style="text-align: center;">
					<p>파란색 숏팬츠</p>
					<p>16000원</p>
				</div>
			</li>
			<li style="width: 400px; height: 500px; display: inline-block;">
				<img src="/resources/img/outer1.jpg"
				onmouseout="this.src='/resources/img/outer1_1.jpg'"
				onmouseover="this.src='/resources/img/outer1.jpg'"
				style="width: 350px; height: 400px; margin: 20px;">
				<div style="text-align: center;">
					<p>파란색 숏팬츠</p>
					<p>16000원</p>
				</div>
			</li>
			<li style="width: 400px; height: 500px; display: inline-block;">
				<img src="/resources/img/outer1.jpg"
				onmouseout="this.src='/resources/img/outer1_1.jpg'"
				onmouseover="this.src='/resources/img/outer1.jpg'"
				style="width: 350px; height: 400px; margin: 20px;">
				<div style="text-align: center;">
					<p>파란색 숏팬츠</p>
					<p>16000원</p>
				</div>
			</li>
		</ul>
		<div
			style="text-align: center; margin-top: 70px; margin-bottom: 50px;">
			<h2>
				New Item <i class="far fa-bell"></i>
			</h2>
		</div>
		<ul>
			<li style="width: 400px; height: 500px; display: inline-block;">
				<img src="/resources/img/pants1.jpg"
				onmouseout="this.src='/resources/img/pants1_1.jpg'"
				onmouseover="this.src='/resources/img/pants1.jpg'"
				style="width: 350px; height: 400px; margin: 20px;">
				<div style="text-align: center;">
					<p>파란색 숏팬츠</p>
					<p>16000원</p>
				</div>
			</li>
			<li style="width: 400px; height: 500px; display: inline-block;">
				<img src="/resources/img/outer1.jpg"
				onmouseout="this.src='/resources/img/outer1_1.jpg'"
				onmouseover="this.src='/resources/img/outer1.jpg'"
				style="width: 350px; height: 400px; margin: 20px;">
				<div style="text-align: center;">
					<p>파란색 숏팬츠</p>
					<p>16000원</p>
				</div>
			</li>
			<li style="width: 400px; height: 500px; display: inline-block;">
				<img src="/resources/img/outer1.jpg"
				onmouseout="this.src='/resources/img/outer1_1.jpg'"
				onmouseover="this.src='/resources/img/outer1.jpg'"
				style="width: 350px; height: 400px; margin: 20px;">
				<div style="text-align: center;">
					<p>파란색 숏팬츠</p>
					<p>16000원</p>
				</div>
			</li>
		</ul>
	</div>

 <div id="wrap">
 	<div id="quick_bg">
 		<ul id="quick">

				<li><a data-toggle="tooltip" title="클릭하시면 공지사항으로 넘어갑니다." 
				href="/notice/list">
				<i class="fas fa-exclamation"></i>
				</a></li>

				<li><a data-toggle="tooltip" title="클릭하시면 Q&A로 넘어갑니다."
				href="#"> 
				<i class="fas fa-question"></i>
				</a></li>

				<li><a data-toggle="tooltip" title="클릭하시면 찜 목록으로 넘어갑니다."
				href="#">
				<i class="fas fa-heart"></i>
				</a></li>

			</ul>
			</div></div>

	<jsp:include page="../home/footer.jsp"></jsp:include>
</body>

</html>