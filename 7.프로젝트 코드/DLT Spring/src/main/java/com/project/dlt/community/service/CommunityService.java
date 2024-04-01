package com.project.dlt.community.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dlt.community.dao.ICommunityRepository;
import com.project.dlt.community.model.CommentVO;
import com.project.dlt.community.model.CommunityVO;

@Service
public class CommunityService implements ICommunityService {

	@Autowired
	ICommunityRepository communityRepository;

	@Override
	public String communityList(Model model, int page) {
		int listSize = communityRepository.getListSize();
		int showListNum = 10;
		int showPBtnNum = 5;
		int pageBtnNum = 0;
		if (listSize != 0) {
			pageBtnNum = (int) Math.ceil(listSize / showListNum);
			if (listSize % showListNum != 0) {
				pageBtnNum += 1;
			}
		}
		int startPage = Math.max(1, page - showPBtnNum / 2);
		int endPage = Math.min(pageBtnNum, startPage + showPBtnNum - 1);
		int startRow = (page - 1) * showListNum + 1;
		int endRow = startRow + showListNum - 1;

		List<CommunityVO> communityList = communityRepository.communityList(startRow, endRow);
		model.addAttribute("communityList", communityList);
		model.addAttribute("pageBtnNum", pageBtnNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "/community/communityList";
	}

	@Override
	public String communityView(Model model, String communityId) {
		CommunityVO communityVO = communityRepository.communityView(communityId);
		communityVO.setContent(communityVO.getContent().replace("<br>", "\n"));
		List<CommentVO> list = communityRepository.commentList(communityId);
		model.addAttribute("communityVO", communityVO);
		model.addAttribute("list", list);
		return "/community/communityView";
	}

	@Override
	public String communityWrite(HttpSession session, CommunityVO communityVO) {
		String userId = (String) session.getAttribute("user_id");
		// 로그인 세션이 없을 때 예외 처리
		if (userId == null) {
			return "/member/login";
		}
		String userName = (String) session.getAttribute("user_name");
		communityVO.setContent(communityVO.getContent().replace("\n", "<br>"));
		communityVO.setUserId(userId);
		communityVO.setUserName(userName);

		communityRepository.communityWrite(communityVO);
		return "redirect:/community/view?communityId=" + communityRepository.communityWriteView(communityVO);
	}

	@Override
	public String communityEditView(Model model, String communityId) {
		CommunityVO communityVO = communityRepository.communityView(communityId);
		communityVO.setContent(communityVO.getContent().replace("<br>", "\n"));
		model.addAttribute("communityVO", communityVO);
		return "/community/communityEdit";
	}

	@Override
	public String communityEdit(CommunityVO communityVO) {
		communityRepository.communityEdit(communityVO);
		communityVO.setContent(communityVO.getContent().replace("\n", "<br>"));
		return "redirect:/community/view?communityId=" + communityVO.getCommunityId();
	}

	@Override
	public String communityDelete(String communityId) {
		communityRepository.communityDelete(communityId);;
		return "redirect:/community/list?page=1";
	}

	@Override
	public String comment(HttpSession session, Model model, CommentVO commentVO) {
		String userId = (String) session.getAttribute("user_id");
		// 로그인 세션이 없을 때 예외 처리
		if (userId == null) {
			return "/member/login";
		}
		String userName = (String) session.getAttribute("user_name");
		commentVO.setComment(commentVO.getComment().replace("\n", "<br>"));
		commentVO.setUserId(userId);
		commentVO.setUserName(userName);
		System.out.println(commentVO);
		if (commentVO.getGroup() == 0) {
			communityRepository.comment(commentVO);
		} else {
			communityRepository.commentGroup(commentVO);
		}
		return "redirect:/community/view?communityId=" + commentVO.getCommunityId();
	}

	@Override
	public String commentDelete(CommentVO commentVO) {
		if (commentVO.getStep() == 0) {
			communityRepository.commentDelete(commentVO);
		} else {
			communityRepository.commentDeleteStep(commentVO);
		}
		return "redirect:/community/view?communityId=" + commentVO.getCommunityId();
	}

}
