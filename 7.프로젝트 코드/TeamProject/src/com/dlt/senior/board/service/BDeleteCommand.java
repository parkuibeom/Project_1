package com.dlt.senior.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.board.dao.BoardDao;
import com.dlt.senior.board.model.BoardDto;

public class BDeleteCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		BoardDao dao = BoardDao.getInstance();
		
		BoardDto dto = new BoardDto();
		dto.setBoardId(boardId);

		dao.boardDelete(dto);
	}

}
