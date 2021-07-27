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
	label {width: 100px; height: 40px; text-align: justify;}
	div > input {width: 140px;}
	input[type=password] {font-family:'Malgun gothic', dotum, sans-serif;}\
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
</style>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>

<div class="full" style="width: 500px; height: 850px; margin: auto;">
	<div>	
	<form  class="i_form" action="/member/insert" method="post" style="  margin-top: 50px; 
				padding: 20px; border-radius: 5%; position: absolute;">
	<div style="color:green; font-size: 3em; text-align: center; margin: 10px 0 40px 0;">회원가입 <i class="far fa-file-alt"></i></div>
		<div>
		<label for="m_id">아이디</label>
		<input id="m_id" name="m_id">
		<span style="font-size: small;">&nbsp;영문자+숫자 10자 내로 입력해주세요.</span>
		</div>
		
		<div>
		<label for="m_pw">패스워드</label>
		<input id="m_pw" name="m_pw" type="password">
		<span style="font-size: small;">&nbsp;영문자+숫자 15자 내로 입력해주세요.</span>
		</div>
		
		<div>
		<label for="m_name">이름</label>
		<input id="m_name" name="m_name">
		<span style="font-size: small;">&nbsp;한글 5자내로 입력해주세요.</span>
		</div>
		
		<div>
		<label for="m_birth">생년월일</label>
		<input id="m_birth" name="m_birth" type="date">
		</div>
		
		<div>
		<label for="m_email">이메일</label>
		<input id="m_email" name="m_email" type="email">
		</div>
		
		<div>
		<label for="m_zipCode">우편번호</label>
		<input id="m_zipCode" name="m_zipCode">
		</div>
		
		<div>
		<label for="m_adress">주소</label>
		<input id="m_adress" name="m_adress">
		</div>
		
		<div>
		<label for="m_detailAdress">상세주소</label>
		<input id="m_detailAdress" name="m_detailAdress">
		</div>
		
		<div>
		<label for="m_phone">핸드폰번호</label>
		<input class="phoneNumber" id="m_phone" name="m_phone">
		<span style="font-size: small;">&nbsp;<strong>- (하이픈)</strong> 은 자동입력됩니다.</span>
		</div>
		
		<div>
		<label for="m_gender">성별</label>
		<input style="width: 20px;" type="radio" id="m_gender" name="m_gender" value="남자"> 남자&emsp;
		<input style="width: 20px;" type="radio" id="m_gender" name="m_gender" value="여자"> 여자
		</div><br>
		
		<div style="text-align: center;">
		<input style="background: #8cd98c;" class="btn" type="submit" value="가입">
		</div>
		<button style="float: right;" class="btn" type="reset"><i class="fas fa-redo-alt"></i></button>
	</form>
	</div>
</div>	
	<script type="text/javascript">
		$(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "")
				   .replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
	</script>
	<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>