package com.project.dlt.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.project.dlt.community.model.CommunityVO;


public interface ICommunityRepository {
	List<CommunityVO> CommunityList(@Param("startRow")int startRow, @Param("endRow") int endRow);
	int getListSize();
	
	CommunityVO communityView (@Param("communityId")String communityId);
}
