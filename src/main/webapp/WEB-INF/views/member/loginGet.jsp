<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<link href="/resources/css/member/insert.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/login/login_ok.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div style="margin: auto; width: 500px; height: 500px;">
		<div style="padding: 30px; background: white; text-align: center;">
			<form action="/member/loginPost" method="post">
				<div style="margin: auto; border: solid #eafaea; padding: 10px; width: 300px; margin-bottom: 10px;  border-radius: 7%; ">
					<input placeholder="아이디를 입력하세요." 
					style="border: none; width: 250px; height: 50px;" 
					id="m_id" name="m_id">
				</div>
				<div style="margin: auto; border: solid #eafaea; padding: 10px; width: 300px; margin-bottom: 10px;  border-radius: 7%;">
					<input type="password" placeholder="비밀번호를 입력하세요."
					 style="border: none; width: 250px; height: 50px;"
					 id="m_pw" name="m_pw">
				</div><br>
				<input style="margin: auto; padding: 10px; width: 300px; background: #eafaea;" class="btn" type="submit" value="로그인">
			</form>
		</div>
	</div>
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>