package com.dlt.senior.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dlt.senior.board.dao.BoardDao;
import com.dlt.senior.board.model.BoardDto;

public class BWriteCommand implements BCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = BoardDao.getInstance();
		HttpSession sess = request.getSession();
		BoardDto dto = new BoardDto();
		
		String userId = (String) sess.getAttribute("user_id");
		String userName = (String) sess.getAttribute("user_name");
		String title = (String) request.getParameter("title");
		String content = (String) request.getParameter("content");
		String formattedContent = content.replace("\n", "<br>");
		
		dto.setUserId(userId);
		dto.setUserName(userName);
		dto.setBoardTitle(title);
		dto.setBoardContent(formattedContent);
		
		dao.boardWrite(dto);
		request.setAttribute("boardId", dto.getBoardId());
	}
	
}
