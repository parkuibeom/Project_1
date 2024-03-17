package com.project.dlt.community.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.dlt.community.model.CommentVO;
import com.project.dlt.community.model.CommunityVO;
import com.project.dlt.community.service.ICommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	ICommunityService communityService;

	@GetMapping(value = "/community/list")
	public String communityList(Model model, int page) {
		communityService.communityList(model,page);
		return "/community/communityList";
	}

	@GetMapping(value = "/community/write")
	public String communityWrite() {
//		communityService
		return "/community/communityWrite";
	}
	
	@PostMapping(value = "/community/write")
	public String communityWrite(String asd) {
		return "/community/communityWrite";
	}
	
	@GetMapping(value = "/community/view")
	public String communityView(Model model, String communityId) {
		communityService.communityView(model,communityId);
		return "/community/communityView";
	}
	@GetMapping(value = "/community/communityEdit")
	public String communityview(Model model, String communityId) {
		return communityService.communityEditView(model,communityId);
	}
	
	@PostMapping(value = "/community/communityEdit")
	public String communityview(CommunityVO communityVO) {
		return communityService.communityEdit(communityVO);
	}
	
	@PostMapping(value = "/community/comment")
	public String comment(HttpSession session,Model model,CommentVO commentVO) {
		return communityService.comment(session,model,commentVO);
	}
	@GetMapping(value = "/community/commentDelete")
	public String commentDelete(CommentVO commentVO) {
		return communityService.commentDelete(commentVO);
	}
	
}
