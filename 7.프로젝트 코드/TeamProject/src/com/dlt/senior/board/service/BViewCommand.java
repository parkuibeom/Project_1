package com.dlt.senior.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.board.dao.BoardDao;
import com.dlt.senior.board.model.BoardDto;

public class BViewCommand implements BCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = BoardDao.getInstance();
		// TODO Auto-generated method stub
		BoardDto dto = new BoardDto();
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		dto.setBoardId(boardId);
		
		dao.boardView(dto);
		
		request.setAttribute("board", dto);
		request.setAttribute("list", dao.commentList(boardId));
	}

}
