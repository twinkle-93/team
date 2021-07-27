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
</head>
<body>
<div class="collapse"> <!-- 자바스트립트를 이용해 토글. 리스트가 보이고 안보이게 -->
<ul>
  <c:set var="o_Price" value="0" />
  <c:forEach items="${#}" var="b_list">
  <li>
   <div class="thumb">
    <!-- <img src="${b_list.gdsThumbImg}" /> 썸네일 -->
   </div>
   <div>
    <p>
	 <span><input type="checkbox"> </span>
     <span>상품명</span>${b_list.g_name}<br />
     <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${b_list.g_price}" /> 원<br />
     <span>구입 수량</span>${b_list.g_amount} 개<br />
    </p>
    
    <div class="delete">
     <button type="button" class="delete_btn">삭제</button>
    </div>
   </div>   
  </li>
  <c:set var="o_totalPrice" value="${o_Price + (b_list.g_price * b_list.g_amount)}" />
  <c:set var="o_totalPrice" value="${b_list.g_price * b_list.g_amount}" />
  </c:forEach>
 </ul>
</div>
<div class="listResult">
 <div>
  총 합계 : <fmt:formatNumber pattern="###,###,###" value="${o_totalPrice}" />원
 </div>
 
</div>

<div class="orderInfo">
	<div>
		 <label for="m_id">아이디</label>
  		 <input value="${m_id}" type="text" name="m_id" id="m_id" readonly/>
	</div>
	<div>
		 <label for="">주문자</label>
  		 <input value="${m_name}" type="text" name="m_name" id="m_name" readonly/>
	</div>
	<div>
		 <label for="">주문자 연락처</label>
  		 <input value="${m_phone}" name="m_phone" id="m_phone" readonly/>
	</div>
 <form action="#" method="post" autocomplete="on">
    
  <div class="m_name">
   <label for="">수령인</label>
   <input type="text" name="m_name" id="m_name" required="required" />
  </div>
  
  <div>
   <label for="m_phone">수령인 연락처</label>
   <input type="text" name="m_phone" id="m_phone" required="required" />
  </div>
  
  <div>
   <label for="m_zipCode">우편번호</label>
   <input type="text" name="m_zipCode" id="m_zipCode" required="required" />
  </div>
  
  <div>
   <label for="m_adress">1차 주소</label>
   <input type="text" name="m_adress" id="m_adress" required="required" />
  </div>
  
  <div>
   <label for="m_detailAdress">2차 주소</label>
   <input type="text" name="m_detailAdress" id="m_detailAdress" required="required" />
  </div>
  <div>
 결제금액 : <fmt:formatNumber pattern="###,###,###" value="${o_totalPrice}" />원
 </div>
  <div>
   <button type="submit" class="order_btn">결제</button>
   <button type="button" class="cancel_btn">취소</button> 
  </div>
  
 </form> 
</div>

</body>
</html>