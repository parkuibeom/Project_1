package com.dlt.senior.disease.service;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.disease.dao.SDiseaseServiceDao;

public class SDiseaseCommand implements SDCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String district =(String)request.getParameter("district");
	
		SDiseaseServiceDao dao = SDiseaseServiceDao.getInstance();
		
		request.setAttribute("list", dao.getAllDiseaseData(district));
		
	}
}
