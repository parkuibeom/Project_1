package com.dlt.senior.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dlt.senior.board.dao.BoardDao;
import com.dlt.senior.board.model.BoardDto;

public class BEditViewCommand implements BCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = BoardDao.getInstance();
		BoardDto dto = new BoardDto();
		HttpSession sess = request.getSession();
		//글의 사용자 아이디
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String userId = (String) sess.getAttribute("user_id");
		dto.setBoardId(boardId);
		dto.setUserId(userId);
		
		dao.boardEditView(dto);
		
		request.setAttribute("boardTitle", dto.getBoardTitle());
		request.setAttribute("boardDto", dto);
	}
	
}
