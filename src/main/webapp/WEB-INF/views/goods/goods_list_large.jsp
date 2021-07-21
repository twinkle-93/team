<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>

<c:forEach items="${map.to.list}" var="goods">
${goods.g_category_large}
${goods.g_num}
${goods.g_name}
</c:forEach>
<c:if test="${!empty map.keyword}">
				${map.count}개의 게시물이 있습니다.
			</c:if>
			
			<c:if test="${empty map.keyword}">
				<jsp:include page="page.jsp"></jsp:include>
			</c:if>
			
			<c:if test="${!empty map.keyword}">
				<jsp:include page="page2.jsp"></jsp:include>
			</c:if>
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>