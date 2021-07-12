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
<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }
</style>
</head>
<body>
<form action="#" method="post">

<div>
 <label for="g_name">상품명</label>
 <!-- ${goods.g_name} --> 
</div>

<label>사이즈</label>
 <select name="g_size">
  <option value="XL">XL</option>
  <option value="L">L<option>
  <option value="M">M</option>
 </select>

<div>
 <label>수량</label>
 <select name="g_amount">
  <option value="1">1</option>
  <option value="2">2<option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
 </select>
</div>

<div>
 <label for="g_price">상품가격</label>
 <fmt:formatNumber value="${goods.g_price}" pattern="###,###"> 원</fmt:formatNumber>
 <!-- ${goods.g_price} --> 
</div>

<div>
 <label for="g_content">상품소개</label>
   <!-- ${goods.g_content} -->
</div>

<div>
 <button class="basket">장바구니</button>
 <button class="order">주문</button>
</div>

</form>

</body>
</html>