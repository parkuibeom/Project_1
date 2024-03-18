package com.project.dlt.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.dlt.community.model.CommentVO;
import com.project.dlt.community.model.CommunityVO;

public interface ICommunityRepository {
	List<CommunityVO> communityList(@Param("startRow") int startRow, @Param("endRow") int endRow);

	int getListSize();

	CommunityVO communityView(@Param("communityId") String communityId);
	
	void communityWrite(CommunityVO communityVO);
	String communityWriteView(CommunityVO communityVO);
	
	void communityEdit(CommunityVO communityVO);
	
	void communityDelete(@Param("communityId") String communityId);

	List<CommentVO> commentList(@Param("communityId") String communityId);
	
	void comment(CommentVO commentVO);
	void commentGroup(CommentVO commentVO);
	
	void commentDelete(CommentVO commentVO);
	void commentDeleteStep(CommentVO commentVO);
}
