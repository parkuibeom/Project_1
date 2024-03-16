package com.dlt.senior.board.model;

import java.util.Date;

public class BoardDto {
	private int boardId;
	private String userName;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int boardViews;
	private int maxList;
	
	
	public int getMaxList() {
		return maxList;
	}
	public void setMaxList(int maxList) {
		this.maxList = maxList;
	}
	
	public int getBoardViews() {
		return boardViews;
	}
	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getBoardId() {
		return boardId;
	}
	public String getUserId() {
		return userId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	
}
