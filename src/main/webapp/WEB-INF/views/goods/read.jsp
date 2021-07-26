<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link href="/resources/css/goods/read.css" rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
<script src="/resources/js/goods.js" type="text/javascript"></script>
<style type="text/css">

.active { }  /*  rivewlist 클릭한 페이지버튼 active class*/

#review li {
	margin: 0px;
	padding: 0 5px;
	display: inline;
}

.r_star a {
	text-decoration: none;
	color: gray;
	cursor: pointer;
}

.r_star a.on {
	color: red;
}

.underline a {
	text-decoration: underline;
	color: orange;
}

.readStar a {
	pointer-events: none;
	cursor: default;
}
</style>
</head>
<body>
	<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div style="height: 100%;">
		<div class="full">
			<div style="margin: 20px 0; text-align: right;">
				<%-- <label class="r_code">상품 코드 : ${dto.g_code}</label>  --%>
				<label><i class="far fa-clock"></i> 등록날짜</label> ${dto.g_updateDate}
			</div>
			<div class="read">

				<div class="thumbnailView">
					<img src="">
				</div>

				<div>
					<label class="category">카테고리</label>
					${dto.g_category_large}/${dto.g_category_small}
				</div>

				<div class="name">
					<p>${dto.g_name}</p>
				</div>

				<div class="price">
					<label>Price</label>
					<fmt:formatNumber value="${dto.g_price}" pattern="###,###" />
					원
				</div>

				<div class="size">
					<label>사이즈</label>&ensp;${dto.g_size}
				</div>

				<div class="amount">
					<label>수량</label>&ensp;${dto.g_amount}
				</div>

				<div class="point">
					<label>적립 포인트</label>&ensp;${dto.g_point}
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

					<button style="width: 120px; margin-left: 30px;" class="btn"
						type="submit">
						<i class="fas fa-shopping-cart"></i>
					</button>

				</form>
			</div>
			<!-- <div id="multipleImgView" style="text-align: center;"></div> -->
			<br>
			<c:if test="${!empty admin}">
				<div class="buttonList">
					<button id="listBtn">목록</button>
					<button id="updateBtn">수정</button>
					<button id="deleteBtn">삭제</button>
				</div>
			</c:if>
			<c:if test="${!empty login}">
				<div class="buttonList">
					<button class="btn listBtn" id="listBtn">목록</button>
				</div>
			</c:if>
		</div>



		<!-- 리뷰 -->

		<div class="re_body">
			<div style="float: right;">
				<button id="reviewForm" class="reviewInsertForm btn btn-warning">리뷰작성</button>
			</div>
			<br>
			<div style="height: 50px; margin-top: 30px;">
				<h3 style="display: inline;">
					상품리뷰 <span id="starAve"></span>
				</h3>
				<span id="maxReview"></span>건

				<ul id="review" style="display: inline; float: right;">
					<li id="RegDateList"><a href="#">최신 등록일순</a></li>
					<li id="highStarList"><a href="#">평점 높은순</a></li>
					<li id="lowStarList"><a href="#">평점 낮은순</a></li>
					<li id="myReviewList"><a href="#">내글보기</a></li>
				</ul>
			</div>


			<div id="reviewInsertForm"
				style="margin: 0 0 20px 0; border: 3px solid #f4f1f1; padding: 10px;">

				<div>
					<span> <label for="r_star">별점</label> <span id="r_star"
						class="r_star"> <a value="1">★</a> <a value="2">★</a> <a
							value="3">★</a> <a value="4">★</a> <a value="5">★</a>
					</span>
					
					</span> <span style="float: right;"> <label for="r_code"></label>
						<input type="hidden" id="r_code" readonly value="${dto.g_code}">
					</span>
					
					</span> <span style="float: right;"> <label for="r_id">작성자</label>
						<input id="r_id" readonly value="${login.m_id}">
					</span>
				</div>

				<div>
					<label for="r_title">리뷰 제목</label> <input id="r_title">
				</div>
				<div>
					<label for="r_content">리뷰 내용</label>
				</div>
				<div>
					<textarea id="r_content"></textarea>
					<span style="float: right;">
						<button class="btn" style="margin: 10px 20px 20px 10px;"
							id="reviewSubmit">리뷰입력</button>
					</span>
				</div>
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
	</div>




	<form id="deletePost"
		action="/goods/delete/${dto.g_code}?curPage=${curPage}" method="post"></form>


	<script type="text/javascript">
		$(document).ready(function() {
		
			getAttach();
			
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
			
			/* 변수 설정시 오류 */
			/* var g_code = ${dto.g_code}; */
			
			$('#listPage').hide();
			getReviewListByRegDate("${dto.g_code}", 1);
			$('#reviewInsertForm').hide();
			
			
			<!-- 21/07/21 이미지 불러오기 -->
			/* 문제는 해결했으나, 파일을 여러개 등록한 경우, 파일의 마지막 인덱스만 img에 출력된다 */
			function getAttach() {
				$.getJSON("/goods/getAttach/${dto.g_code}", function(result) {
					// attach를 가져오기 위한 메소드!
					for(var i=0; i<result.length; i++){
						var filename = result[i];
						$("img").attr("src", "/goods/displayFile?filename="+filename);
					}
				});
			};
			
			
			/* 리뷰페이징처리 */
			$(document).on("click",".pageNum", function(){
				
				if($(this).attr("listtype")=="listByRegDate"){
					var curPage = $(this).text();
					getReviewListByRegDate("${dto.g_code}",curPage);
				}
				if($(this).attr("listtype")=="listByHighStar"){
					var curPage = $(this).text();
					getReviewListByHighStar("${dto.g_code}",curPage);
				}
				if($(this).attr("listtype")=="listByLowStar"){
					var curPage = $(this).text();
					getReviewListByLowStar("${dto.g_code}",curPage);
				}
			});
			
			$(document).on("click","#previous", function() {
				
				if($(".pageNum").attr("listtype")=="listByRegDate"){
					var curPage = $(".active").text();
					if(curPage-1==0){
						getReviewListByRegDate("${dto.g_code}",curPage);
					}else{
						getReviewListByRegDate("${dto.g_code}",curPage-1);
					}	
				}
				if($(".pageNum").attr("listtype")=="listByHighStar"){
					var curPage = $(".active").text();
					if(curPage-1==0){
						getReviewListByHighStar("${dto.g_code}",curPage);
					}else{
						getReviewListByHighStar("${dto.g_code}",curPage-1);
					}	
				}
				if($(".pageNum").attr("listtype")=="listByLowStar"){
					var curPage = $(".active").text();
					if(curPage-1==0){
						getReviewListByLowStar("${dto.g_code}",curPage);
					}else{
						getReviewListByLowStar("${dto.g_code}",curPage-1);
					}	
				}
			});
			
			$(document).on("click","#next", function() {
				
				if($(".pageNum").attr("listtype")=="listByRegDate"){
					var curPage = $(".active").text();
					var nextPage = Number(curPage)+1;
					if(curPage==finishedPageNum){
						getReviewListByRegDate("${dto.g_code}",curPage);
					}else{
						getReviewListByRegDate("${dto.g_code}",nextPage);
					}	
				}
				if($(".pageNum").attr("listtype")=="listByHighStar"){
					var curPage = $(".active").text();
					var nextPage = Number(curPage)+1;
					if(curPage==finishedPageNum){
						getReviewListByHighStar("${dto.g_code}",curPage);
					}else{
						getReviewListByHighStar("${dto.g_code}",nextPage);
					}	
				}
				if($(".pageNum").attr("listtype")=="listByLowStar"){
					var curPage = $(".active").text();
					var nextPage = Number(curPage)+1;
					if(curPage==finishedPageNum){
						getReviewListByLowStar("${dto.g_code}",curPage);
					}else{
						getReviewListByLowStar("${dto.g_code}",nextPage);
					}	
				}
			});
			
			$(document).on("click","#RegDateList", function() {
				event.preventDefault();
				getReviewListByRegDate("${dto.g_code}",1);
				if($('#listPage').css('display') == 'none'){
		            $('#listPage').show();
		        }
			});
			
			$(document).on("click","#highStarList", function() {
				event.preventDefault();
				getReviewListByHighStar("${dto.g_code}",1);
				if($('#listPage').css('display') == 'none'){
		            $('#listPage').show();
		        }
			});
			
			$(document).on("click","#lowStarList", function() {
				event.preventDefault();
				getReviewListByLowStar("${dto.g_code}",1);
				if($('#listPage').css('display') == 'none'){
		            $('#listPage').show();
		        }
			});
			
			var finishedPageNum = '';
			
			/* 최신 등록일 순 */
			function getReviewListByRegDate(g_code,curPage) {
				if($('#listPage').css('display') == 'none'){
		            $('#listPage').show();
				}
				$.getJSON("/reviews/getAmount/${dto.g_code}",function(data){
					$("#reviewsAmount").text(data);
				});

				$.getJSON("/reviews/listByRegDate/${dto.g_code}/"+curPage, function(to) {
					$("#pageNum").html("");
					var page = '';
					finishedPageNum = to['finishedPageNum'];
					for(var i=to['beginPageNum']; i<to['finishedPageNum']+1; i++){
						if(i == curPage){
							page = activePage("${dto.g_code}", i, 'listByRegDate');
						}else{
							page = pageJSP("${dto.g_code}", i, 'listByRegDate');
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
			
			
			/* 평점 높은 순 */
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
			
			
			/* 평점 낮은 순 */
			function getReviewListByLowStar(g_code,curPage) {
				$(".underline").removeClass("underline");
				$("#lowStarList").addClass("underline");
				$("#reviewList").html("");
				
				$.getJSON("/reviews/listByLowStar/${dto.g_code}/"+curPage, function(to) {
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
			
			
			/* 내 글보기 */
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
					
					$.getJSON("/reviews/listById/${dto.g_code}/"+'${login.m_id}', function(data) {
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
				console.log(r_star);
			});
			
			
			/* 리뷰 작성 */
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
						r_code : $("#r_code").val(),
						r_id : $("#r_id").val(),
						r_content : $("#r_content").val(),
						r_star : r_star,
						r_title : $("#r_title").val()
					}),
					dataType : 'text',
					success : function(result) {
						$('#reviewInsertForm').hide();
						$("#reviewList").html("");
						getReviewListByRegDate("${dto.g_code}", 1);
						$("#r_content").val("");
						$("#r_title").val("");
						location.reload();
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

			
			/* 리뷰 수정 */
			
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
						r_code : $("#r_code").val()
					}),
					dataType : 'text',
					success : function(result) {
						
						getReviewListByRegDate();
						location.reload();
					}
				}); 
				
			});
			
			$(document).on("click","#reviewForm",function(){
				var userId = '${login.m_id}';
				if(!userId){
					alert("로그인 후 이용하실 수 있습니다.");
					location.assign("/member/loginGet");
				}else{
					$.getJSON("/reviews/listById//${dto.g_code}/${login.m_id}", function(data) {
						if(data.length>0){
							alert("리뷰는 하나만 착성하실 수 있습니다.");
						} else{
							$('#reviewInsertForm').show();
						}
				    }); 	
			    }	
		    });
			
			/* 리뷰 삭제 */
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
							r_num : r_num,
							r_code : "${dto.g_code}"
						}),
						dataType : 'text',
						success : function(result) {
							alert("삭제되었습니다.");
							getReviewListByRegDate();
							location.reload();
						}
					});
					
				} 
			});
			
		
		});
	</script>

	<jsp:include page="../home/footer.jsp"></jsp:include>

</body>
</html>