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
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
<script src="/resources/js/goods.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include><br><br>
<div class="body">
	<form  class="u_form" action="/member/update" method="post">
	<div class="title">회원정보 수정 <i class="fas fa-user-edit"></i></div>
		<div>
		<label for="m_id">아이디</label>
		<input id="m_id" name="m_id" value="${dto.m_id}" readonly="readonly">
		</div>
		
		<div>
		<label for="m_pw">패스워드</label>
		<input id="m_pw" name="m_pw"  value="${dto.m_pw}">
		<span>&nbsp;영문자+숫자 15자 내로 입력해주세요.</span>
		</div>
		
		<div>
		<label for="m_name">이름</label>
		<input id="m_name" name="m_name" value="${dto.m_name}">
		<span>&nbsp;한글 5자내로 입력해주세요.</span>
		</div>
		
		<div>
		<label for="m_birth">생년월일</label>
		<input id="m_birth" name="m_birth" value="${dto.m_birth}" type="date">
		<span>&nbsp;다시 입력해주세요.</span>
		</div>
		
		<div>
		<label for="m_email">이메일</label>
		<input id="m_email" name="m_email" type="email" value="${dto.m_email}" >
		</div>
		
		<div>
		<label for="m_zipCode">우편번호</label>
		<input id="m_zipCode" name="m_zipCode" value="${dto.m_zipCode}" >
		</div>
		
		<div>
		<label for="m_adress">주소</label>
		<input id="m_adress" name="m_adress" value="${dto.m_adress}" >
		</div>
		
		<div>
		<label for="m_detailAdress">상세주소</label>
		<input id="m_detailAdress" name="m_detailAdress" value="${dto.m_detailAdress}" >
		</div>
		
		<div>
		<label for="m_phone">핸드폰번호</label>
		<input class="phoneNumber" id="m_phone" name="m_phone" value="${dto.m_phone}" >
		<span>&nbsp;<strong>- (하이픈)</strong> 은 자동입력됩니다.</span>
		</div>
		
		<div>
		<label for="m_gender">성별</label>${dto.m_gender}
		</div><br>
		
		<div class="u_btn">
		<input id="uploadBtn" class="btn" type="submit" value="수정">
		</div>
		<button class="btn reset" type="reset"><i class="fas fa-redo-alt"></i></button>
	</form>
</div>	
	<script type="text/javascript">
		$(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "")
				   .replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
		
		$(document).ready(function() {
			$("#uploadBtn").click(function(event) {
				event.preventDefault();
				
				var m_birth = $("#m_birth").val();
				
				if (m_birth == '') {
					alert("생년월일을 입력해주세요.");
					$("#m_birth").focus();
					return;
				}
				$(".u_form").submit();
			});
		});
	</script>

	
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>