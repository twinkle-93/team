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
<link href="/resources/css/goods/update.css" rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
<script src="/resources/ckeditor/ckeditor.js"></script>

<style type="text/css">
	.fileDrop{
		width : 100%;
		height : 250px;
		border : 1px solid red;
		margin : 20px 0;
	}
	.ellipsisTarget{
		overflow : hidden;
		text-overflow : ellipsis;	
		white-space : nowrap;
	}
</style>

</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>

	<div class="full"><br>
	
	<form action="/goods/update/${dto.g_code}?curPage=${curPage}" method="post">
		<div class="inputArea"> 
		 <label>1차 분류</label>
		  <select onchange="categoryChange(this)" name ="g_category_large">
		     <option>${dto.g_category_large}</option>
		     <option value="아우터">아우터</option>
		     <option value="상의">상의</option>
		     <option value="하의">하의</option>
		   </select>
		   &emsp;&emsp;&nbsp;&nbsp;
		 <label>2차 분류</label>
		    <select id="good" name="g_category_small">
		   <option>${dto.g_category_small}</option>
		   <option>
		   </select>
		</div>
	
		<div>
		 <label for="g_name">상품명</label>
		 <input id="g_name" name="g_name" value="${dto.g_name}">
		 &emsp;
		 <label for="g_code">상품 코드</label>
		 <input id="g_code" name="g_code" value="${dto.g_code}">
		</div>
		
		
		<label>사이즈</label>
		<select name="g_size">
			<option>${dto.g_size}</option>
			<option value="S">S</option>
			<option value="M">M</option>
			<option value="L">L</option>
			<option value="XL">XL</option>
		</select>
		 
		<div>
		 <label for="g_price">상품 가격</label>
		 <input id="g_price" name="g_price" value="${dto.g_price}">
		  &emsp;
		 <label style="width: 80px;" for="g_point" >적립 포인트</label>
		 <input id="g_point" name="g_point" value="${dto.g_point}">
		</div>
		
		<div>
		 <label for="g_amount">상품 수량</label>
		 <input id="g_amount" name="g_amount" value="${dto.g_amount}">
		</div>
		
		<div>
		 <label for="g_content">상품 소개</label>
		 <textarea rows="5" cols="50" id="g_content" name="g_content">${dto.g_content}</textarea>
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
			<input class="update_btn" type="submit" value="수정">
			<input class="reset_btn" type="reset" value="초기화">
		</div><br>
	
	</form>
	</div>
	
	
	<script type="text/javascript" src="/resources/js/goods.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			getAttach();
			
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
				
				if(!confirm("[게시글 수정] 버튼과 상관없이 파일은 즉시 삭제됩니다. \n 삭제하시겠습니까?"))
					return;
				
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
			
			$(".update_btn").click(function(event) {
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
		    
			$(".reset_btn").click(function(event) {
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
	 
		
		
		/* g_code가 한글일 때 에러가 발생한다 */
		function getAttach() {
			$.getJSON("/goods/getAttach/${dto.g_code}", function(result) {
				// attach를 가져오기 위한 메소드!
				for(var i=0; i<result.length; i++){
					var filename = result[i];
					var msg = uploadUpdateForm(filename, getOriginalName(filename), getLinkText(filename));
					$(".uploadedList").append(msg);
				}
			});
		};
	</script>
	
	
	
	
	
	

	<jsp:include page="../home/footer.jsp"></jsp:include>
	
</body>
</html>