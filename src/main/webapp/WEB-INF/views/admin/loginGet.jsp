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
<link href="/resources/css/admin/login.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div class="body">
		<div>
			<form action="/admin/loginPost" method="post" autocomplete="off">
				<h4>관리자용</h4>
				<div>
					<input placeholder="아이디를 입력하세요." name="a_id" id="a_id">
				</div>
				<div>
					<input type="password" placeholder="비밀번호를 입력하세요." name="a_pw" id="a_pw">
				</div><br>
				<input id="loginBtn" class="btn" type="submit" value="로그인">
				
				<c:if test="${msg == 'failure'}">
						<p class="fail">아이디 또는 비밀번호가 일치하지 않습니다!</p>
				</c:if>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginBtn").click(function(event) {
				event.preventDefault();
				
				var m_id = $("#a_id").val();
				var m_pw = $("#a_pw").val();
				
				if(m_id == ''){
					alert("아이디를 입력하세요");
					$("#a_id").focus();
					return;
				}
				
				if(m_pw == ''){
					alert("비밀번호를 입력하세요");
					$("#a_pw").focus();
					return;
				}
				
				$("form").submit();
			});
			
		});
	</script>
	

<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>
