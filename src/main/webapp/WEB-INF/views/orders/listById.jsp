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
<link href="/resources/css/member/login.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
	<table class="table" >
					<thead>
						<tr>
							<th>주문 날짜</th>
							<th>주문 상품</th>
							<th>수량</th>
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
  				    <td class="${list.o_regDate}" >${list.o_regDate}</td>
  				    <td><a href="/goods/read/${list.o_code}?curPage=1">${list.o_code}</a></td>
  				    <td>${list.o_amount}</td>
  					<td >${list.o_totalprice}</td>
  					<td>${list.o_discount}</td>
  					<td>${list.o_paymentAmount}</td>
  					<td>${list.o_point}</td>
  					<td>${list.o_address} 
  					${list.o_detailAddress}
  					배송메모 : ${list.o_memo}
  					</td>
  					
  				</tr>
  				</c:forEach>
  			</tbody>

		</table>

<script type="text/javascript">
    $(document).ready(function() {
    	
	});
</script>
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>