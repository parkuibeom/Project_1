package com.project.dlt.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dlt.member.model.MemberVO;
import com.project.dlt.member.service.IMemberService;

@Controller
public class MemberController {
	@Autowired
	IMemberService memberService;

	@GetMapping(value = "/member/login")
	public String loginPage() {
		return "/member/login";
	}

	@PostMapping(value = "/member/login")
	public String login(HttpServletRequest request, HttpSession session) {
		return memberService.login(request, session);
	}

	@GetMapping(value = "/member/logout")
	public String logout(HttpSession session) {
		return memberService.logout(session);
	}

	@GetMapping(value = "/member/beforeLogin")
	public String beforeLogin(HttpServletRequest request, HttpSession session) {
		return memberService.beforeLogin(request, session);
	}
	
	
	@GetMapping(value = "/member/registration")
	public String registration() {
		return "/member/registration";
	}
	
	@PostMapping(value = "/member/registerMember")
	public String registerMember(MemberVO memberVO) {	
		return memberService.registerMember(memberVO);
	}
	
	@GetMapping("/member/session")
    public@ResponseBody Map<String, Object> getSessionInfo(HttpSession session) {
        Map<String, Object> response = new HashMap<String, Object>();
        response.put("user_id", session.getAttribute("user_id"));
        response.put("user_name", session.getAttribute("user_name"));
        return response;
    }
}
