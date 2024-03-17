package com.project.dlt.community.model;

import java.util.Date;

public class CommentVO {
	
	private int commentId;
	private int communityId;
	private String userId;
	private String userName;
	private Date creationDate;
	private String comment;
	private int group;
	private int step;
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getCommunityId() {
		return communityId;
	}
	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	

	@Override
	public String toString() {
		return "CommentVO [commentId=" + commentId + ", communityId=" + communityId + ", userId=" + userId
				+ ", userName=" + userName + ", creationDate=" + creationDate + ", comment=" + comment + ", group="
				+ group + ", step=" + step + "]";
	}
	
	
	
}
