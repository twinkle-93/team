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
<link href="/resources/css/member/cartList.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css"  rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
<div class="title">장바구니 <i class="fas fa-shopping-cart"></i></div>
	<div class="table">
	<c:choose>
		<c:when test="${map.count==0}">
			<div class="nothing">
				<h4>장바구니가 비어있습니다.</h4>
				<p>물건을 담아보세요!&emsp;
				<button class="btn" id="goodsListBtn">상품 목록</button></p>
			</div>
		</c:when>
		<c:otherwise>
			<form action="/cart/update" method="post">
			<input class="btn" type="submit" value="수정">
				<table class="table" >
					<thead>
						<tr>
							<th>상품명</th>
							<th>단가</th>
							<th>수량</th>
							<th>총 금액</th>
							<th>취소</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${map.list}" var="carts">
							<tr>
								<td>
									${carts.c_g_name}
								</td>
								<td style="width: 80px" align="right">
									<fmt:formatNumber pattern="###,###,###" value="${carts.c_g_price}"/> 원
								</td>
								<td>
									<!-- input -->
									<input type="number" style="width: 40px" name="c_amount" value="${carts.c_amount}"> 개
									
									<!-- input -->
									<input type="hidden" name="c_g_code" value="${carts.c_g_code}">
								</td>
								<td style="width: 100px" align="right">

									<!-- 단가 * 수량 -->
                           			<fmt:formatNumber pattern="###,###,###" value="${carts.c_g_price * carts.c_amount}"/> 원
								</td>
								<td>
									<a href="/cart/delete/${carts.c_id}">삭제</a>
								</td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="5">
								<br><p>100,000원 미만 주문시 배송료가 추가됩니다.</p>
								<div class="money">
									<div>
										<label>장바구니 금액 합계</label> 
										<span><fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/> 원</span> 
									</div>
									<div>
										<label>배송료</label> 
										<span><fmt:formatNumber pattern="###,###,###" value="${map.fee}"/> 원</span>
									</div>
									<div>	
										<label>전체 주문금액</label> 
										<span><fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/> 원</span>
									</div>	
								</div>	
								</td>
							</tr>
					</tbody>
				</table>
				
				<!-- input --><br>
				<input type="hidden" name="c_count" value="${map.count}">
				<button class="btn" id="goodsListBtn">상품 목록</button>
			</form>
		</c:otherwise>
	</c:choose>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#goodsListBtn").click(function(event) {
				event.preventDefault();
				location.assign("/goods/list");
			});
		});
	</script>

<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>