package com.dlt.senior.policy.service;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.policy.dao.SeniorDao;
import com.dlt.senior.policy.model.SeniorDto;

public class SJobCommand implements SPCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SeniorDao dao = SeniorDao.getInstance();
		
		String regionId = request.getParameter("region_id");
		
		SeniorDto dto = new SeniorDto();
		dto.setRegionId(regionId);
		
		
		ArrayList<SeniorDto> publicDtos = dao.getPublic(dto);
		ArrayList<SeniorDto> socialDtos = dao.getSocial(dto);
		ArrayList<SeniorDto> marketDtos = dao.getMarket(dto);
		
		
		request.setAttribute("publicDtos", publicDtos);
		request.setAttribute("socialDtos", socialDtos);
		request.setAttribute("marketDtos", marketDtos);
		
		
		
	}
	
}
