package com.project.dlt.community.model;

import java.util.Date;

public class CommunityVO {
	private int communityId;
	private String userName;
	private String userId;
	private String title;
	private String content;
	private String creationDate;
	private int viewCount;
	private int groupNum;
	private int stepNum;
	public int getCommunityId() {
		return communityId;
	}
	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userNamecc) {
		this.userName = userNamecc;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public int getStepNum() {
		return stepNum;
	}
	public void setStepNum(int stepNum) {
		this.stepNum = stepNum;
	}
	@Override
	public String toString() {
		return "CommunityVO [communityId=" + communityId + ", userName=" + userName + ", userId=" + userId
				+ ", title=" + title + ", content=" + content + ", creationDate=" + creationDate + ", viewCount="
				+ viewCount + ", groupNum=" + groupNum + ", stepNum=" + stepNum + "]";
	}

	
	
}
