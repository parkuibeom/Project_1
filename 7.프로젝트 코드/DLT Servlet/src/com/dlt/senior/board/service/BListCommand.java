package com.dlt.senior.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.board.dao.BoardDao;
import com.dlt.senior.board.model.BoardDto;

public class BListCommand implements BCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = BoardDao.getInstance();
		int currentPage = 1;
		
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		else {
			currentPage = (int) request.getAttribute("page");
		}
		List<BoardDto> dtos = dao.boardList(currentPage);
		
		
		int recordsPerPage = 10;
		int totalPages = (int) Math.ceil((double) dao.totalRows() / recordsPerPage);
		int pageRange = 5;
		int startPage = Math.max(1, currentPage - pageRange / 2);
		int endPage = Math.min(totalPages, startPage + pageRange - 1);

		
		
		request.setAttribute("boardList", dtos);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("pageRange", pageRange);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
	}
}
