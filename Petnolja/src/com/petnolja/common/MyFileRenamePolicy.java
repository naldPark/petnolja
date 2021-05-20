package com.petnolja.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	// 기존의 파일(원본파일)을 전달 받아서 파일명 수정 작업 후 수정된 파일을 반환해주는 메소드
	@Override
	public File rename(File originFile) {
		
		// 원본파일명 ("aaa.jpg")
		String originName = originFile.getName();
		
		// 수정파일명 : 파일업로드된시간(년월일시분초) + 5자리랜덤값(10000~99999) + 원본파일확장자
		
		// 원본명       -->  수정명
		// aaa.jpg --> 2021051322103023123.jpg
		
		// 1. 파일업로드된시간(년월일시분초 형태)  (String currentTime)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 5자리 랜덤값 (int ranNum)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 3. 원본파일확장자 (String ext)
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext; // "2021051322103023123.jpg"
		
		// 원본파일(originFile)을 수정된 파일명으로 적용시켜서 파일객체로 반환
		return new File(originFile.getParent(), changeName);
		
	}

}
