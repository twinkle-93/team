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
<link href="/resources/css/goods/admin.css" rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
	
	<div class="a_main">
	<ul class="nav a_but" style="text-align: center; ">

				<li><a class="a_logo" href="/goods/insert">
				<br><br>&nbsp;<i class="fas fa-user-cog"></i>
						상품 등록
				</a></li>

				<li><a class="a_logo" href="/goods/list"> 
				<br><br>&nbsp;<i class="fas fa-list-ul"></i> 
						상품 목록
				</a></li>

				<li><a class="a_logo" href="/member/list">
				<br><br>&nbsp;<i class="fas fa-address-book"></i> 
						회원 목록
				</a></li>
				
				

			</ul>
	</div>
	
	<jsp:include page="../home/footer.jsp"></jsp:include>
	
</body>
</html>