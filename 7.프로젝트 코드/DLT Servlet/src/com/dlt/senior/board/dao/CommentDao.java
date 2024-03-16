package com.dlt.senior.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.dlt.senior.board.model.CommentDto;

public class CommentDao {
	private DataSource dataFactory;
	public static CommentDao instance;
	
	public CommentDao() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//singleton
	public static CommentDao getInstance() {
		if(instance == null) {
			instance = new CommentDao();
		}
		return instance;
	}
	
	
	
	//write comment
		public void commentWrite(CommentDto dto) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = dataFactory.getConnection();
				String query = "INSERT INTO comments (c_id, b_id, ab_id, c_name, comment_text, group_number) VALUES (COMMENT_SEQ.NEXTVAL, ?, ?, ?, ?, GROUP_SEQ.NEXTVAL)";
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, dto.getbId());
				pstmt.setString(2, dto.getUserId());
				pstmt.setString(3, dto.getcName());
				pstmt.setString(4, dto.getComment());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (con != null)
						con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
		public void commentWrite(CommentDto dto, int group, int cStep) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = dataFactory.getConnection();
				String query = "INSERT INTO comments (c_id, b_id, ab_id, c_name, comment_text, group_number, c_step) VALUES (COMMENT_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, dto.getbId());
				pstmt.setString(2, dto.getUserId());
				pstmt.setString(3, dto.getcName());
				pstmt.setString(4, dto.getComment());
				pstmt.setInt(5, group);
				pstmt.setInt(6, cStep);
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (con != null)
						con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
		//comment view
		public ArrayList<CommentDto> commentList(int boardId) {
			ArrayList<CommentDto> list = new ArrayList<CommentDto>();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = dataFactory.getConnection();
				String query = "SELECT * FROM comments WHERE b_id = ? ORDER BY group_number ASC, c_id ASC";
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, boardId);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Date date = rs.getDate("c_date");
					CommentDto dto = new CommentDto();
					
					dto.setcId(rs.getInt("c_id"));
					dto.setbId(rs.getInt("b_id"));
					dto.setUserId(rs.getString("ab_id"));
					dto.setcName(rs.getString("c_name"));
					dto.setComment(rs.getString("comment_text"));
					dto.setcDate(date);
					
					int groupNumber = rs.getInt("group_number");
					
					dto.setGroup(groupNumber);
					dto.setcStep(rs.getInt("c_step"));
					list.add(dto);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null) {
						pstmt.close();
					}
					if (con != null) {
						con.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return list;
		}
		
		public void commentDelete(CommentDto dto) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = dataFactory.getConnection();
				String query;
				
				if(dto.getcStep() == 0) {
					query = "DELETE FROM comments WHERE group_number = ?";
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, dto.getGroup());
				}else {
					query = "DELETE FROM comments WHERE c_id = ?";
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, dto.getcId());
				}
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (con != null)
						con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
}
