package com.zerock.sample;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Component
@ToString
@Getter
@RequiredArgsConstructor
public class SampleHotel {

	@NonNull
	private Chef chef;
	
	private String name; //묵시적 자동의존주의 setter method가 들어와있따고??
	
}
//@NonNull : null을 허용하지 않을 경우
//@Nullable : null을 허용할 경우 