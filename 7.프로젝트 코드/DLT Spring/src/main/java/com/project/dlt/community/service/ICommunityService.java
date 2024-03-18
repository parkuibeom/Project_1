package com.project.dlt.community.service;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.project.dlt.community.model.CommentVO;
import com.project.dlt.community.model.CommunityVO;


public interface ICommunityService {
	String communityList (Model model,int page);
	String communityView (Model model,String communityId);
	
	String communityWrite (HttpSession session,CommunityVO communityVO);
	
	String communityEditView (Model model,String communityId);
	String communityEdit (CommunityVO communityVO);
	
	String communityDelete (String communityId);
	
	
	String comment (HttpSession session,Model model,CommentVO commentVO);
	String commentDelete (CommentVO commentVO);
	
}
