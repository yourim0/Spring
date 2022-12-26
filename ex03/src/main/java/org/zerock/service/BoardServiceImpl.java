package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	//@Setter(onMethod_=@Autowired) //생성자에 의한 주입 (단일생성자는 자동 의존주입이 된다)
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) { //boardmapper.java의 insertselectkey
		
		log.info("register..." + board);
		mapper.insertSelectKey(board);//boardermapper.xml 의 쿼리문이 실행
		
	}

//	@Override
//	public List<BoardVO> getList() {
//		
//		log.info("getLIst..");
//		return mapper.getList();
//	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("get List with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	} 
	

	@Override
	public BoardVO get(Long bno) {
		log.info("get....." + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify...." + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove...." + bno);
		return mapper.delete(bno) == 1;
	}




}
