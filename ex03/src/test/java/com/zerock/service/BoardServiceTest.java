package com.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {

	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	
//	@Test
//	public void testExist() {
//		
//		log.info(service);
//	assertNotNull(service);
//}
	
	
	//service클래스를 이용해서 mapper에 접근하는게 차이점
//	@Test
//	public void testRegister() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글 imple");
//		board.setContent("timpel 새로작성하는글");
//		board.setWriter("newbie");
//		
//		service.register(board);
//		log.info("추가된게시물 : " + board.getBno());
//	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get(9L));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT : " + service.remove(2L));
//	}
	
	@Test
	public void testUpdate() {
		BoardVO board = service.get(4L);
		
		if(board == null) {
			return;
		}
		
		board.setTitle("제목 수정합니다.");
		log.info("MODIFY RESULT : " + service.modify(board));
	}
	
	
}
