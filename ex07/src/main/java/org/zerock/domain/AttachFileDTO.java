package org.zerock.domain;

import lombok.Data;

@Data
public class AttachFileDTO { //원본파일의 정보 저장
	 private String fileName;
	 private String uploadPath;
	 private String uuid;
	 private boolean image;

}
