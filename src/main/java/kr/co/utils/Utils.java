package kr.co.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class Utils {
	
	public static String makeDir(String uploadPath, String largeCategory, String smallCategory, String g_code) {

		File productFile = new File(uploadPath, "product");
		if(!productFile.exists()) {
			productFile.mkdir();
		}
		
		File largeCategoryFile = new File(productFile, largeCategory); 
		if(!largeCategoryFile.exists()) {
			largeCategoryFile.mkdir();
		}
		
		File smallCategoryFile = new File(largeCategoryFile, smallCategory);
		if(!smallCategoryFile.exists()) {
			smallCategoryFile.mkdir();
		}
		
		File g_codeFile = new File(smallCategoryFile, g_code);
		if(!g_codeFile.exists()) {
			g_codeFile.mkdir();
		}
		
		return g_codeFile.getAbsolutePath();
	}

	public static String reName(String oriName) {
		UUID uuid = UUID.randomUUID();
		String newName = uuid + "_" + oriName;
		return newName;
	}
	

	public static String getPathFileName(String Path, String newName) {
		
		int idx = Path.indexOf("img") + "img".length();
		
		String pathFileName = Path.substring(idx)+File.separator+newName;
		pathFileName = pathFileName.replace(File.separatorChar, '/');
		return pathFileName;
	}

	public static String getExtendName(String oriName) {
		int idx = oriName.lastIndexOf(".");
		return oriName.substring(idx + 1);
	}

	public static MediaType getMediaType(String extendName) {
		Map<String, MediaType> map = new HashMap<String, MediaType>();
		map.put("JPG", MediaType.IMAGE_JPEG);
		map.put("JPEG", MediaType.IMAGE_JPEG);
		map.put("PNG", MediaType.IMAGE_PNG);
		map.put("GIF", MediaType.IMAGE_GIF);
		return map.get(extendName.toUpperCase());
	}

	public static String makeThumbnail(String path, String newName) throws Exception {
		String thumbnailName = "_s_" + newName;

		BufferedImage srcImg = ImageIO.read(new File(path, newName));
		BufferedImage desImg = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT, 200);
		File thumnailFile = new File(path, thumbnailName);

		ImageIO.write(desImg, "png", thumnailFile);
		return getPathFileName(path, thumbnailName);
	}
	

	public static String uploadFile(String oriName, String uploadPath,MultipartFile file,
			String largeCategory, String smallCategory, String g_code) throws Exception {

		String path = Utils.makeDir(uploadPath,largeCategory,smallCategory, g_code);
		String newName = Utils.reName(oriName);
		File target = new File(path, newName);
		FileCopyUtils.copy(file.getBytes(), target);

		return Utils.getPathFileName(path, newName);

	}

	public static String getSystemFileName(String filename) {
		String prefix = filename.substring(0, filename.indexOf("_s_"));
		String suffix = filename.substring(filename.indexOf("_s_") + 2);
		return prefix + suffix;
	}

	public static String uploadThumbnail(String oriName,String uploadPath, MultipartFile file, String g_code) throws Exception{
		File productFile = new File(uploadPath, "product");
		File goodsThumbnailFile = new File(productFile, "thumbnail");
		if(!goodsThumbnailFile.exists()) {
			goodsThumbnailFile.mkdir();
		}
		String path = goodsThumbnailFile.getAbsolutePath();
		String newName = g_code +".png";
		File target = new File(path, newName);
		FileCopyUtils.copy(file.getBytes(), target);
		
		return Utils.makeThumbnail(path, newName);
	}
	

}
