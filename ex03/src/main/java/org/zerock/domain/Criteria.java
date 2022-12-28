package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { //pageNun과 amount 값이 같이 전달되는 용도 //커맨드객체
	private int pageNum;//현재페이지
	private int amount;//페이지당 출력되는 수 
	
	private String type; //검색유형
	private String keyword; //검색 키워드
	
	public Criteria() { //기본생성자
		this(1,10); //기본값을 1페이지, 10개로 지정
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	//T,W,C로 구성된 검색 조건 구성
	//mybatis의 동적 태그 활용
	public String[] getTypeArr() {
		return type == null ? new String[] {}: type.split(""); //이게뭐야??????????????????????
	}
	
	//get방식에 적합한 url 인코딩 결과로 만들어준다
	public String getListLink() {
		
	UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			.queryParam("pageNum", this.pageNum)
			.queryParam("amount", this.getAmount())
			.queryParam("type",this.getType())
			.queryParam("keyword" , this.getKeyword());
	
	return builder.toUriString();
			
}
	
	
	
	
	
}
