<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- 검색기능 -->
	<div>
	  <div class="col-lg-6">
	    <div class="input-group">
	      <div class="input-group-btn">
	        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">전체<span class="caret"></span></button>
	        <ul class="dropdown-menu">
	          <li><a href="#">아이디</a></li>
	          <li><a href="#">이름</a></li>
	          <li><a href="#">전화번호</a></li>
	        </ul>
	      </div><!-- /btn-group -->
	      <input style="width: 200px;" type="text" class="form-control" aria-label="...">
	      <a href="#" style="background-color: #eafaea;" class="btn">찾기</a>
	    </div><!-- /input-group -->
	  </div><!-- /.col-lg-6 -->
	  </div>
	  
	  <ul class="orderList">
	  
	  
 <c:forEach items="${#}" var="o_list">
 	<li>
 		<div>
	 		 <p><span>주문자 아이디</span>${#.m_name}</p>
	 		 <p><span>주문자 전화번호</span>${#.m_phone}</p>
	 		 <p><span>수령인</span>${#.m_name}</p>
	 		 <p><span>주소</span>(${#.m_zipCode}) ${#.m_adress} ${#.m_detailAdress}</p>
	 		 <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${#.o_totalPrice}" /> 원</p> 
 		</div>
	 </li>
 </c:forEach>
</ul>

</body>
</html>