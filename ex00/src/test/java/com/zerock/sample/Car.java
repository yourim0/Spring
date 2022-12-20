package com.zerock.sample;

//spring container에 만들고 싶을 때 
//1. 어노테이션 방식
//@Component
//@Data

//2.root-context에 bean 정의


public class Car {
	String model;

	//단일생성자
	public Car(String model) {
		super();
		this.model = model;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
}


//원래
//Car c = new Car("kia")
//c.setModel("BMW")