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
<link href="/resources/css/update.css" rel="stylesheet" type="text/css">
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/goods.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="main_top.jsp"></jsp:include>


	<div class="full"><br>
	
	<form action="/goods/update/${dto.g_code}" method="post">
		<div class="inputArea">
		
		
		<div class="thumbnailView" id="thumbnailView">
			<img class="img-thumbnail thumbnail" width="800" src="/resources/img/product/thumbnail/_s_${dto.g_code}.png">
		</div>
		<input id="thumbnailChange" type="hidden" value="">
		<label for="thumbnailUpdate">썸네일 변경</label>
	    <input id="thumbnailUpdate" name="thumbnailUpdate" type="file"><br>
	    
		
		 
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
		 <input type="hidden" name="g_code" value="${dto.g_code}" id="c">
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
		
		<label for="g_files">이미지 추가</label>
		<input id="g_files" name="g_files" type="file" multiple><br>
		<div id="multipleImgView" ></div>
		
		<div>
			<input class="update_btn" type="submit" value="수정">
			<input class="submit" type="reset" value="초기화">
		</div>
	
	</form>
	</div>
	
	<script type="text/javascript">
	    $(document).ready(function () {
	    	var g_code =  ${dto.g_code};
	    	getGoodsAttach(g_code); 
	    	
	    	var addArr= new Array();
			var delArr= new Array();
			var existingArr=new Array();
			
	    	
	    	
	    	$(".update_btn").click(function(event) {
				event.preventDefault();
				
 				var change = $('#thumbnailChange').val();
				if(change == 'ok'){
					deleteThumbnail(g_code);
				}
  				var largeCategory = '${dto.g_category_large}'; 
				var smallCategory = '${dto.g_category_small}';
				g_filesSubmit(largeCategory,smallCategory,g_code); 
			});
	    	
			function deleteThumbnail(g_code) {
				
				$.ajax({
					type : 'post',
					url : '/goods/deleteThumbnail',
					data : {
						"g_code" : g_code
					},
					dataType : 'text',
					success : function(result) {
						g_thumbnailSubmit(g_code);
					},
					error: 
						function(request,status,error){
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				       }
				});
				
				
			}
			
			function g_thumbnailSubmit(g_code) {

				var formData = new FormData();
				formData.append("g_code",g_code);
				
				var file = $('input[name="thumbnailUpdate"]');
				var files = file[0].files;
				
				formData.append("file", files[0]);
				
				$.ajax({
					type : 'post',
					url : '/goods/uploadthumbnail',
					processData : false,
					contentType : false,
					data : formData,
					dataType : 'text', 
					success : function(filename) {
						},
					error: 
							function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					       }
					   
					}); 

			}
			
			function getGoodsAttach(g_code){ 
				$.getJSON("/goods/getGoodsAttach/"+g_code, function(result) {
					for(var i=0;i<result.length;i++){
						var filename = result[i];
 						existingArr.push(filename); 
						var msg = updateViewForm(filename);
						$("#multipleImgView").append(msg);
						console.log("existingArr"+ existingArr);
					}
				});
			}
	    	
			var inputThumbnail = document.getElementById("thumbnailUpdate"); 
		    inputThumbnail.addEventListener("change", function(e) {
				thumbnailImg(e.target);
				
		    });
		    
		    function thumbnailImg(inputFile) {  /* ok */
		    	var imgArr = Array.from(inputFile.files);
		        
		        imgArr.forEach(function(file, index){
		            var reader = new FileReader();
		            
		            reader.addEventListener("load", function () {
		            	var imgSrc = this.result;
		                var filename = file.name
		                var msg = thumbnailView(imgSrc, filename);
		                $("#thumbnailView").empty();
		                $("#thumbnailView").append(msg);
		                $('#thumbnailChange').val('ok');
		            });
		            
		            reader.readAsDataURL(file);
		         });
		    }
		    
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
		    
		    
		    
 		    $("#multipleImgView").on("click", ".delFile", function(){
		    	$(this).parent("div").remove();
		    	delArr.push($(this).attr("data-filename"));
		    	console.log(delArr);
		    }); 
		    
		    function g_filesSubmit(largeCategory,smallCategory,g_code) {

				var formData = new FormData();
				formData.append("largeCategory",largeCategory);
				formData.append("smallCategory",smallCategory);
				formData.append("g_code",g_code);
				
				var file = $('input[name="g_files"]');
				var files = file[0].files;

				var uploadFiles = new Array();
				$('.delFile').each(function(){
					uploadFiles.push($(this).attr("data-filename"));
				});
				
				for(var i = 0; i<files.length; i++){
					var filename = files[i].name;
					if(uploadFiles.includes(filename)){
						formData.append("file", files[i])
					}
				}
				
				var updateFilename = new Array();
								
				var upload = $.ajax({
					type : 'post',
					url : '/goods/uploadfile',
					processData : false,
					contentType : false,
					data : formData,
					dataType : 'json', 
					success : function(filenames) {
						for(var i=0; i<filenames.length; i++){
							var filename = filenames[i];
							updateFilename.push(filename);
						}
					}
				});
								  
				upload.always(function() {
					for(var i=0; i<existingArr.length; i++){ 
						var existingfile = existingArr[i];
						if(!delArr.includes(existingfile)){
							updateFilename.unshift(existingArr[i]);
						}
					}	
					$.each(updateFilename, function(index, filename) {
						var str = getFileUploadFilenameInput(index, filename);
						$("form").append(str);
				    });
					deleteGoodsAttach();
 					$("form").submit(); 
				});	

			}	
		    
		    function deleteGoodsAttach() {
		    	
		    	var filenames = new Array();
		    		 
		    		for(var i in delArr) {
		    		    var deleteFile = delArr[i];
		    		    if(existingArr.includes(deleteFile)){
			    			filenames.push(delArr[i]);
		    		    }
		    		}
		    		
		    	if(!filenames.length == 0){
		    		$.ajax({
						type : 'post',
						url : '/goods/deleteGoodsAttach',
						traditional: true,
						data :{
							filenames : filenames
						},
						success : function(result) {
						},
						error: 
							function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					       }
					});
		    	}	

		    	
		 	}  
		});
		
		
		
		
	
	
	</script>
	
	
	

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>