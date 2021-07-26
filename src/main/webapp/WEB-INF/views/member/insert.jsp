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
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div class="full">
	<form name="form" class="i_form" action="/member/insert" method="post" onsubmit="return check();">
		<div class="title">회원가입 <i class="far fa-file-alt"></i></div>
		
		<div>
		<label for="m_id">아이디</label>
		<input id="m_id" name="m_id">
		<span>&nbsp;영문자+숫자 10자 내로 입력해주세요.</span>
		</div>
		
		<div>
		<label for="m_pw">패스워드</label>
		<input id="m_pw" name="m_pw" type="password">
		<span>&nbsp;영문자+숫자 15자 내로 입력해주세요.</span>
		</div>
		
		<div>
		<label for="m_name">이름</label>
		<input id="m_name" name="m_name">
		<span>&nbsp;한글 5자내로 입력해주세요.</span>
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
		<span>&nbsp;<strong>- (하이픈)</strong> 은 자동입력됩니다.</span>
		</div>
		
		<div>
		<label for="m_gender">성별</label>
		<input type="radio" id="m_gender" name="m_gender" value="남자"> 남자&emsp;
		<input type="radio" id="m_gender" name="m_gender" value="여자"> 여자
		</div><br>
		
		<div style="text-align: center;">
		<input id="insertBtn" class="btn" type="submit" value="가입">
		</div>
		<button class="btn" type="reset"><i class="fas fa-redo-alt"></i></button>
	</form>
</div>	
	<script type="text/javascript">
		$(document).on("keyup", ".phoneNumber", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "")
					   .replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
		
		function check() {
			  if (!document.form.m_gender[0].checked && !document.form.m_gender[1].checked) {
			    alert("성별을 선택해주세요.");
			    return false;
			  }
			}
		
	
		$(document).ready(function() {
			$("#insertBtn").click(function (event) {
				event.preventDefault();
				
				var m_id = $("#m_id").val();
				var m_pw = $("#m_pw").val();
				var m_name = $("#m_name").val();
				var m_birth = $("#m_birth").val();
				var m_email = $("#m_email").val();
				var m_zipCode = $("#m_zipCode").val();
				var m_adress = $("#m_adress").val();
				var m_detailAdress = $("#m_detailAdress").val();
				var m_phone = $("#m_phone").val();
				var m_gender = $("#m_gender").val();
				
				if (m_id == '') {
					alert("아이디를 입력해주세요.");
					$("#m_id").focus();
					return;
				}
				if (m_pw == '') {
					alert("비밀번호를 입력해주세요.");
					$("#m_pw").focus();
					return;
				}
				if (m_name == '') {
					alert("이름을 입력해주세요.");
					$("#m_name").focus();
					return;
				}
				if (m_birth == '') {
					alert("생년월일을 입력해주세요.");
					$("#m_birth").focus();
					return;
				}
				if (m_email == '') {
					alert("이메일을 입력해주세요.");
					$("#m_email").focus();
					return;
				}
				if (m_zipCode == '') {
					alert("우편번호를 입력해주세요.");
					$("#m_zipCode").focus();
					return;
				}
				if (m_adress == '') {
					alert("주소를 입력해주세요.");
					$("#m_adress").focus();
					return;
				}
				if (m_detailAdress == '') {
					alert("상세주소를 입력해주세요.");
					$("#m_detailAdress").focus();
					return;
				}
				if (m_phone == '') {
					alert("전화번호를 입력해주세요.");
					$("#m_phone").focus();
					return;
				}
				/* if (m_gender == null) {
					alert("아이디를 입력해주세요.");
					$("#m_gender").focus();
					return;
				} */
				$(".i_form").submit();
			});
		});
		
	</script>
	<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>