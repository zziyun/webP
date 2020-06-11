package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {

	//@Select("select * from tbl_board where bno>0")
	public List<BoardVO> getList(); // 게시물 목록 열기
	
	public void insert(BoardVO board); // 게시글 삽입, boardmapper.xml의 id가 insert인 애가 일을 함
	
	public Integer insertSelectKey(BoardVO board); // 키 반환

	public BoardVO read(Long bno); // 게시글 조회

	public int delete(Long bno); // 게시글 삭제, 삭제된 글 개수 반환

	public int update(BoardVO board); // 게시글 수정
}