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
<link href="/resources/css/insert.css" rel="stylesheet" type="text/css">
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/goods.js" type="text/javascript"></script>	
</head>
<body>
<jsp:include page="main_top.jsp"></jsp:include>

	<div class="full"><br>
	
	<form action="/goods/insert" method="post" name="goods">
	<div class="inputArea"> 
	
	<label for="thumbnail">썸네일 첨부</label>
	<input id="thumbnail" name="thumbnail" type="file"><br>
	<div id="thumbnailImg"></div>
	
	 <label>1차 분류</label>
	   <select onchange="categoryChange(this)" name ="g_category_large" id="g_category_large">
	     <option>전체</option>
	     <option value="아우터">아우터</option>
	     <option value="상의">상의</option>
	     <option value="하의">하의</option>
	   </select>
	    &emsp;&emsp;&nbsp;&nbsp;
	 <label>2차 분류</label>
	    <select id="good" name="g_category_small">
	   <option>전체</option>
	   <option>
	   </select>
	</div>
	
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
	 <label style="width: 80px;" for="g_point" >적립 포인트</label>
	 <input id="g_point" name="g_point">
	</div>
	
	<div>
	 <label for="g_amount">상품 수량</label>
	 <input type="text" id="g_amount" name="g_amount" />
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
	
	<label for="g_files">이미지 첨부</label>
	<input id="g_files" name="g_files" type="file" multiple><br>
	<div id="multipleImgView"></div>
	
	
	
	<div>
	 <button type="submit" id="register_Btn">등록</button>
	</div>
	
	</form>
	</div>
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
		
		//img업로드
		$(document).ready(function() {
			
			var inputFileImage = document.getElementById("g_files");
			inputFileImage.addEventListener("change", function(e) {
		        readMultipleImage(e.target);
		    });
		    
		    function readMultipleImage(inputFile) {
			    var imgArr = Array.from(inputFile.files);
		        
		        imgArr.forEach(function(file, index){
		            var reader = new FileReader();
		            
		            reader.addEventListener("load", function () {
		            	var imgSrc = this.result;
		                var filename = file.name
		                var msg = uploadUpdateForm(imgSrc, getLinkText(filename), filename, filename);
		                $("#multipleImgView").append(msg);
		              });
		              reader.readAsDataURL(file);
		            });

		      }
		    
		    var inputThumbnail = document.getElementById("thumbnail");
		    inputThumbnail.addEventListener("change", function(e) {
				thumbnailImg(e.target);
		    });
		    
		    function thumbnailImg(inputFile) {
		    	var imgArr = Array.from(inputFile.files);
		        
		        imgArr.forEach(function(file, index){
		            var reader = new FileReader();
		            
		            reader.addEventListener("load", function () {
		            	var imgSrc = this.result;
		                var filename = file.name
		                var msg = thumbnailView(imgSrc, filename);
		                $("#thumbnailImg").append(msg);
		              });
		              reader.readAsDataURL(file);
		            });
		    }
		    
		    function g_thumbnailSubmit(gCode) {

				var formData = new FormData();
				formData.append("gCode",gCode);
				
				var file = $('input[name="thumbnail"]');
				var files = file[0].files;
				
				formData.append("file", files[0]);
				console.log(files[0]);
				
				$.ajax({
					type : 'post',
					url : '/goods/uploadthumbnail',
					processData : false,
					contentType : false,
					data : formData,
					dataType : 'text', 
					success : function(filename) {
						        var str = '';
								str += thumbnailUploadFilename(filename);
								$("form").append(str);
						},
						error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					       }
					   
					}); 

			}
		    
		    

		    
		    $("#multipleImgView").on("click", ".delFile", function(){
		    	$(this).parent("div").remove();
		    });

			$("button[type='submit']").click(function(event) {
				event.preventDefault();
				
				var largeCategory = $('#g_category_large').val();
				var smallCategory = $('#good').val();
				var gCode = $('#g_code').val(); 
				
				g_thumbnailSubmit(gCode);
				g_filesSubmit(largeCategory,smallCategory,gCode);
				
			});
			
			function g_filesSubmit(largeCategory,smallCategory,gCode) {

				var formData = new FormData();
				formData.append("largeCategory",largeCategory);
				formData.append("smallCategory",smallCategory);
				formData.append("gCode",gCode);
				
				var file = $('input[name="g_files"]');
				var files = file[0].files;

				var uploadFiles = new Array();
				$('.delFile').each(function(){
					uploadFiles.push($(this).attr("data-filename"));
				});
				
				for(var i = 0; i<files.length; i++){
					var filename = files[i].name;
					if(uploadFiles.includes(filename)){
						formData.append("file", files[i]);
					}
				}
				
				$.ajax({
					type : 'post',
					url : '/goods/uploadfile',
					processData : false,
					contentType : false,
					data : formData,
					dataType : 'json', 
					success : function(filenames) {
						$.each(filenames, function(index, filename) {
							var str = getFileUploadFilenameInput(index, filename);
							$("form").append(str);
						    });
						$("form").submit();
						}
					}); 

			}
			

		});


</script>

	<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	
</body>

</html>