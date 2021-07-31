

/* 이미지 파일 여부 확인 */
function checkImageType(filename) {
	var extendName = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
	if (extendName == "JPG" || extendName == "JPEG" || extendName == "PNG" || extendName == "GIF")
		return true;
	else
		return false;
}



/* 파일명만 가져오기 */
function getOriginalName(filename) {
	var idx = -1;

	if (checkImageType(filename)) {
		idx = filename.indexOf("_s_") + 3;
	} else {
		idx = filename.indexOf("_") + 1;
	}
	return filename.substring(idx);
}


/* 이미지 클릭 시 이동 */
function getLinkText(filename) {

	var prefix = 0;
	var suffix = 0;

	if (checkImageType(filename)) {
		prefix = filename.substring(0, filename.indexOf("_s_"));
		suffix = filename.substring(filename.indexOf("_s_") + 2);
		filename = prefix + suffix;
	}

	return "/goods/displayFile?filename=" + filename;
}


/* 기존 파일 업로드를 통합한 것(small 태그 없는 것)*/
/* checkImageType(filename), getOriginalName(filename), getLinkText(filename) */
function uploadViewForm(filename, getOriginalName, getLinkText) {

	var src = '';

	if (checkImageType(filename))
		src = "/goods/displayFile?filename=" + filename;
	else
		src = "/resources/img/dsk.jpeg";

	var msg = `
		<div class='col-xs-4'>
			<a target="_blank" href="${getLinkText}">
				<img src="${src}">
			</a>
			<p class="ellipsisTarget">${getOriginalName}</p>
		</div>
	`;
	return msg;
}


/* 두번째로 기존 파일 업로드를 통합한 것(small 태그 있는 것) * /
/* checkImageType(filename), getOriginalName(filename), getLinkText(filename) */
function uploadUpdateForm(filename, getOriginalName, getLinkText) {

	var src = '';

	if (checkImageType(filename))
		src = "/goods/displayFile?filename=" + filename;
	else
		src = "/resources/img/dsk.jpeg";

	var msg = `
		<div class='col-xs-4' id="delDiv">
			<a target="_blank" href="${getLinkText}">
				<img src="${src}">
			</a>
			<p class="ellipsisTarget"><small class="delFile" data-filename="${filename}" style="border:1px solid red;cursor:pointer;">x</small>${getOriginalName}</p>
		</div>
	`;
	return msg;
}



/* input 태그 */
function getFileUploadFilenameInput(index, filename) {
	var msg = `
		<input name="g_filename[${index}]" type="hidden" value="${filename}">
	`;
	return msg;
}



/* 리뷰 관련 */

function list(r_num, r_id, r_code, r_star, r_regDate, r_title, r_content, userId, r_updateDate){
	if(r_updateDate !== null){
		r_regDate = r_updateDate;
	}
	
	var m = '';
	if(r_id==userId){
		m = `
	<a style="display:inline;" class="btn btn-warning btn-xs review_btn_update_form">수정</a>
	<a style="display:inline;" class="btn btn-danger btn-xs review_btn_delete">삭제</a>
	`;
	}
	var star = stars(r_star);
	var msg = `
	<div id="accordions" r_num='${r_num}' r_code='${r_code}' r_id='${r_id}' r_content='${r_content}' r_title="${r_title}">
	    ${star}
	    <div style = float:right;>
	    ${r_id} ${r_regDate} </div>  &nbsp ${m} <br>
	    <div style="margin-top:10px;">
       <a href="#${r_num}" data-parent = "#accordions" data-toggle="collapse" style="font-weight: bold; color : black;" >${r_title}</a>
       </div>
       <div id="${r_num}" class="collapse" >${r_content}</div>
        <br>
	</div>
	<hr>
	`;
	return msg;
}


/* 리뷰 수정 */
function reviewUpdate(r_num, r_title, r_content){
	var star = '<p class="r_star" id="r_update_star" style="display:inline;"><a value="1">★</a> <a value="2">★</a> <a value="3">★</a> <a value="4">★</a> <a value="5">★</a></p>';
	var msg = `
	<div style="margin: 0 0 20px 0; border: 3px solid #f4f1f1; padding: 10px;">
        	 <a style="float:right;" class="btn btn-warning btn-xs review_update_commit">수정완료</a>
        	<input id="r_update_num" type="hidden" value="${r_num}">
        <label for="r_update_star">별점</label> ${star} <br>
        <label for="r_update_title">리뷰제목</label>
        	<input id="r_update_title" value="${r_title}"> <br>
        <label for="r_update_content">리뷰내용</label><br>
        <textarea id="r_update_content"> ${r_content}</textarea>
	</div>	        
	`;
	return msg;
}

/*리뷰 별점 표시*/
function stars(r_star) {
	var msg = '';

	if (r_star < 1) {
		msg = '<a>★★★★★</a>';
	} else if (r_star < 2) {
		msg = '<a class="on">★</a><a>★★★★</a>';
	} else if (r_star < 3) {
		msg = '<a class="on">★★</a><a>★★★</a>';
	} else if (r_star < 4) {
		msg = '<a class="on">★★★</a><a>★★</a>';
	} else if (r_star < 5) {
		msg = '<a class="on">★★★★</a><a>★</a>';
	} else if (r_star < 6) {
		msg = '<a class="on">★★★★★</a>';
	}

	var star = `
	    <div style="display:inline" class="r_star readStar">
	        ${msg}      
	    </div>`;

	return star;
}

/*리뷰 페이징*/
function pageJSP(g_code, curPage, listType){	
	var msg =`<a listType=${listType} class="pageNum" g_code=${g_code}>${curPage}</a>`;
	return msg;
}

/*리뷰 페이징 현재페이지 active class 추가*/ 
function activePage(g_code, curPage, listType){	
	var msg =`<a listType=${listType} class="pageNum active" g_code=${g_code}>${curPage}</a>`;
	return msg;
}

/*답글 목록*/
function replyList(qna_reply_num, qna_reply_id, qna_reply_content, qna_reply_updateDate, m_id, a_id) {
   const data = new Date(qna_reply_updateDate);
   const year = data.getFullYear();
   const month = data.getMonth() + 1;
   const date = data.getDate();
   var dat = `${year}년 ${month}월 ${date}일`;
   
   const hours = data.getHours();
   const minutes = data.getMinutes();
   var dat1 = `${hours}시 ${minutes}분`;
   
   var fix = ``;

	if (m_id == qna_reply_id && a_id == "") {
		fix = `	<a class="btn btn-warning btn-xs reply_btn_update_form">수정</a>
				<a class="btn btn-danger btn-xs reply_btn_delete">삭제</a>
	`;
	}
	if (a_id != "") {
		fix = `	<a class="btn btn-warning btn-xs reply_btn_update_form">수정</a>
				<a class="btn btn-danger btn-xs reply_btn_delete">삭제</a>
	`;
	}
	var msg = `
		<div class = "replylist">
			<div>
				${dat}
		   		${dat1}
				<input id="qna_reply_num" value="${qna_reply_num}" type="hidden">
				<span id="qna_reply_id">
				<label>작성자</label>
				${qna_reply_id}</span>
			</div>
		<div>
		<span id="qna_reply_content">${qna_reply_content}</span><br>
		<input type="hidden" id="qna_reply_updateDate" value="${qna_reply_updateDate}">
		
		<span class="reply_btn">
			${fix}
		</span>
		</div>	
		</div><br>
	<hr/>
	</div>
	`;
	return msg;
}
/*답글 수정폼*/
function replyUpdate(qna_reply_num, qna_reply_id, qna_reply_content) {
	var msg = `
	    <h4 style="display:inline;">답글수정</h4> &nbsp <a class="btn btn-warning btn-xs reply_update_commit">수정완료</a><br>
        	<input id="qna_reply_update_num" type="hidden" value="${qna_reply_num}">
        <label for="qna_reply_update_id">작성자</label>
        	<input id="qna_reply_update_id" value="${qna_reply_id}" readonly> <br>
        <label for="qna_reply_update_content">내용</label>
        	<input id="qna_reply_update_content" value="${qna_reply_content}">
	`;
	return msg;
}


