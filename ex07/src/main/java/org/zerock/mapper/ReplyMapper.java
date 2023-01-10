package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long bno);
	
	public int delete(Long rno); //wrapper클래스 Long
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging( // 원글 번호, 페이징 위한 cri 정보
			@Param("cri") Criteria cri, 
			@Param("bno") Long bno
		);
	
	public int getCountByBno(Long bno);
	
	}
