package com.dlt.senior.policy.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SPCommand {
	public void execute(HttpServletRequest request,HttpServletResponse response);
}
