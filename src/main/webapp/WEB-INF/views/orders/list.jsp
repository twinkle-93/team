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
<link href="/resources/css/order/list.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div class="body">
	<div class="title"
		style="color: green; font-size: 2.5em; font-weight: bold; text-align: center; margin: 40px 0;">
		<i class="fas fa-clipboard-list"></i> 전체 주문내역
	</div>
	<div class="t_body">
	<table class="table" >
					<thead>
						<tr>
						    <th>주문 번호</th>
						    <th>ID</th>
							<th>주문 날짜</th>
							<th>주문 상품 (수량)</th>
							<th>총 금액</th>
							<th>할인 금액</th>
							<th>결제 금액</th>
							<th>적립 포인트</th>
							<th>배송 정보</th>
						</tr>
					</thead>
					<tbody>
  				<c:forEach items="${list}" var="list">
  				<tr>
  					<td>${list.o_number}</td>
  					<td>${list.o_id}</td>
  				    <td class="o_regDate">
  				    	<fmt:formatDate value="${list.o_regDate}" pattern="yyyy년 MM월 dd일"/><br>
  				   		<fmt:formatDate value="${list.o_regDate}" pattern="hh시 mm분"/>
  				    </td>
  				    
  				    
  				    <td><a href="/goods/read/${list.o_code}?curPage=1">${list.o_code} ( ${list.o_amount} 개)</a></td>
  					<td >
  					<fmt:formatNumber value="${list.o_totalprice}" pattern="###,###,###"/> 원
  					</td>
  					<td>
  					<fmt:formatNumber value="${list.o_discount}" pattern="###,###,###"/> 원
  					</td>
  					<td>
  					<fmt:formatNumber value="${list.o_paymentAmount}" pattern="###,###,###"/> 원
  					</td>
  					<td>
  					<fmt:formatNumber value="${list.o_point}" pattern="###,###,###"/> Point
  					</td>
  					<td><a class="detailAddress">${list.o_address}</a>
  					<input type="hidden" class="o_detailAddress" value="${list.o_detailAddress}">
  					<input type="hidden" class="o_memo" value="${list.o_memo}">
  					</td>
  				</tr>
  				</c:forEach>
  			</tbody>

		</table>
		</div>			
</div>
<script type="text/javascript">
    $(document).ready(function() {
    	
    	//배송정보 클릭시 상세주소 + 배송메모 
    	$(".detailAddress").click(function() {
    		event.preventDefault();
    		var o_address = $(this).text();
    		var o_detailAddress = $(this).next(".o_detailAddress").val();
    		var o_memo = $(this).next(".o_memo").val();
    		alert(o_address + o_detailAddress + "\n배송메모 :"+  o_memo);
		});
    	
    	
/* 
    		if($(".o_regDate").prevAll().text == $(".o_regDate").text){
        		this.text("");
    		}	 */
    	
    	
    	
    });  
</script>
	
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>