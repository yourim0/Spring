package org.zerock.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoDTO {
	private String title;
	@DateTimeFormat(pattern = "yyyy/MM/dd") //대소문자 표현식 고정
	private Date dueDate;
}
