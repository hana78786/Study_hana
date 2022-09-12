package com.kh.junspring.board.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.junspring.board.domain.Board;

public interface BoardStore {

	public int insertBoard(Board board, SqlSessionTemplate session);

	public List<Board> selectAllboard(SqlSessionTemplate session,  int curretnPage, int limit);
	
	public int selectTotalCount(SqlSessionTemplate session);

}