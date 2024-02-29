package com.dlt.senior.disease.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.disease.dao.SDiseaseServiceDao;
import com.dlt.senior.disease.model.DistrictDto;

public class SDistrictCommand implements SDCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("area");
		SDiseaseServiceDao dao = SDiseaseServiceDao.getInstance();
		ArrayList<DistrictDto> list =  dao.listDistrict(id); 
		request.setAttribute("list", list);
		request.setAttribute("area", dao.getArea(id));
	}
}
