<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/board.js"></script>

<style type="text/css">
    .fileDrop{
        width: 100%;
		height: 250px;
		margin: 20px 0;
    }
</style>

</head>
<body>
<div class="container">
    <div class="row page-header">
        <h1>게시글 작성</h1>
    </div>
    
    <div class="row">
    <form action="/board/update/${vo.bno}?curPage=${curPage}" method="post">
        <div class="panel panel-default">
        
            <div class="panel-heading">
                <label for="title">title</label>
                <input type="text" class="form-control" id="title" name="title">
                <label for="writer">writer</label>
				<input class="form-control" type="text" id="writer" name="writer">
            </div>
            <div class="panel-body">
                <label for="content">content</label>
				<textarea rows="10" class="form-control" id="content" name="content"></textarea><br>
                <label for="fileDrop">파일첨부</label>
				<textarea rows="5" class="form-control fileDrop" id="fileDrop" name="fileDrop" readonly>파일을 드래그 하세요.</textarea>
				<div class="uploadedList"></div>
            </div>
            
            <div class="panel-footer text-center">
            <button type="submit" class="btn btn-danger">게시글 등록</button>
            <button type="reset" class="btn btn-info">뒤로가기</button>
	        </div>
	    </div>
    </form>
    </div>
    
    
    
    
    
    
</div>

<script type="text/javascript">
    $(document).ready(function() {
    	$("button[type='reset']").click(function(event) {
			event.preventDefault();
			$(".delFile").each(function(index) {
				var filename = $(this).attr("data-filename");
				$.ajax({
					type : 'post',
					url : '/board/deleteFile',
					data :{
						filename : filename
					},
					dataType : 'text'
				});
			});
			history.back();
		});
    	
    	$("button[type='submit']").click(function(event) {
			event.preventDefault();
			
			var str = '';
			$(".delFile").each(function(index) {
				var filename = $(this).attr("data-filename");
				str += getFileUploadFilenameInput(index, filename);
			});
			
			$("form").append(str);
			$("form").submit();
		});
		
    	$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
    	
    	$(".fileDrop").on("drop", function(event) {
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files
			var file = files[0];
			
			var formData = new FormData();
			formData.append("file", file);
			
			$.ajax({
				type : 'post',
				url : '/board/uploadfile',
				processData : false,
				contentType : false,
				data : formData,
				dataType : 'text',
				success : function(filename) {
					var msg = uploadUpdateForm(getLinkText(filename), filename, getOriginalName(filename));
					$(".uploadedList").append(msg);
				}
			});
			
    	    
    	
    	});
    	
    	$(".uploadedList").on("click", "small.delFile", function() {
			var that = $(this);
			
			$.ajax({
				type : 'post',
				url : '/board/deleteFile',
				data :{
					filename : that.attr("data-filename")
				}, 
				dataType : 'text',
				success : function(result) {
					alert(result);
					that.parent("p").parent("div").remove();
				}
			});
		});
    	
    	
    	
    	
	});


</script>


</body>
</html>