package com.dlt.senior.life.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SLCommand {
	public void execute(HttpServletRequest request,HttpServletResponse response);
}
