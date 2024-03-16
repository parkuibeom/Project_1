package com.dlt.senior.board.service;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.board.dao.CommentDao;
import com.dlt.senior.board.model.CommentDto;

public class BCDeleteCommand implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		CommentDao dao = CommentDao.getInstance();
		CommentDto dto = new CommentDto();
		int cId = Integer.parseInt(request.getParameter("cId"));
		int cStep = Integer.parseInt(request.getParameter("cStep"));
		int group = Integer.parseInt(request.getParameter("group"));
		
		dto.setcId(cId);
		dto.setcStep(cStep);
		dto.setGroup(group);
		
		dao.commentDelete(dto);
	}

}
