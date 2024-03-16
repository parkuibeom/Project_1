package com.dlt.senior.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.board.dao.BoardDao;
import com.dlt.senior.board.model.BoardDto;

public class BEditCommand implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = BoardDao.getInstance();
		
		String boardTitle = request.getParameter("title");
		String boardContent = request.getParameter("content");
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String formattedContent = boardContent.replace("\n", "<br>");

		BoardDto dto = new BoardDto(); 
		dto.setBoardTitle(boardTitle);
		dto.setBoardId(boardId);
		dto.setBoardContent(formattedContent);
		
		dao.boardEdit(dto);
	}

}
