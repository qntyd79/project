package com.company.bbs.utill;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	// 파일업로드 처리
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		// 파일명 중복처리
		UUID uid = UUID.randomUUID();			
		String savedName = uid.toString() + "_" + originalName;
		
		// 파일업로드 경로설정
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath + savedPath, savedName);
		
		// 서버에 파일 저장
		FileCopyUtils.copy(fileData, target);	
		
		// 확장자 추출
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);	
		
		// 최종적으로 리턴할 uploadedFileName 선언
		String uploadedFileName = null;
		
		// 이미지 파일인 경우 썸네일 생성 (MediaUtils클래스 사용)
		if(MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}

		return uploadedFileName;
	}
	
	// 파일삭제 처리 
	public static void removeFile(String uploadPath, String originalName) throws Exception { 
		// 확장자 추출 
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1); 
		System.out.println(formatName);

		// 이미지 파일일 경우 썸네일도 같이 삭제 
		if (MediaUtils.getMediaType(formatName) != null) { 
			// 원본 이미지의 경로 + 파일명 추출 
			// 날짜 경로 추출 
			String front = originalName.substring(0, 12); 
			// UUID + 파일명 추출 
			String end = originalName.substring(12); 
			System.out.println("end : " + end);
			// 썸네일삭제
			new File(uploadPath + (front + "thumb_" + end).replace('/', File.separatorChar)).delete();
		} 	
		//원본이미지 삭제		
		new File(uploadPath + originalName.replace('/', File.separatorChar)).delete();
	}

	
	// 날짜 폴더명 추출
	private static String calcPath(String uploadPath) {
		// Calandar 싱글톤 객체 생성
		Calendar cal = Calendar.getInstance();
		
		// "/년/월/일" 경로 패턴 설정
		String yearPath = File.separator + cal.get(Calendar.YEAR);		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		// 실제 해당 경로가 존재하는지 판단 후 생성
		makeDir(uploadPath, yearPath, monthPath, datePath);		
		logger.info(datePath);
		
		return datePath;
	}
	
	// 날짜별 폴더 생성
	private static void makeDir(String uploadPath, String... paths) {
		
		// uploadPath + yearPath + monthPath + dataPath. 해당 경로가 존재한다면 메서드 종료
		if(new File(uploadPath + paths[paths.length -1]).exists()) {
			return;
		}
		
		// yearPath -> monthPath -> dataPath 순으로
		for(String path : paths) {			
			File dirPath = new File(uploadPath + path);
			
			if(!dirPath.exists()) {
				dirPath.mkdir();
			}			
		}
	}	
	
	// 썸네일 생성
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		
		// 원본이미지를 메모리상에 로딩
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		// 원본이미지 축소 
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);	
		
		// 썸네일 파일명
		String thumbnailName = uploadPath + path + File.separator + "thumb_" + fileName;
		
		// 썸네일 파일 객체 생성
		File newFile = new File(thumbnailName);
		
		// 썸네일 파일확장자 추출
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		// 썸네일 파일 저장
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	// 아이콘 생성
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	// Mime Type 탐지
	public String detectFileMimeType(String uploadPath, String fileName) {
		
		String filepath = uploadPath + fileName;
		Path path = Paths.get(filepath);
		String detectedMimeType = null;
		
		try {
			detectedMimeType = Files.probeContentType(path);
		} catch (IOException e) {
			// ignore
		}
		
		return detectedMimeType != null ? detectedMimeType : URLConnection.guessContentTypeFromName(filepath);
	}
}
