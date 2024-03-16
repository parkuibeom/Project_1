package com.dlt.senior.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.board.dao.BoardDao;
import com.dlt.senior.board.model.CommentDto;

public class BCWriteCommand implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = BoardDao.getInstance();
		CommentDto dto = new CommentDto();
		
		int bId = Integer.parseInt(request.getParameter("b_id"));
		String cName = (String) request.getAttribute("user_name");
		String userId = (String) request.getAttribute("user_id");

		String comment = request.getParameter("commentText");
		String group = request.getParameter("group");
		String formattedComment = comment.replace("\n", "<br>");
		
		
		dto.setbId(bId);
		dto.setcName(cName);
		dto.setUserId(userId);
		dto.setComment(formattedComment);
		
		System.out.println(group);
		
		if(group == null) {
			dao.commentWrite(dto);
		}
		else {
			int group1 = Integer.parseInt(group);
			dao.commentWrite(dto, group1, 1);
		}
	}

}
