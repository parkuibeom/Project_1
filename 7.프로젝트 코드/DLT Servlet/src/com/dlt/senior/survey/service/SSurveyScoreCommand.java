package com.dlt.senior.survey.service;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.survey.dao.SurveyDao;
import com.dlt.senior.survey.model.SurveyDto;

public class SSurveyScoreCommand implements SSurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//dto 저장
		SurveyDao dao = SurveyDao.getInstance();
		SurveyDto dto = new SurveyDto();
		dto.setGender(request.getParameter("com1"));
		dto.setAge(request.getParameter("com2"));
		dto.setAllsati(request.getParameter("com3"));
		dto.setHealth1(request.getParameter("hth1"));
		dto.setHealth2(request.getParameter("hth2"));
		dto.setHealth3(request.getParameter("hth3"));
		dto.setEconomy1(request.getParameter("eco1"));
		dto.setEconomy2(request.getParameter("eco2"));
		dto.setEconomy3(request.getParameter("eco3"));
		dto.setSocial1(request.getParameter("rel1"));
		dto.setSocial2(request.getParameter("rel2"));
		dto.setSocial3(request.getParameter("rel3"));
		
		dao.addSurvey(dto);
		
		request.setAttribute("surveyDto", dto);
		
		
		//점수 계산
		int hth1 = Integer.parseInt(request.getParameter("hth1"));
		int hth2 = Integer.parseInt(request.getParameter("hth2"));
		int hth3 = Integer.parseInt(request.getParameter("hth3"));
		
		int eco1 = Integer.parseInt(request.getParameter("eco1"));
		int eco2 = Integer.parseInt(request.getParameter("eco2"));
		int eco3 = Integer.parseInt(request.getParameter("eco3"));
		
		int rel1 = Integer.parseInt(request.getParameter("rel1"));
		int rel2 = Integer.parseInt(request.getParameter("rel2"));
		int rel3 = Integer.parseInt(request.getParameter("rel3"));
		
		int totHth = ((hth1*20) + (hth2*20) + (hth3*20))/3;
		int totEco = ((eco1*20) + (eco2*20) + (eco3*20))/3;
		int totRel = ((rel1*20) + (rel2*20) + (rel3*20))/3;
		
		int totScore = (totHth + totEco + totRel)/3;
		
		request.setAttribute("totHth", totHth);
		request.setAttribute("totEco", totEco);
		request.setAttribute("totRel", totRel);
		request.setAttribute("totScore", totScore);
		
		
		
	}
}