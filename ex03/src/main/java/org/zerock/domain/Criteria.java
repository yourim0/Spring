package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { //pageNun과 amount 값이 같이 전달되는 용도
	private int pageNum;//현재페이지
	private int amount;//페이지당 출력되는 수 
	
	public Criteria() {
		this(1,10); //기본값을 1페이지, 10개로 지정
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
