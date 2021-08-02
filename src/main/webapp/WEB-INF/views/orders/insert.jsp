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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="/resources/css/order/insert.css" rel="stylesheet"
	type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet"
	type="text/css">
<style type="text/css">
</style>
</head>
<body style="background: #F5FAF9;">
	<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div class="body"
		style="width: 1000px; height: 100%; margin: auto; border: 1px; padding: 10px; background: white;">
		<div class="title"
			style="color: green; font-size: 1.5em; font-weight: bold; text-align: center; margin: 40px 0;">
			<i class="fas fa-clipboard-list"></i> 주문서
		</div>

		<form action="/orders/insert" method="post">
			<h4>상품정보</h4>
			<table class="table">
				<thead>
					<tr>
						<th style="width: 400px;">상품명</th>
						<th style="width: 100px;">판매가</th>
						<th style="width: 100px;">수량</th>
						<th style="width: 100px;">적립 포인트</th>
						<th style="width: 100px;">총 금액</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${map.list}" var="carts">
						<tr>
							<td style="text-align: justify;">ο ${carts.c_g_name}</td>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${carts.c_g_price}" /> 원 <input type="hidden"
								name="o_price" value="${carts.c_g_price}"></td>
							<td>${carts.c_amount} 개 <input type="hidden" name="o_amount"
								value="${carts.c_amount}"> <input type="hidden"
								name="o_code" value="${carts.c_g_code}"> <input
								type="hidden" name="o_amount" value="${carts.c_amount}">
							</td>
							<td>${carts.c_g_point * carts.c_amount} 포인트 <input
								type="hidden" name="o_point"
								value="${carts.c_g_point * carts.c_amount}">
							</td>
							<td>
								<!-- 단가 * 수량 --> <fmt:formatNumber pattern="###,###,###"
									value="${carts.c_g_price * carts.c_amount}" /> 원
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5"><br>
							<div class="money" style="margin: 30px 0;">
								<div>
									<label>상품구매 금액</label> <span><fmt:formatNumber
											pattern="###,###,###" value="${map.sumMoney}" /> 원</span>
								</div>
								<div>
									<label>배송료</label> <span><fmt:formatNumber
											pattern="###,###,###" value="${map.fee}" /> 원</span>
								</div>
								<hr style="margin: 10px 0;" />
								<div>
									<label>전체 주문금액</label> <span style="font-size: 1.5em;"><fmt:formatNumber
											pattern="###,###,###" value="${map.allSum}" /> 원</span>
								</div>

							</div></td>
					</tr>
				</tbody>
			</table>

			<h4>배송정보</h4>
			<div
				style="padding: 15px 10px; border: 3px solid #C8CCCC; margin-bottom: 30px;">
				<input id="o_id" type="hidden" name="o_id"
					value="${map.member.m_id}"> <label for="o_name">수령인</label><input
					id="o_name" name="o_name" value="${map.member.m_name}">
				&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; <label>휴대전화</label> <input
					id="o_phone" name="o_phone" value="${map.member.m_phone}"><br>

				<label>배송지 주소</label><input type="text" name="o_zipcode"
					id="o_zipcode" value="${map.member.m_zipCode}"> <input
					style="background: white;" type="button" id="addressAPI"
					value="우편번호"><br> <label></label><input type="text"
					id="o_address" name="o_address" value="${map.member.m_address}">
				<span> 기본주소</span><br> <label></label><input type="text"
					id="o_detailAddress" name="o_detailAddress"
					value="${map.member.m_detailAddress}"> <span> 나머지주소</span>
				<br> <label>배송 메모</label><input type="text" id="o_memo"
					name="o_memo" placeholder="배송시 요청사항을 입력하세요.">
			</div>


			<h4>쿠폰/적립금 할인</h4>
			<div class="coupon_border">
			<input type="hidden" id="o_totalprice" name="o_totalprice"
				value="${map.allSum}"> 
			<label>보유 쿠폰 할인</label>
			<button id="coupon" data-toggle="collapse" href="#couponList" aria-expanded="false">쿠폰선택</button>
			<input id="couponDiscount" type="text" style="width : 60px; border: 0px; outline: none; text-align: right;"> 원 할인
			<div class="collapse" id="couponList">
			    <table class="couponList">
			        <thead>
			            <tr>
			                <th>쿠폰번호</th>
			                <th>쿠폰이름</th>
			                <th>할인금액</th>
			                <th>최소주문금액</th>
			                <th>사용가능여부</th>
			            </tr>
			        </thead>
			        <tbody>
			            <tr>
			               <td id="c_num"></td>
			               <td id="c_name"></td>
			               <td id="c_discount"></td>
			               <td id="c_totalPrice"></td>
			               <td id="c_availavle"> <button id="couponClick" data-toggle="collapse" href="#couponList">쿠폰사용</button></td>
			            </tr>
			        </tbody>
			        
			    </table>
			</div>
			<br>
			<label>적립금 사용</label><input type="checkbox" id="pointAll"> 전체사용 
			<span style="color: red; font-size: small;"> (체크박스를 꼭 클릭해주세요!)</span> <br> 
			<input id="pointDiscount" name="o_pointDiscount" type="text" value=""> Point <br>
			<span style="font-size: small; color: blue;">보유적립금 <span><fmt:formatNumber pattern="###,###,###"
					value="${map.member.m_point}" /> Point</span> </span> <br>
			</div>
			<table class=table-bordered>
				<thead>
					<tr>
						<th>전체 주문금액</th>
						<th>할인 금액</th>
						<th>총 결제 금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><fmt:formatNumber pattern="###,###,###"
								value="${map.allSum}" /> 원</td>
						<td><input type="text" style="border: 0px; outline: none;"
							id="o_discount" name="o_discount" value="" readonly>원</td>
						<td><input type="hidden" id="o_paymentAmount" name="o_paymentAmount" value="${map.allSum}"> 
						<fmt:formatNumber pattern="###,###,###"
								value="${map.allSum}"></fmt:formatNumber> 원</td>
					</tr>
				</tbody>
			</table>

			<label>보유 잔액</label> <span><fmt:formatNumber
					pattern="###,###,###" value="${map.member.m_money}" /> 원</span>
					<br>현재 잔액 충천은 DB를 통해서만 가능합니다.
			<!-- <button>잔액 충전</button> -->
			<br>
			<div class="order_btn">
				<button class="btn" id="goodOrdersBtn">결제</button>
				<button class="btn" id="goodsCartBtn">이전페이지</button>
			</div>
		</form>
	</div>

	<div class="blank"></div>
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
		
		//쿠폰할인
		$("#coupon").click(function() {
			event.preventDefault();
			var m_c_num = '';
			$.getJSON("/member/couponRead/${map.member.m_id}", function(data) {
				$("#c_num").text(data);
				$.getJSON("/coupon/read/" + data, function(cou) {
					var coupon = cou[0]
					$("#c_name").text(coupon['c_name']);
					$("#c_discount").text(coupon['c_discount']);
					$("#c_totalPrice").text(coupon['c_totalPrice'] +"원 이상 구매");
				});
			});
		});
		
		//쿠폰사용 버튼 클릭
		$("#couponClick").click(function() {
			event.preventDefault();
			var discount = $("#c_discount").text();
			$("#couponDiscount").val(discount);
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
				alert("주문 완료");
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
		                document.getElementById('o_zipcode').value = data.zonecode;
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
			        