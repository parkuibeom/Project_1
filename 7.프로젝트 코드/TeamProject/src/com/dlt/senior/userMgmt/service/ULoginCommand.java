package com.dlt.senior.userMgmt.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.useMgmt.model.MemberDto;
import com.dlt.senior.userMgmt.dao.MemberDao;

public class ULoginCommand implements UCommand{	
	public void execute(HttpServletRequest request, HttpServletResponse response){
		MemberDao dao = MemberDao.getInstance();
    	MemberDto dto = new MemberDto();
		
		dto.setUserId(request.getParameter("user_id"));
    	dto.setPw(request.getParameter("user_pw"));
    	
    	dao.checkId(dto);
    	
    	request.setAttribute("user_name", dto.getName());
    	request.setAttribute("user_id", dto.getUserId());

    	
	}
}
