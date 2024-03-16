package com.dlt.senior.disease.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SDCommand {
	public void execute(HttpServletRequest request,HttpServletResponse response);
}
