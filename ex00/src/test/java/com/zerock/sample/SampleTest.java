package com.zerock.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jdk.internal.org.jline.utils.Log;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) //unit test 로 사용할거고 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //요기서 필요한 정보 가져올거고
@Log4j//콘솔창에 log4j를 이용해 값을 찍어주는 기능
public class SampleTest {
	@Setter(onMethod_ = @Autowired) //만들어놓은 빈즈로 의존 주입이 자동으로 구현된다
	private Restuarant restaurant;
 
	@Test //JUnit Test 기능을 진행 할거다 
	public void testExist() {
		assertNotNull(restaurant); //실제 있는 객체인지 확인. 정상적으로 나는지 
		log.info(restaurant);
		log.info("-----------------------------------------------------------");
		log.info(restaurant.getChef());
	}
}
//원래는 이렇게 작성했어야 할 것
//public void setRestaurant(Resturant restaurant){
 //this.restaurant = restaurant;
 //}