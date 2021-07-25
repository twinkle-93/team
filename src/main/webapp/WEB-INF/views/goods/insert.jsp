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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>	
<link href="/resources/css/goods/insert.css" rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/goods.js" type="text/javascript"></script>
<script type="text/javascript" src="http:code.jquery.com/jquery-1.8.3.min.js"></script>

<style type="text/css">
	.fileDrop{
		width: 100%;
		height: 250px;
		border: 1px solid red;
		margin: 20px 0;
	}
	.ellipsisTarget{
		/* 파일명이 overflow인 것은 안보이게 설정 */
		overflow: hidden;
		/* ... 처리 */
		text-overflow: ellipsis;
		/* 한줄로 처리 */
		white-space: nowrap;
	}
</style>

</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>

	<div class="full"><br>
	<div class="title">상품등록 <i class="fas fa-tshirt"></i></div>
	
	<form action="/goods/insert" method="post" name="goods">
	 <label>1차 분류</label>
	   <select onchange="categoryChange(this)" name ="g_category_large" id="g_category_large">
	     <option>전체</option>
	     <option value="아우터">아우터</option>
	     <option value="상의">상의</option>
	     <option value="하의">하의</option>
	   </select>
	    &emsp;
	 <label>2차 분류</label>
	    <select id="good" name="g_category_small">
	   <option>전체</option>
	   <option>
	   </select>
	
	<div>
	 <label for="g_name">상품명</label>
	 <input id="g_name" name="g_name"/>
	 &emsp;
	 <label for="g_code">상품 코드</label>
	 <input type="text" id="g_code" name="g_code">
	</div>
	
	
	<label>사이즈</label>
	 <select name="g_size">
	  <option>전체</option>
	  <option value="S">S</option>
	  <option value="M">M</option>
	  <option value="L">L</option>
	  <option value="XL">XL</option>
	 </select>
	 
	<div>
	 <label for="g_price">상품 가격</label>
	 <input id="g_price" name="g_price"/>
	  &emsp;
	 <label for="g_point" >적립 포인트</label>
	 <input id="g_point" name="g_point">
	</div>
	
	<div>
	 <label for="g_amount">상품 수량</label>
	 <input type="text" id="g_amount" name="g_amount" />
	  &emsp;
	</div>
		
	<div>
	 <label for="g_content">상품 소개</label>
	 <textarea rows="5" cols="50" id="g_content" name="g_content"></textarea>
	 <script>
		 var ckeditor_config = {
		   resize_enaleb : false,
		   enterMode : CKEDITOR.ENTER_BR,
		   shiftEnterMode : CKEDITOR.ENTER_P,
		  /*  filebrowserUploadUrl : "/admin/goods/ckUpload"   이미지 업로드시! 필요없음*/
		 };
		 
		 CKEDITOR.replace("g_content", ckeditor_config);
	</script>
	</div><br>
	
	<!-- class="fileDrop" -->
	<div class="fileDrop">
		파일을 드래그&드랍 하세요
		<!-- class="uploadedList" -->
		<div class="uploadedList"></div>
	</div><br>
	
	<div>
	 <button type="submit" id="register_btn">등록</button>
	 <button type="reset" id="reset_btn">뒤로가기</button>
	</div><br>
	</form>
	</div>

	
	<!--
		버튼을 눌렀을때, 이동을 멈추게 하고, not null 제약조건 위반에
		확인 후에, 이동을 하게 설정해야한다
	-->
	
	<script type="text/javascript" src="/resources/js/goods.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		// 파일 드래그&드랍 시, 기본 효과를 제한
	    $(".fileDrop").on("dragenter dragover", function(event) {
	       event.preventDefault();
	    });
	    
	    // 드랍한 파일들을 ajax 업로드 요청
	    $(".fileDrop").on("drop", function(event) {
	       event.preventDefault();
	       
	       // 드래그하고 드롭한 파일들
	       var files = event.originalEvent.dataTransfer.files;
	       // 첫번째 첨부파일
	       var file = files[0];
	       // 폼데이터 객체 생성
	       var formData = new FormData();
	       // 폼데이터에 첨부파일 추가
	       formData.append("file",file);
	       
	       $.ajax({
	    	  type : 'post',
	    	  url : '/goods/uploadAjax',
	    	  // jQuery 내부적으로 query string으로 만드는 것을 하지 거부한다
	    	  processData : false,
	    	  // contentType을 "multipart/form-data"로 전송하기 위해 변경한다
	    	  contentType : false,
	    	  data : formData,
	    	  dataType : 'text',
	    	  success : function(filename) {
	    		  alert(filename);
	    		  var msg = uploadUpdateForm(filename, getOriginalName(filename), getLinkText(filename));
	    		  $(".uploadedList").append(msg);
	            } 	  
	       });
	    });
	    
	    $(".uploadedList").on("click", "small.delFile", function(event) {
	    	event.preventDefault();
			var that = $(this);
			$.ajax({
				type : 'post',
				url : '/goods/deleteFile',
				data : {
					filename : that.attr("data-filename")
				},
				dataType : 'text',
				success : function(result) {
					alert(result);
					$("#delDiv").remove();
				}
			});
		});
	    
	    $("#register_btn").click(function(event) {
			event.preventDefault();
			
			var str = '';
			
			$(".delFile").each(function(index) {
				var filename = $(this).attr("data-filename");
				str += getFileUploadFilenameInput(index, filename);
			});
			
			/* 테스트 */
			alert("form 태그로 들어갈 파일들: " + str);
			
			$("form").append(str);
			$("form").submit();
		});
	    
	    $("#reset_btn").click(function(event) {
			
	    	event.preventDefault();
	    	
	    	var that = $(this);
	    	
	    	$("button[type='reset']").click(function(event) {
				event.preventDefault();
				$(".delFile").each(function(index) {
					var filename = $(this).attr("data-filename");
					$.ajax({
						type : 'post',
						url : '/goods/deleteFile',
						data : {
							filename : filename 
						},
						dataType : 'text',
						/* success(x) */
						});
					});
				history.back();
			});
	    	
		});
	    
	    
	 });
	</script>
	
	
	
	<script type="text/javascript">
		function sizeChange(e) {
			
		}
	
		function categoryChange(e) {
		    var outterc = ["가디건", "후드집업", "코트", "패딩"];
		    var topc = ["나시", "맨투맨", "긴팔티", "반팔티"];
		    var bottomc = ["반바지", "슬렉스", "긴바지", "치마", "청바지"];
		    var target = document.getElementById("good");
		   
		    if(e.value == "아우터") var d = outterc;
		    else if(e.value == "상의") var d = topc;
		    else if(e.value == "하의") var d = bottomc;
		   
		    target.options.length = 0;
		   
		    for (x in d) {
		        var opt = document.createElement("option");
		      opt.value = d[x];
		      opt.innerHTML = d[x];
		      target.appendChild(opt);
		    }
	  }
	</script>
	
	<div>
	<jsp:include page="../home/footer.jsp"></jsp:include>
	</div>
</body>

</html>