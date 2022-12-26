package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

//스프링 컨테이너 등록 방식 
//1. @mapper
//2. root.context 의 mybatis-spring scan 정의
public interface BoardMapper { //인터페이스의 추상메서드 이름과 xml의 id 값이 맻이
	
	public List<BoardVO> getList(); //xml에서 사용하는 select 구문의 id 속성값이 boardmapper 인터페이스 메소드의 이름이
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public Integer insertSelectKey(BoardVO board);
	
	//특정글 하나 조회하는 추상메서드
	public BoardVO read(Long bno); //wrapper클래스의 long형 
	
	//삭제
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	
	

}
