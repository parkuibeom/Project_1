package com.project.dlt.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dlt.community.service.ICommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	ICommunityService communityService;

	@GetMapping(value = "/community/list")
	public String CommunityList(Model model, int page) {
		communityService.communityList(model,page);
		return "/community/communityList";
	}
	
	@GetMapping(value = "/community/view")
	public String Communityview(Model model, String communityId) {
		communityService.communityView(model,communityId);
		return "/community/communityView";
	}
}
