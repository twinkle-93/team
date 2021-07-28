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
<link href="/resources/css/main/home.css" rel="stylesheet" type="text/css">
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
	<div style="margin: auto; width: 1260px; height: 100%; z-index: 5;">
		<ul>
			<!-- 메인 컨트롤러에서 넘겨주자! -->
			<c:forEach items="${map.saleList}" var="saleGoods">
				<li style="width: 400px; height: 500px; display: inline-block;">
					<a href="/goods/read/${saleGoods.g_code}?curPage=1">
						<img id="${saleGoods.g_code}" style="width: 350px; height: 400px; margin: 20px;">
					</a>
					<div style="text-align: center;">
						<p>
							<a class="name_sty" href="/goods/read/${saleGoods.g_code}?curPage=1">${saleGoods.g_name}</a>
						</p>
						<p>${saleGoods.g_price}원</p>
					</div>
				</li>

				<script type="text/javascript">
					$(document).ready(function() {
						getAttachSale();
						
						<!-- 이미지 불러오기 -->
						function getAttachSale() {
							
							$.getJSON("/goods/getAttach/${saleGoods.g_code}", function(result) {
								
								for(var i=0; i<result.length; i++){
									/* 상품에 판매량 콜롬을 추가 시켜주고, sql 문에 sale(판매량) desc 내림차순으로 list를 받아서 6개 출력하도록 만든다 */
									
									/* 테스트 */
									console.log(result[i]);
									
									var filename = result[i];
									$("img#${saleGoods.g_code}").attr("src", "/goods/displayFile?filename="+filename);
										
								}
							});
						};
					});
				</script>
			</c:forEach>
		</ul>
		
		<div
			style="text-align: center; margin-top: 70px; margin-bottom: 50px;">
			<h2>
				New Item <i class="far fa-bell"></i>
			</h2>
		</div>
		<ul>
			<!-- 메인 컨트롤러에서 넘겨주자! -->
			<c:forEach items="${map.regList}" var="regGoods">
				<li style="width: 400px; height: 500px; display: inline-block;">
				<a href="/goods/read/${regGoods.g_code}?curPage=1">
					<img id="${regGoods.g_code}" style="width: 350px; height: 400px; margin: 20px;"></a>
					<div style="text-align: center;">
						<p>
							<a class="name_sty" href="/goods/read/${regGoods.g_code}?curPage=1">${regGoods.g_name}</a>
						</p>
						<p>${regGoods.g_price}원</p>
					</div>
				</li>
			
				<script type="text/javascript">
					$(document).ready(function() {
						getAttachReg();
						
						<!-- 이미지 불러오기 -->
						function getAttachReg() {
							$.getJSON("/goods/getAttach/${regGoods.g_code}", function(result) {
								for(var i=0; i<result.length; i++){
									/* 상품에 판매량 콜롬을 추가 시켜주고, sql 문에 sale(판매량) desc 내림차순으로 list를 받아서 6개 출력하도록 만든다 */
									var filename = result[i];
									$("img#${regGoods.g_code}").attr("src", "/goods/displayFile?filename="+filename);
								}
							});
						};
					});
				</script>
			</c:forEach>
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
				href="qna/listSearch"> 
				<i class="fas fa-question"></i>
				</a></li>

				<li><a data-toggle="tooltip" title="클릭하시면 찜 목록으로 넘어갑니다."
				href="#">
				<i class="fas fa-heart"></i>
				</a></li>

			</ul>
			</div></div>
			<div class="blank"></div>

	<jsp:include page="../home/footer.jsp"></jsp:include>
</body>

</html>