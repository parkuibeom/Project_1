package com.dlt.senior.userMgmt.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.useMgmt.model.MemberDto;
import com.dlt.senior.userMgmt.dao.MemberDao;

public class URegisterCommand implements UCommand{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = MemberDao.getInstance();
    	MemberDto dto = new MemberDto();
		
		dto.setUserId(request.getParameter("id"));
    	dto.setPw(request.getParameter("pw"));
    	dto.setPhone(request.getParameter("phone"));
    	dto.setName(request.getParameter("name"));
    	dto.setEmail(request.getParameter("email"));
		
		dao.registerMember(dto);
	}

}
