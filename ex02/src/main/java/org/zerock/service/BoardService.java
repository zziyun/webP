package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {
	public void register(BoardVO board); // 게시글 등록
	public BoardVO get(Long bno); // 게시글 조회
	public boolean modify(BoardVO board); // 게시글 수정
	public boolean remove(Long bno); // 게시글 삭제
	public List<BoardVO> getList(); // 게시글 목록
}
