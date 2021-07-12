<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<nav aria-label="Page navigation">
		<ul class="pagination">
			<li><a href="/goods/list/${to.curPage-1 > 0 ? to.curPage-1 : 1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>

			<c:forEach begin="${to.beginPageNum}" end="${to.finishedPageNum}" var="curPage">
				<!-- 만약, 원하는 개수를 보고 싶은경우 curPage 뒤에 perPage 값을 넘겨줘야한다  -->
				<li class="${to.curPage == curPage ? 'active' : ''}"><a href="/goods/list/${curPage}">${curPage}</a></li>
			</c:forEach>

			<li><a href="/goods/list/${to.curPage+1<=to.totalPage ? to.curPage+1 : to.curPage}" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
		</ul>
	</nav>

</body>
</html>