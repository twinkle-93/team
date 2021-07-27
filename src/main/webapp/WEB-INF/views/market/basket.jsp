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

<ul>
  <c:forEach items="${b_list}" var="b_list">
  <li>
   <div class="thumb">
    <!-- <img src="${cartList.gdsThumbImg}" /> 썸네일 -->
   </div>
   <div class="gdsInfo">
    <p>
	 <span><input type="checkbox"> </span>
     <span>상품명</span>${b_list.gdsName}<br />
     <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${b_list.g_price}" /> 원<br />
     <span>구입 수량</span>${b_list.g_amount} 개<br />
     <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${b_list.g_price * b_list.g_amount}" /> 원
    </p>
    
    <div class="delete">
     <button type="button" class="delete_btn">삭제</button>
    </div>
   </div>   
  </li>
  </c:forEach>
 </ul>
</body>
</html>