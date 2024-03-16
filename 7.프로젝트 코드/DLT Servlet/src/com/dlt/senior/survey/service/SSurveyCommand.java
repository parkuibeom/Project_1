package com.dlt.senior.survey.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SSurveyCommand {

	void execute(HttpServletRequest request, HttpServletResponse response);
}
