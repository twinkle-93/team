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
<link href="/resources/css/qna/read.css" rel="stylesheet" type="text/css">
<link href="/resources/css/main/main.css" rel="stylesheet" type="text/css">
<script src="/resources/js/goods.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="../home/main_top.jsp"></jsp:include>
	<div class="body">
		<div class="title">Q&A</div>
		<hr/>
		<div>
			<input type="hidden" name="qna_num" value="${qna.qna_num}">
			<label>제목</label> ${dto.qna_title}
		</div>
		<div>
			<label>작성자</label> ${dto.qna_id}
			<span class="day">작성일&nbsp;
			<fmt:formatDate  value="${dto.qna_regDate}" pattern="yyyy-MM-dd"/></span>
		</div>
		<hr/><br>
		<div class="qna_content">
		${dto.qna_content}<br>
		</div>
		
		<br>
		
		
	<hr/>
	<div style="text-align: center;">
	<!-- 관리자거나 로그인한 아이디일 경우 버튼이 보인다 -->
			<button class="btn" id="listBtn">목록</button>
			<button style="background: #8cd98c; width: 80px;" class="btn" id="updateBtn">수정</button>
			<button style="background: #ff6666;" class="btn" id="deleteBtn">삭제</button>
	</div>
	<hr>
	<button id="qnareply" class="qnareplyInsert">댓글작성</button>
	<div id="replyInsertForm" class="collapse">
		<input id="qna_about_num" value="${dto.qna_num}" type="hidden">
		
		<span style="float: right;"> 
			<label for="qna_reply_id">작성자</label>
			<c:if test="${login.m_id == null}">
				<input id="qna_reply_id" value="${admin.a_id}" readonly>
			</c:if>
			<c:if test="${admin.a_id == null}">
				<input id="qna_reply_id" value="${login.m_id}" readonly>
			</c:if>
		</span>
		<div class="qna_title_reply_insert">
			<label for="qna_reply_content">내용</label>
			<textarea class="qna_reply_content_insert" id="qna_reply_content"></textarea>
		<span style="float: right;">
			<button
				id="replySubmit">입력</button>
		</span>
		</div>
	</div>
	<hr>
	</div>
	<div  id="replyList"></div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#insertBtn").click(function(event) {
				event.preventDefault();
				location.assign("/qna/insert");
			});
			$("#listBtn").click(function(event) {
				event.preventDefault();
				location.assign("/qna/list");
			});
			$("#updateBtn").click(function(event) {
				event.preventDefault();
				location.assign("/qna/update/${dto.qna_id}/${dto.qna_num}");
			});
			$("#deleteBtn").click(function(event) {
				event.preventDefault();
				location.assign("/qna/delete/${dto.qna_id}/${dto.qna_num}");
			});
			
			$("#qnareply").click(function(){
				$("#replyInsertForm").toggle();
			});
			
			Replylist(${dto.qna_num});
			
			/* 답글 작성 */
			$("#replySubmit").click(function(event){
				event.preventDefault();
				
				$.ajax({
					type : "post",
					url : "/qnareplies/reply",
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},
					data: JSON.stringify({
						qna_about_num : $("#qna_about_num").val(),
						qna_reply_id : $("#qna_reply_id").val(),
						qna_reply_content : $("#qna_reply_content").val()
					}),
					dataType : 'text',
					success : function(result) {
						alert(result);
						$("#replyList").html("");
						$("#qna_reply_content").val("");
						Replylist(${dto.qna_num});
						location.reload();
					}
				});
			});
		/* 답글 수정 */
		$(document).on("click",".reply_update_commit", function(event){
			event.preventDefault();
			var that = $(this);
			var qna_reply_num = that.nextAll("#qna_reply_update_num").val();
			var qna_reply_id = that.nextAll("#qna_reply_update_id").val();
			var qna_reply_content = that.nextAll("#qna_reply_update_content").val();
			
			$.ajax({
				type : "PUT",
				url : "/qnareplies/reply",
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'PUT'
				},
				data: JSON.stringify({
					qna_reply_num : qna_reply_num,
					qna_reply_id : qna_reply_id,
					qna_reply_content : qna_reply_content
				}),
				dataType : 'text',
				success : function(result) {
					Replylist(${dto.qna_num});
					location.reload();
				}
			});
		});
		
			
		/* 답글수정폼 */
		$(document).on("click", ".reply_btn_update_form", function(event){
			event.preventDefault();
			var that = $(this);
			var qna_reply_num = that.parent().attr("qna_reply_num");
			var qna_reply_id = that.parent().attr("qna_reply_id");
			var qna_reply_content = that.parent().attr("qna_reply_content");
			
			var msg = replyUpdate(qna_reply_num, qna_reply_id, qna_reply_content);
			
			that.parent().html(msg);
		});
		
		/* 답글삭제 */
		$(document).on("click",".reply_btn_delete",function(event){
			event.preventDefault();
			if(confirm("답글을 삭제하시겠습니까?")){
				var qna_reply_num = $(this).parent().attr("qna_reply_num");
				$.ajax({
					type : "DELETE",
					url : "/qnareplies/reply",
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'DELETE'
					},
					data: JSON.stringify({
						qna_reply_num : qna_reply_num
					}),
					dataType : 'text',
					success : function(result) {
						alert("삭제되었습니다.");
						Replylist(${dto.qna_num});
						location.reload();
					}
				
				});
			}
		});
		
		});
		/* 리뷰목록 */
		function Replylist(qna_about_num){
			$.getJSON("/qnareplies/reply/"+qna_about_num,function(data){
				for(var i=0; i<data.length; i++){
					var obj = data[i];
					var msg = replyList(obj['qna_reply_num'], obj['qna_reply_id'], obj['qna_reply_content'], obj['qna_reply_updateDate'],'${login.m_id}', '${admin.a_id}');
					$("#replyList").append(msg);
				}
			});
				
		}
		
	</script>
	<div class="blank"></div>
<jsp:include page="../home/footer.jsp"></jsp:include>
</body>
</html>