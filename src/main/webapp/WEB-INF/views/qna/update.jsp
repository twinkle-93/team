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
<link href="/resources/css/member/update.css" rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
<script src="/resources/js/goods.js" type="text/javascript"></script>
<style type="text/css">
	label {width:100px; height: 40px; text-align: justify;}
	.btn {margin: 10px;}
.i_form {
 width: 500px; height: 730px; margin: auto;
  position: relative;
  z-index: 1;
}
.i_form::after {
   width: 500px; height: 730px;
  content: "";
  background: url('/resources/img/note.png');
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.4;
}
input {
	width: 140px;
}
</style>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div class="full" style="width: 500px; height: 850px; margin: auto;">
	<div>	
	<form  class="i_form" action="/qna/update" method="post" style="  margin-top: 50px; 
				padding: 20px; border-radius: 5%; position: absolute;">
				<input type="hidden" value="${dto.qna_num }" name="qna_num"> 
	<div style="color:green; font-size: 3em; text-align: center; margin: 10px 0 40px 0;">제목 내용 수정 <i class="fas fa-user-edit"></i></div>
		<div>
		<label for="qna_id">작성자</label>
		<input name="qna_id" style="border: none;" value="${dto.qna_id}" readonly="readonly">
		</div>
		
		<div>
		<label for="qna_title">제목</label>
		<input id="qna_title" name="qna_title"  value="${dto.qna_title}">
		<span style="font-size: small;">&nbsp;제목을 수정해주세요.</span>
		</div>
		
		<div>
		<label for="qna_content">내용</label>
		<input id="qna_content" name="qna_content" value="${dto.qna_content}">
		<span style="font-size: small;">&nbsp;내용을 수정해주세요.</span>
		</div>
		
		<br>
		
		<div style="text-align: center;">
		<input style="background: #8cd98c;" class="btn" type="submit" value="수정">
		</div>
		<button style="float: right;" class="btn" type="reset"><i class="fas fa-redo-alt"></i></button>
	</form>
	</div>
</div>	
	

	
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>