package kr.co.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class Utils {

	// 1) 폴더 생성
	public static String makeDir(String uploadPath) {

		// 파일 넣을 디렉토리(절대 경로) 지정
		// 테스트
		// System.out.println("파일 넣을 디렉토리(절대 경로) 지정: " + uploadPath);

		// 절대경로에 속할 변수들 생성
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);

		// 절대경로에 속할 디렉토리 지정
		File f1 = new File(uploadPath, "" + year);
		File f2 = new File(f1, month < 10 ? "0" + month : "" + month);
		File f3 = new File(f2, date < 10 ? "0" + date : "" + date);

		if (!f1.exists())
			f1.mkdir();

		if (!f2.exists())
			f2.mkdir();

		if (!f3.exists())
			f3.mkdir();

		// 절대경로에 속한 마지막 디렉토리의 경로
		// System.out.println("절대경로에 속한 마지막 디렉토리의 경로" + f3.getAbsolutePath());
		return f3.getAbsolutePath();
	}

	// 2) 보안을 위한 파일명 변경
	public static String reName(String oriName) {
		UUID uuid = UUID.randomUUID();

		String reName = uuid.toString() + "_" + oriName;
		return reName;
	}

	// 3) /resources/uploads 를 제외한 실제 디렉토리의 경로 + 파일명
	public static String getPathFileName(String path, String reName) {

		int idx = path.indexOf("uploads") + "uploads".length();

		String pathFileName = path.substring(idx) + File.separator + reName;

		// alert() 창에서 한글이 깨져서 나온 것을 수정하기 위하여
		// File.separatorChar -> / 로 변경한 후, 반환한다
		return pathFileName.replace(File.separatorChar, '/');
	}

	// 4) 확장자명 가져오기
	public static String getExtendName(String fileName) {

		// .gif
		return fileName.substring(fileName.lastIndexOf(".") + 1);
	}

	// 5) 이미지 파일 확인하기
	public static MediaType getMediaType(String extendName) {

		// 여기서, extendName은 확장자명이 들어올 것이다

		Map<String, MediaType> map = new HashMap<String, MediaType>();
		map.put("JPG", MediaType.IMAGE_JPEG);
		map.put("JPEG", MediaType.IMAGE_JPEG);
		map.put("GIF", MediaType.IMAGE_GIF);
		map.put("PNG", MediaType.IMAGE_PNG);

		// extendName으로 mediaType을 key로 받아 value 값을 반환한다
		// (대문자로 통일)
		return map.get(extendName.toUpperCase());
	}

	// 6) 이미지 파일 시에, 섬네일 파일을 새롭게 만들기
	public static String makeThumnail(String path, String reName) throws Exception {

		// 1) UUID.randomUUID()
		// System.out.println("UUID.randomUUID(): " + reName.substring(0,
		// reName.indexOf("_")));

		// 2) _s
		// System.out.println("_s: " + "_s");

		// 3) _나이키 바지.jpg
		// System.out.println("_나이키 바지.jpg: " + reName.substring(reName.indexOf("_")));

		// 1+2+3) 섬네일 파일명
		System.out.println(
				"섬네일 파일명: " + reName.substring(0, reName.indexOf("_")) + "_s" + reName.substring(reName.indexOf("_")));

		// 섬네일 파일이 될 파일의 이름
		String thumNailName = reName.substring(0, reName.indexOf("_")) + "_s" + reName.substring(reName.indexOf("_"));

		// https://offbyone.tistory.com/114

		// 기존 파일의 이미지 크기를 재조정
		// 1) 파일 읽어오기 : ImageIO.read(new File(path, reName))
		// 2) 이미지 가로/세로 비율 유지 : Scalr.Method.AUTOMATIC
		// 3) 이미지 가로/세로 100px로 맞춤 : Scalr.Mode.FIT_EXACT, 100

		BufferedImage imageFile = Scalr.resize(ImageIO.read(new File(path, reName)), Scalr.Method.AUTOMATIC,
				Scalr.Mode.FIT_EXACT, 100);

		// 섬네일 이미지 등록(이미지 크기를 재조정한 파일, 확장자명(대문자로 통일), 섬네일 파일)
		ImageIO.write(imageFile, getExtendName(reName).toUpperCase(), new File(path, thumNailName));

		// 섬네일 파일 경로 보내기
		System.out.println("섬네일 파일 경로 반환: " + getPathFileName(path, thumNailName));
		return getPathFileName(path, thumNailName);
	}

	// 7) 파일 업로드 폼 만들기
	// makeDir()
	// reName()
	// getExtendName()
	// getMediaType()
	// makeTumbnail()
	// getPathFileName()
	public static String uploadFile(MultipartFile fileForm, String uploadPath) throws Exception {

		String oriName = fileForm.getOriginalFilename();
		String reName = reName(oriName);

		// 1) 폴더 생성 후, 파일이 저장될 디렉토리 경로를 반환한다

		// 테스트
		String path = makeDir(uploadPath);
		System.out.println("절대경로에 속한 마지막 디렉토리의 경로: " + path);

		// 2) 파일 등록(넘겨받은 파일의 정보, 파일이 저장될 디렉토리 경로)
		FileCopyUtils.copy(fileForm.getBytes(), new File(path, reName));

		// 3) 파일의 확장자명
		String extendName = getExtendName(reName);

		// 4) 파일의 이미지 여부 파악
		MediaType mType = getMediaType(extendName);

		/// 5) 이미지 여부로 인해서 filePath를 다르게 준다
		if (mType != null)
			// makeThumnail() 안에는 파일등록 또한 포함되어 있다
			return makeThumnail(path, reName);
		else
			return getPathFileName(path, reName);
	}

	// 8) 삭제할 이미지 파일의 이름을 가져온다
	public static String getSystemFileName(String filename) {
		String prefix = filename.substring(0, filename.indexOf("_s_"));
		String suffix = filename.substring(filename.indexOf("_s_") + 2);
		System.out.println("삭제할 파일명" + (prefix + suffix));
		return prefix + suffix;
	}
}
