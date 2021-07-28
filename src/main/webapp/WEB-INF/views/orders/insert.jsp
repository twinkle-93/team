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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="/resources/css/main/main.css"  rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div class="title">주문하기</div>
<div class="table">				
	<form action="/orders/insert" method="post">
		<h3>배송정보</h3>
		<input id="o_id" type="hidden" name="o_id" value="${map.member.m_id}">
		<label for="o_name">수령인</label> 
		<input id="o_name" name="o_name" value="${map.member.m_name}"> <br> 
		<label>휴대전화</label>
		<input id="o_phone" name="o_phone" value="${map.member.m_phone}"> <br>
		
		<label>배송지 주소</label><input type="button" id="addressAPI" value="주소 변경"><br>
		<label for="o_zipCode">우편번호</label> 
		<input type="text" name="o_zipcode" id="o_zipcode" value="${map.member.m_zipCode}">
		<label for="o_address">주소</label>
		<input type="text" id="o_address" name="o_address" value="${map.member.m_address}">
		<label for="o_detailAddress">상세주소</label>
		<input type="text" id="o_detailAddress" name="o_detailAddress" value="${map.member.m_detailAddress}"> <br>
		
		<label>배송 메모</label>
		<input type="text" id="o_memo" name="o_memo" placeholder="배송시 요청사항을 입력하세요.">
		
		<h3>상품정보</h3>	
		<table class="table">
			<thead>
				<tr>
					<th>상품명</th>
					<th>단가</th>
					<th>수량</th>
					<th>총 금액</th>
					<th>적립 포인트</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${map.list}" var="carts">
					<tr>
						<td>${carts.c_g_name}</td>
						<td style="width: 80px" align="right"><fmt:formatNumber
								pattern="###,###,###" value="${carts.c_g_price}" /> 원
								<input type="hidden" name="o_price" value="${carts.c_g_price}"></td>
						<td>
							<!-- input --> <input style="outline: none; border: 0px;" readonly
							name="c_amount" value="${carts.c_amount}"> 개 <!-- input -->
							<input type="hidden" name="o_code" value="${carts.c_g_code}">
							<input type="hidden" name="o_amount" value="${carts.c_amount}">
						</td>
						<td style="width: 100px" align="right">
							<!-- 단가 * 수량 --> <fmt:formatNumber pattern="###,###,###"
								value="${carts.c_g_price * carts.c_amount}" /> 원
						</td>
						<td><input style="border: 0px;" name="o_point" value="${carts.c_g_point}" readonly></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5"><br>
						<div class="money">
							<div>
								<label>장바구니 금액 합계</label> <span><fmt:formatNumber
										pattern="###,###,###" value="${map.sumMoney}" /> 원</span>
							</div>
							<div>
								<label>배송료</label> <span><fmt:formatNumber
										pattern="###,###,###" value="${map.fee}" /> 원</span>
							</div>
							<div>
								<label>전체 주문금액</label> <span><fmt:formatNumber
										pattern="###,###,###" value="${map.allSum}" /> 원</span>
							</div>

						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<h3>쿠폰/추가할인</h3>
		
		<label>전체 주문금액</label> <span><fmt:formatNumber
		    pattern="###,###,###" value="${map.allSum}" /> 원</span> <br>
		    <input type="hidden" id="o_totalprice" name="o_totalprice" value="${map.allSum}">
		<label>보유 쿠폰 할인</label> <button id="coupon">쿠폰선택</button> <br>
		<input id="couponDiscount" type="text" style="border: 0px;"> <br> <!-- 쿠폰할인금액 -->
		
		<label>적립금 사용</label> <br>
		<input id="pointDiscount" name="o_pointDiscount" type="text" value=""> point <br>
		보유적립금<span><fmt:formatNumber
		    pattern="###,###,###" value="${map.member.m_point}" />point</span> 
		    <input type="checkbox" id="pointAll"> 전체사용 <br>
		
		<label>할인 금액</label> 
		    <input style="border: 0px;" id="o_discount" name="o_discount" value="" readonly>원 <br>     
		
		<label>결제 금액</label>
		    <input style="border: 0px;" id="o_paymentAmount" name="o_paymentAmount" value="${map.allSum}" readonly>원 <br>
		
		<label>보유 잔액</label> <span><fmt:formatNumber
		    pattern="###,###,###" value="${map.member.m_money}" /> 원</span>    
		 <button>잔액 충전</button>
		 
		
		    
		
		
		
		

		
		<br>
		<button class="btn" id="goodOrdersBtn">주문 완료</button>
		<button class="btn" id="goodsCartBtn">주문 수정 (장바구니)</button>
	</form>
	</div>
	
	<script type="text/javascript">
	    
	    //할인 적용 후 총 할인금액 변경 o_discount
		function discountUpdate() {
			if($("#pointDiscount").val()>${map.member.m_point}){
		    	alert("보유 적립금보다 큰 금액은 입력할 수 없습니다.");
		    	$("#pointDiscount").val("");
		    }
	    	var point = $("#pointDiscount").val();
	    	var coupon = $("#couponDiscount").val();
			$("#o_discount").val(Number(point) + Number(coupon));
		}
	    
	    //총 할인금액 변경 후 최종 결제금액 변경 o_paymentAmount
	    function paymentAmount() {
	    	var discount = $("#o_discount").val();
	    	var allSum = ${map.allSum}
			$("#o_paymentAmount").val(Number(allSum) - Number(discount));
		}
	    
		$(document).ready(function() {
			// 적립금 전체사용 체크박스 클릭시
			$("#pointAll").change(function(){
		        if($("#pointAll").is(":checked")){
		        	$("#pointDiscount").val(${map.member.m_point});
		        	discountUpdate();
		        	paymentAmount();
		        }
			});
			
			//쿠폰할인(임시)
			$("#coupon").click(function() {
				event.preventDefault();
				$("#couponDiscount").val(300);
				discountUpdate();
				paymentAmount();
			});
			
			//주문완료버튼 
			$("#goodOrdersBtn").click(function() {
				event.preventDefault();
				var pamentAmount = $("#o_paymentAmount").val();
				var m_money = ${map.member.m_money};
				if(pamentAmount > m_money){
					alert("결제실패 : 잔액이 부족합니다"+m_money);
				} else {
					$("form").submit();
					/* alert("주문 완료");
					location.assign("/orders/list"); */
				}
			});
			
			//주문수정 -> 장바구니
			$("#goodsCartBtn").click(function() {
				event.preventDefault();
				location.assign("/cart/list");
			});

			
			
			
			
			// 주소 변경 클릭시
			$("#addressAPI").click(function(){
				event.preventDefault();
				execDaumPostcode();
			});
			
			//우편번호 검색 api
			function execDaumPostcode() {
				new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                }    
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('o_zipCode').value = data.zonecode;
		                document.getElementById("o_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("o_detailAddress").focus();
		            }
		        }).open()
			
		    }
			
			
			
			
			
			
			
			
		});
	
	</script>

<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>
