<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>	
<link href="/resources/css/list.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="main_top.jsp"></jsp:include>

	<div class="a_list">
		<div>
		<!-- 클릭하면 deleteValue() 함수를 발동하게끔 선택 삭제 버튼을 누른다 -->
			<div class="list_btn">
				<button class="btn" id="deleteBtn">선택삭제</button>
				<a class="btn" href="/goods/insert">상품등록</a>
			</div>
			
			<table class="table" >
				<thead>
					<tr>
						<th style="width: 50px;">체크</th>
						<th style="width: 50px;">번호</th>
						<th style="width: 100px;">코드</th>
						<th style="width: 100px;">대분류</th>
						<th style="width: 100px;">소분류</th>
						<th style="width: 200px;">상품명</th>
						<th style="width: 80px;">사이즈</th>
						<th style="width: 100px;">상품수량</th>
						<th style="width: 150px;">가격</th>
						<th style="width: 150px;">적립 포인트</th>
						<th style="width: 200px;">등록날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${map.to.list}" var="goods">
						<tr>
							<td><input id="selectCheck" name="selectCheck" type="checkbox" value="${goods.g_code}"></td>
							<td>${goods.g_num}</td>
							<td><a style="color: black;" href="/goods/read/${goods.g_code}?curPage=${map.to.curPage}">
							<span class="glyphicon glyphicon-search" aria-hidden="true">${goods.g_code}</span></a></td>
							<td>${goods.g_category_large}</td>
							<td>${goods.g_category_small}</td>
							<td>${goods.g_name}</td>
							<td>${goods.g_size}</td>
							<td><fmt:formatNumber value="${goods.g_amount}" pattern="###,###"></fmt:formatNumber>개</td>
							<td><fmt:formatNumber value="${goods.g_price}" pattern="###,###"></fmt:formatNumber>원</td>
							<td>${goods.g_point}</td>
							<td>
							<fmt:parseDate  value="${goods.g_updateDate}" var="day" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate value="${day}" pattern="yyyy-MM-dd"/> 
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		</div>
	</div>


	<script type="text/javascript">
	
		$(document).ready(function() {
			var chkObj = document.getElementsByName("selectCheck");
			var cnt = chkObj.length;
			
			$("input[name='allCheck']").click(function() {
				var arr = $("input[name='selectCheck']");
				for(var i=0; i<arr.length; i++)
					arr[i].checked = this.checked;
			});
			
			$("input[name='selectCheck']").click(function() {
				if($("input[name='selectCheck']:checked").length == cnt)
					$("input[name='allCheck']")[0].checked = true;
				else
					$("input[name='allCheck']")[0].checked = false;
			});
			
			$("button[id='deleteBtn']").click(function() {
				deleteAjax();
			});
			
		});
		
		function deleteAjax() {
			var list = $("input[name='selectCheck']:checked");
			var arr = new Array();
			// console.log(list.length);
			for(var i=0; i<list.length; i++){
				arr.push(list[i].value);
			}
			console.log(arr);
				
			if(arr.length == 0)
				alert("체크박스를 선택하세요!");
			
			else{
				
				if(!confirm("정말 삭제 하시겠습니까?"))
					return;
				
				$.ajax({
					type : 'post',
					url : '/goods/delete',
					traditional : true,
					data : {
						arr : arr
					},
					dataType : 'text',
					success : function(result) {
						if(result == 1){
							alert("삭제 성공");
							location.reload();
						}
						else
							alert("삭제 실패");
					}
				});
				
				
			}
		}
	</script>


	<div style="text-align: center;"> <jsp:include page="page.jsp"></jsp:include></div><br>

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>