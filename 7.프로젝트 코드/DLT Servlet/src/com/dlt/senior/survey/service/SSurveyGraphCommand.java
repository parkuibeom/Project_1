package com.dlt.senior.survey.service;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.survey.dao.SurveyDao;
import com.dlt.senior.survey.model.SurveyDto;


public class SSurveyGraphCommand implements SSurveyCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		SurveyDao dao = SurveyDao.getInstance();
		
		// 연령 구분값을 파라미터로 받아 평균값 조회 (빅데이터용)
		SurveyDto avgDto = dao.getAvgSurvey(request.getParameter("age"));
		if(avgDto != null) {
			request.setAttribute("avgHth", avgDto.getHealth1());
			request.setAttribute("avgEco", avgDto.getEconomy1());
			request.setAttribute("avgRel", avgDto.getSocial1());
		}
		
		// 테스트
		request.setAttribute("totScore", request.getParameter("score0"));
		request.setAttribute("totHth", request.getParameter("score1"));
		request.setAttribute("totEco", request.getParameter("score2"));
		request.setAttribute("totRel", request.getParameter("score3"));
	}
}
