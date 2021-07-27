
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
