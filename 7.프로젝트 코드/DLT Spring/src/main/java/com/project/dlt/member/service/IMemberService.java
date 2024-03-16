package com.project.dlt.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.project.dlt.member.model.MemberVO;

public interface IMemberService {
	public String login(HttpServletRequest request, HttpSession session);
	public String logout(HttpSession session);
	public String beforeLogin(HttpServletRequest request, HttpSession session);
	public String registerMember(MemberVO memberVO);
}
