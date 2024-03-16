package com.dlt.senior.userMgmt.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response);
}
