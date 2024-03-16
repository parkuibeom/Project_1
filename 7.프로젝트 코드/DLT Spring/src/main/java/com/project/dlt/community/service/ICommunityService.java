package com.project.dlt.community.service;

import java.util.List;

import org.springframework.ui.Model;

import com.project.dlt.community.model.CommunityVO;

public interface ICommunityService {
	void communityList (Model model,int page);
	void communityView (Model model,String communityId);
}
