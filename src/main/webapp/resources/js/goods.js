
/**
 * 
 */
 

 function getFileUploadFilenameInput(index, filename){
    var msg = `
 		<input name="g_filename[${index}]" type="hidden" value="${filename}">
 	`; 
 	return msg;
 }

function thumbnailUploadFilename(filename){
	var msg = `
 		<input name="g_thumbnail" type="hidden" value="${filename}">
 	`; 
 	return msg;
}

 
 
  function uploadUpdateForm(imgSrc, getLinkText, filename, getOriginalName){
 	var src = '';
 
 	if(checkImageType(filename)){
		src= imgSrc;
	}else{
		src = "/resources/img/etc.jpg";
	}
 
 	var msg = `
 	<div class='col-Xg-1'>
		<a target="_blank" href="${getLinkText}">
			<img style = "width: 200px; height: 200px;" src="${src}" >
		</a>
		<button type="button" class="delFile btn btn-xs btn-outline-danger" data-filename="${filename}">x</button>
	</div>
 	`;
 	
 	return msg;
 }

function thumbnailView(imgSrc, filename){
	var src = '';
	
	if(checkImageType(filename)){
		src= imgSrc;
	}else{
		src = "/resources/img/etc.jpg";
	}
	
	var msg = `
 	<div class=''>
	    <img style = "width: 200px; height: 200px;" src="${src}" class="img-thumbnail">
	</div>
 	`;
 	
 	return msg;
	
	
	
}
 
 
 
 
 
 function uploadViewForm(filename){
 	var src = '';
  
 	if(checkImageType(filename)){
		src= "/resources/img" + filename;
	}else{
		src = "/resources/img/etc.png";
	}
	
 	var msg = `
 	<div class='col-Xg-1' >
	<a target="_blank" href="${src}">
		<img src="${src}" width="1000">
	</a>
    </div>
 	`;
 	
 	return msg;
 }
 
 
 function getLinkText(filename){
 	
 	if(checkImageType(filename)){
 		var idx = filename.indexOf("_s_");
 		var prefix = filename.substring(0, idx);
 		var suffix = filename.substring(idx+2);
 		filename = prefix + suffix;
 	}

	return "/displayFile?filename="+filename;
 } 
 
function getOriginalName(filename){
	var idx = -1;

	if(checkImageType(filename)){
		idx = filename.indexOf("_s_")+3;
	}else{
		idx = filename.indexOf("_")+1;
	}
	
	return filename.substring(idx);
} 
 
 
function checkImageType(filename){
	var idx = filename.lastIndexOf(".")+1;
	var extendName = filename.substring(idx).toUpperCase();
	if(extendName =="PNG" || extendName == "JPEG" || extendName == "GIG" || extendName == "JPG" || extendName == "GIF"){
		return true;
	}else{
		return false;
	}
	
}	

function list(r_num, r_id, r_code, r_star, r_regDate, r_title, r_content, userId, r_updateDate){
	var update = '';
	if(r_updateDate !== null){
		update = `수정됨 : ${r_updateDate}`;
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
	<div r_num='${r_num}' r_code='${r_code}' r_id='${r_id}' r_content='${r_content}' r_title="${r_title}">
	    ${star} ${r_id} ${r_regDate} ${update}  &nbsp ${m} <br>
        <div style="font-weight: bold;" >${r_title}</div>
        ${r_content}<br>
	</div>
	<hr>
	`;
	return msg;
}

function reviewUpdate(r_num, r_title, r_content){
	var star = '<P class="r_star" id="r_update_star" style="display:inline;"><a value="1">★</a> <a value="2">★</a> <a value="3">★</a> <a value="4">★</a> <a value="5">★</a></p>';
	var msg = `
	    <h4 style="display:inline;">리뷰수정</h4> &nbsp <a  class="btn btn-warning btn-xs review_update_commit">수정완료</a> <br>
        <input id="r_update_num" type="hidden" value="${r_num}">
        <label for="r_update_star">별점</label> ${star} <br>
        <label for="r_update_title">리뷰제목</label>
        <input id="r_update_title" value="${r_title}"> <br>
        <label for="r_update_content">내용</label>
        <input id="r_update_content" value="${r_content}">
	`;
	return msg;
}

function stars(r_star){
	var msg = '';

	if(r_star<1){
	      msg = '<a>★★★★★</a>';      
	}else if(r_star<2){
	       msg = '<a class="on">★</a><a>★★★★</a>';
    }else if(r_star<3){
	       msg = '<a class="on">★★</a><a>★★★</a>';
	}else if(r_star<4){
	       msg = '<a class="on">★★★</a><a>★★</a>';
    }else if(r_star<5){
	       msg = '<a class="on">★★★★</a><a>★</a>';
    }else if(r_star<6){
	       msg = '<a class="on">★★★★★</a>';
    }

    var star = `
	    <div style="display:inline" class="r_star readStar">
	        ${msg}      
	    </div>`;

    return star;
}

function pageJSP(g_code, curPage, listType){	
	var msg =`<a listType=${listType} class="pageNum" g_code=${g_code}>${curPage}</a>`;
	return msg;
}

function activePage(g_code, curPage, listType){	
	var msg =`<a listType=${listType} class="pageNum active" g_code=${g_code}>${curPage}</a>`;
	return msg;
}



 
