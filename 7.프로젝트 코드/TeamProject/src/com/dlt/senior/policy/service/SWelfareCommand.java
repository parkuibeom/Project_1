package com.dlt.senior.policy.service;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.policy.dao.SeniorDao;
import com.dlt.senior.policy.model.SeniorDto;

public class SWelfareCommand implements SPCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SeniorDao dao = SeniorDao.getInstance();
		
		String regionId = request.getParameter("region_id");
		
		
		SeniorDto dto = new SeniorDto();
		dto.setRegionId(regionId);
		
		ArrayList<SeniorDto> welfareDtos = dao.getWelfare(dto);
		request.setAttribute("welfareDtos", welfareDtos);
	}

}
