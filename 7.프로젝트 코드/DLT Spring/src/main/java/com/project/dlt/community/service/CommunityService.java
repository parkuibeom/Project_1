package com.project.dlt.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dlt.community.dao.ICommunityRepository;
import com.project.dlt.community.model.CommunityVO;

@Service
public class CommunityService implements ICommunityService {
	
	
	@Autowired
	ICommunityRepository communityRepository;

	@Override
	public void communityList(Model model, int page) {
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
		int startRow = (page - 1) * showListNum + 1; // 페이지의 시작 행 번호
		int endRow = startRow + showListNum - 1; // 페이지의 끝 행 번호
		
		List<CommunityVO> communityList = communityRepository.CommunityList(startRow,endRow);
		model.addAttribute("communityList", communityList);
		model.addAttribute("pageBtnNum", pageBtnNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
	}

	@Override
	public void communityView(Model model, String communityId) {
		CommunityVO communityVO = communityRepository.communityView(communityId);
		model.addAttribute("communityVO", communityVO);
	}
	
	
	
}
