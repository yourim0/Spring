package com.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	private Long[] bnoArr = { 464L , 465L, 466L, 467L, 468L }; // bno에 들어갈 값
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	//----------------insert------------------
//	@Test
//	public void testCreate() {
//		IntStream.rangeClosed(1,10).forEach(i -> {
//			ReplyVO vo = new ReplyVO();
//			
			//게시물의 번호
//			vo.setBno(bnoArr[i % 5]);
//			vo.setReply("댓글 테스트" + i );
//			vo.setReplyer("replyer" + i);
//			
//			mapper.insert(vo);
//		});
//	}
	
	//--------------select------------------
//	@Test
//	public void testRead() {
//		Long targetRno = 5L;
//		ReplyVO vo = mapper.read(targetRno);
//		log.info(vo);
//	}
	
	
	//---------------delete--------------------
//	@Test
//	public void testDelete() {
//		Long targetRno = 2L;
//		mapper.delete(targetRno);
//	}
	
	//---------------update--------------------
//	@Test
//	public void testUpdate() {
//		Long targetRno = 10L;
//		ReplyVO vo = mapper.read(targetRno);
//		vo.setReply("Update Reply");
//		int count = mapper.update(vo);
//		log.info("UPDATE COUNT:" +count);
//	}
	
	
	//---------------update--------------------
//	@Test
//	public void testMapper() {
//		log.info(mapper);
//	}
	
	//---------------getlistwithpaging(특정)--------------------
//	@Test
//	public void testList() {
//		Criteria cri = new Criteria();
//		
//		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
//		replies.forEach(reply -> log.info(reply));
//	}
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria(2, 10);
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 468L);
		
		replies.forEach(reply -> log.info(reply));
	}
	
}
