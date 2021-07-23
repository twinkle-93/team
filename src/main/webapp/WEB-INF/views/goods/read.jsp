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
#review li {margin: 0px; padding:0 10px; display:inline;}
.r_star a{ text-decoration: none; color: gray; cursor:pointer;} 
.r_star a.on{color: red;}
.underline a {text-decoration: underline; color: orange;}
.readStar a{pointer-events: none; cursor: default;}
.active { }  /*  rivewlist 클릭한 페이지버튼 active class*/

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
		
		
		<h3 style="display:inline;">상품리뷰  <a id="starAve"></a></h3>  <a id="reviewsAmount"></a>건 
		
		<ul id="review" style="display:inline; float: right; margin-top: 20px;">
	        <li id="highStarList"><a href="#">평점 높은순</a></li>
	        <li id="RegDateList"><a href="#">최신 등록일순</a></li>
	        <li id="lowStarList"><a href="#">평점 낮은순</a></li>
	        <li id="myReviewList" ><a href="#">내글보기</a></li>
	    </ul>
	    <button id="reviewForm" class="reviewInsertForm btn btn-warning">리뷰작성</button>
	    
	    <div id="reviewInsertForm">
	        <label for="r_id">작성자</label>
	        <input id="r_id" readonly value="${login.m_id}"><br>
	        
	        <label for="r_star">별점</label>
	        <P id="r_star" class="r_star"><a value="1">★</a> <a value="2">★</a> <a value="3">★</a> <a value="4">★</a> <a value="5">★</a></p>
	        
	        <label for="r_title">리뷰제목</label>
	        <input id="r_title">
	        
	        <label for="r_content">리뷰내용</label>
	        <input id="r_content">
	        
	        <button id="reviewSubmit">리뷰입력</button>
	        
	    </div>
	    
	    <div id="reviewList"></div>
	    <div id="listPage">
	        <nav aria-label="Page navigation">
		        <ul class="pagination">
			        <li><a class="previous" aria-label="Previous"> <span id="previous" aria-hidden="true">&laquo;</span></a></li>
				        <li id="pageNum"></li>
			        <li><a class="next" aria-label="Next"> <span id="next" aria-hidden="true">&raquo;</span></a></li>
		        </ul>
	        </nav>
	    </div>
	    
	    
	    
	    
	    
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
			getReviewListByRegDate(g_code,1);
			$('#reviewInsertForm').hide();
			
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
			
			$(document).on("click",".pageNum", function(){
				
				if($(this).attr("listtype")=="listByRegDate"){
					var curPage = $(this).text();
					getReviewListByRegDate(g_code,curPage);
				}
				if($(this).attr("listtype")=="listByHighStar"){
					var curPage = $(this).text();
					getReviewListByHighStar(g_code,curPage);
				}
				if($(this).attr("listtype")=="listByLowStar"){
					var curPage = $(this).text();
					getReviewListByLowStar(g_code,curPage);
				}
			});
			
			$(document).on("click","#previous", function() {
				
				if($(".pageNum").attr("listtype")=="listByRegDate"){
					var curPage = $(".active").text();
					if(curPage-1==0){
						getReviewListByRegDate(g_code,curPage);
					}else{
						getReviewListByRegDate(g_code,curPage-1);
					}	
				}
				if($(".pageNum").attr("listtype")=="listByHighStar"){
					var curPage = $(".active").text();
					if(curPage-1==0){
						getReviewListByHighStar(g_code,curPage);
					}else{
						getReviewListByHighStar(g_code,curPage-1);
					}	
				}
				if($(".pageNum").attr("listtype")=="listByLowStar"){
					var curPage = $(".active").text();
					if(curPage-1==0){
						getReviewListByLowStar(g_code,curPage);
					}else{
						getReviewListByLowStar(g_code,curPage-1);
					}	
				}
			});
			
			$(document).on("click","#next", function() {
				
				if($(".pageNum").attr("listtype")=="listByRegDate"){
					var curPage = $(".active").text();
					var nextPage = Number(curPage)+1;
					if(curPage==finishedPageNum){
						getReviewListByRegDate(g_code,curPage);
					}else{
						getReviewListByRegDate(g_code,nextPage);
					}	
				}
				if($(".pageNum").attr("listtype")=="listByHighStar"){
					var curPage = $(".active").text();
					var nextPage = Number(curPage)+1;
					if(curPage==finishedPageNum){
						getReviewListByHighStar(g_code,curPage);
					}else{
						getReviewListByHighStar(g_code,nextPage);
					}	
				}
				if($(".pageNum").attr("listtype")=="listByLowStar"){
					var curPage = $(".active").text();
					var nextPage = Number(curPage)+1;
					if(curPage==finishedPageNum){
						getReviewListByLowStar(g_code,curPage);
					}else{
						getReviewListByLowStar(g_code,nextPage);
					}	
				}
			});
			
			
			
			$(document).on("click","#RegDateList", function() {
				event.preventDefault();
				getReviewListByRegDate(g_code,1);
				if($('#listPage').css('display') == 'none'){
		            $('#listPage').show();
		        }
			});
			
			$(document).on("click","#highStarList", function() {
				event.preventDefault();
				getReviewListByHighStar(g_code,1);
				if($('#listPage').css('display') == 'none'){
		            $('#listPage').show();
		        }
			});
			
			$(document).on("click","#lowStarList", function() {
				event.preventDefault();
				getReviewListByLowStar(g_code,1);
				if($('#listPage').css('display') == 'none'){
		            $('#listPage').show();
		        }
			});
			
			var finishedPageNum = '';
			
			function getReviewListByRegDate(g_code,curPage) {
				
				$.getJSON("/reviews/getAmount/"+g_code,function(data){
					$("#reviewsAmount").text(data);
				});

				$.getJSON("/reviews/listByRegDate/"+g_code+"/"+curPage, function(to) {
					$("#pageNum").html("");
					var page = '';
					finishedPageNum = to['finishedPageNum'];
					for(var i=to['beginPageNum']; i<to['finishedPageNum']+1; i++){
						if(i == curPage){
							page = activePage(g_code, i, 'listByRegDate');
						}else{
							page = pageJSP(g_code, i, 'listByRegDate');
						}
						$("#pageNum").append(page);
						
					}

					$(".underline").removeClass("underline");
					$("#RegDateList").addClass("underline");
					$("#reviewList").html("");
					var reviewList = to['list'];
					
					
					
					for(var i=0; i<reviewList.length;i++){
						var obj = reviewList[i];
						var updateDate = obj['r_updateDate'];
						if(updateDate){
							updateDate = updateDate.substring(0,10);
						}
						var msg = list(obj['r_num'], obj['r_id'], obj['r_code'], obj['r_star'], obj['r_regDate'].substring(0,10), obj['r_title'], obj['r_content'], '${login.m_id}', updateDate );
						$("#reviewList").append(msg);
					}
					
					$("#starAve").html(stars('${dto.g_starAmount}'));
				});
			}
			
			
			function getReviewListByHighStar(g_code,curPage) {
				$(".underline").removeClass("underline");
				$("#highStarList").addClass("underline");
				$("#reviewList").html("");
				
				$.getJSON("/reviews/listByHighStar/"+g_code+"/"+curPage, function(to) {
					$("#pageNum").html("");
					var page = '';
					for(var i=to['beginPageNum']; i<to['finishedPageNum']+1; i++){
						if(i == curPage){
							page = activePage(g_code, i, 'listByHighStar');
						}else{
							page = pageJSP(g_code, i, 'listByHighStar');
						}
						$("#pageNum").append(page);
					}
					var reviewList = to['list'];
					for(var i=0; i<reviewList.length;i++){
						var obj = reviewList[i];
						var updateDate = obj['r_updateDate'];
						if(updateDate){
							updateDate = updateDate.substring(0,10);
						}
						var msg = list(obj['r_num'], obj['r_id'], obj['r_code'], obj['r_star'], obj['r_regDate'].substring(0,10), obj['r_title'], obj['r_content'], '${login.m_id}', updateDate );
						$("#reviewList").append(msg);
					} 
				});
			}
			
			function getReviewListByLowStar(g_code,curPage) {
				$(".underline").removeClass("underline");
				$("#lowStarList").addClass("underline");
				$("#reviewList").html("");
				
				$.getJSON("/reviews/listByLowStar/"+g_code+"/"+curPage, function(to) {
					$("#pageNum").html("");
					var page = '';
					for(var i=to['beginPageNum']; i<to['finishedPageNum']+1; i++){
						if(i == curPage){
							page = activePage(g_code, i, 'listByLowStar');
						}else{
							page = pageJSP(g_code, i, 'listByLowStar');
						}
						$("#pageNum").append(page);
					}
					var reviewList = to['list'];
					for(var i=0; i<reviewList.length;i++){
						var obj = reviewList[i];
						var updateDate = obj['r_updateDate'];
						if(updateDate){
							updateDate = updateDate.substring(0,10);
						}
						var msg = list(obj['r_num'], obj['r_id'], obj['r_code'], obj['r_star'], obj['r_regDate'].substring(0,10), obj['r_title'], obj['r_content'], '${login.m_id}', updateDate );
						$("#reviewList").append(msg);
					} 
				});
			}
			
			$(document).on("click","#myReviewList", function() {
				event.preventDefault();
				var userId = '${login.m_id}';
				if(!userId){
					alert("로그인 후 확인 하실 수 있습니다.");
				}else{
					$(".underline").removeClass("underline");
					$("#myReviewList").addClass("underline");
					$("#reviewList").html("");
					
					$("#listPage").hide();
					
					$.getJSON("/reviews/listById/"+g_code+"/"+'${login.m_id}', function(data) {
						for(var i=0; i<data.length;i++){
							var obj = data[i];
							var updateDate = obj['r_updateDate'];
							if(updateDate){
								updateDate = updateDate.substring(0,10);
							}
							var msg = list(obj['r_num'], obj['r_id'], obj['r_code'], obj['r_star'], obj['r_regDate'].substring(0,10), obj['r_title'], obj['r_content'], '${login.m_id}', updateDate );
							$("#reviewList").append(msg);
						}
					});
				}	

			});
			
			
			$(document).on("click",".r_star a", function() {
				$(this).parent().children("a").removeClass("on"); 
				$(this).addClass("on").prevAll("a").addClass("on");
				r_star = $(this).attr("value"); 
				$(this).parent().attr("r_star",r_star);
			});
			
			 $("#reviewSubmit").click(function() {
				event.preventDefault();
				
				$.ajax({
					type : "post",
					url : "/reviews/review",
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},
					data: JSON.stringify({
						r_code : g_code,
						r_id : $("#r_id").val(),
						r_content : $("#r_content").val(),
						r_star : r_star,
						r_title : $("#r_title").val()
					}),
					dataType : 'text',
					success : function(result) {
						$('#reviewInsertForm').hide();
						$("#reviewList").html("");
						getReviewListByRegDate(g_code);
						$("#r_content").val("");
						$("#r_title").val("");
						
					}
				}); 
			});
			 
			 
			$(document).on("click",".review_btn_update_form", function() {
				event.preventDefault();
				var that = $(this);
				var r_num = that.parent().attr("r_num");
				var r_title = that.parent().attr("r_title");
				var r_content = that.parent().attr("r_content");
				
				var msg = reviewUpdate(r_num, r_title, r_content);
				
				that.parent().html(msg);
			});
			
			$(document).on("click",".review_update_commit", function() {
				event.preventDefault();
				var that = $(this);
				var r_num = that.nextAll("#r_update_num").val();
				var r_star = that.nextAll("#r_update_star").attr("r_star");
				var r_title = that.nextAll("#r_update_title").val();
				var r_content = that.nextAll("#r_update_content").val();
				
				$.ajax({
					type : "PUT",
					url : "/reviews/review",
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'PUT'
					},
					data: JSON.stringify({
						r_content : r_content,
						r_star : r_star,
						r_title : r_title,
						r_num : r_num,
						r_code : g_code
					}),
					dataType : 'text',
					success : function(result) {
						
						getReviewListByRegDate(g_code,1);
					}
				}); 
				
			});

			$(document).on("click","#reviewForm",function(){
				
				var userId = '${login.m_id}';
				if(!userId){
					alert("로그인 후 이용하실 수 있습니다.");
				}else{
					$.getJSON("/reviews/listById/"+g_code+"/"+userId, function(data) {
						if(data.length>0){
							alert("리뷰는 하나만 착성하실 수 있습니다.");
						} else{
							$('#reviewInsertForm').show();
						}
				    }); 	
			    }	
		    });
			
			$(document).on("click",".review_btn_delete",function(){
				if(confirm("리뷰를 삭제하시겠습니까?")){
					
					var r_num = $(this).parent().attr("r_num");
					
					$.ajax({
						type : "DELETE",
						url : "/reviews/review",
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'DELETE'
						},
						data: JSON.stringify({
							r_num : r_num
						}),
						dataType : 'text',
						success : function(result) {
							alert("삭제되었습니다.");
							getReviewListByRegDate(g_code,1);
						}
					}); 
				}
			});
			
			
		});	
	</script>
	
<jsp:include page="../home/footer.jsp"></jsp:include>


</body>
</html>