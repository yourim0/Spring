package com.zerock.persistence;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTest {
	//스프링 컨테이너에서 가져올 때 자동주입
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	
	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory sqlSessionFactory;//root-context의 id값
	
	@Test
	public void testMyBatis() {
		try {
			SqlSession session = sqlSessionFactory.openSession(); 
			Connection con = session.getConnection();
			
			log.info(session);
			log.info(con);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	@Test
	public void testConnection() {
		try {
			Connection con = dataSource.getConnection();
			log.info(con);  
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}


