	package com.dlt.senior.board.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.dlt.senior.board.model.BoardDto;
import com.dlt.senior.board.model.CommentDto;

public class BoardDao {
	private DataSource dataFactory;
	public static BoardDao instance;
	
	public BoardDao() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//singleton
	public static BoardDao getInstance() {
		if(instance == null) {
			instance = new BoardDao();
		}
		return instance;
	}
	
	//board list

	public ArrayList<BoardDto> boardList(int currentPage) {
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int pageSize = 10;
		try {
			con = dataFactory.getConnection();
			String query = "SELECT b_id, b_title, b_content, b_date, b_views, b_name FROM (SELECT b_id, b_title, b_content, b_Date, b_views, ROW_NUMBER() OVER (ORDER BY b_date DESC) AS rnum, b_name FROM board) WHERE rnum BETWEEN ? AND ?";
			stmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			stmt.setInt(1, startRow);
			stmt.setInt(2, endRow);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Date date = rs.getDate("b_date");
				
				BoardDto dto = new BoardDto();
				dto.setBoardId(rs.getInt("b_id"));
				dto.setUserName(rs.getString("b_name"));
				dto.setBoardTitle(rs.getString("b_title"));
				dto.setBoardContent(rs.getString("b_content"));
				dto.setBoardDate(date);
				dto.setBoardViews(rs.getInt("b_views"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
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
	
	//board write
	public void boardWrite(BoardDto dto) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			
			con = dataFactory.getConnection();
		
			String query = "INSERT INTO board (b_id, ab_id, b_name, b_title, b_content, b_date) VALUES (board_id.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			String userId = dto.getUserId();
			String userName = dto.getUserName();
			String title = dto.getBoardTitle();
			String content = dto.getBoardContent();
			
			stmt = con.prepareStatement(query);
			
			stmt.setString(1, userId);
			stmt.setString(2, userName);
			stmt.setString(3, title);
			stmt.setString(4, content);
			stmt.executeUpdate();
			
			stmt.close();
			
			//boardId
			String boardIdQuery = "SELECT b_id FROM board WHERE ab_id = ? AND b_title = ? AND b_content = ?";
			
			stmt = con.prepareStatement(boardIdQuery);
			stmt.setString(1, userId);
			stmt.setString(2, title);
			stmt.setString(3, content);
			
			ResultSet rs = stmt.executeQuery();
			
			rs.next();
			
			int boardId = rs.getInt("b_id");
			dto.setBoardId(boardId);
			
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) {
					stmt.close();
				}if(con != null) {
					con.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//board detail
	public void boardView(BoardDto dto) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = dataFactory.getConnection();
			String query = "SELECT * FROM board WHERE b_id = ?";
			int boardId = dto.getBoardId();
			int views = 0;
			stmt = con.prepareStatement(query);
			stmt.setInt(1, boardId);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				String title = rs.getString("b_title");
				String userId = rs.getString("ab_id");
				String name = rs.getString("b_name");
				String content = rs.getString("b_content");
				views = rs.getInt("b_views");
				Date date = rs.getDate("b_date");
				views++;
				
				dto.setBoardTitle(title);
				dto.setUserId(userId);
				dto.setUserName(name);
				dto.setBoardContent(content);
				dto.setBoardDate(date);
				dto.setBoardViews(views);
			}
			rs.close();
			stmt.close();
			
			//조회수 추가
			String queryViews = "UPDATE board SET b_views = ? WHERE b_id = ?";
			stmt = con.prepareStatement(queryViews);
			stmt.setInt(1, views);
			stmt.setInt(2, boardId);
			stmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) {
					con.close();
				}if(stmt != null) {
					stmt.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//board Edit View
	public void boardEditView(BoardDto dto) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = dataFactory.getConnection();
			String query = "SELECT * FROM board WHERE b_id = ?";
			int b_id = dto.getBoardId();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, b_id);
			ResultSet rs =stmt.executeQuery();
			
			rs.next();
			String userId = dto.getUserId();
			String boardUserId = rs.getString("ab_id");
			
			//글에 저장된 userid와 세션에 로그인된 userid를 비교
			if(boardUserId.equals(userId)) { //같을 때
				String boardTitle = rs.getString("b_title");
				String boardContent = rs.getString("b_content");
				String displayedContent = boardContent.replace("<br>","\n");
				String userName = rs.getString("b_name");
				//헷갈리지말것(보드의 아이디가 저장된 공간)
				int boardId = rs.getInt("b_id");
				Date boardDate = rs.getDate("b_Date");
				
				
				dto.setBoardId(boardId);
				dto.setBoardTitle(boardTitle);
				dto.setBoardContent(displayedContent);
				dto.setUserName(userName);
				dto.setBoardDate(boardDate);
			}
			//다른 경우
			else {
				String boardTitle = "differ";
				dto.setBoardTitle(boardTitle);
			}
			
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) {
					con.close();
				}if(stmt != null) {
					stmt.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//board Edit
	public void boardEdit(BoardDto dto) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = dataFactory.getConnection();
			String query = "UPDATE board SET b_title = ?, b_content = ?,b_date = SYSDATE WHERE b_id = ?";
			stmt = con.prepareStatement(query);
			
			stmt.setString(1, dto.getBoardTitle());
			stmt.setString(2, dto.getBoardContent());
			stmt.setInt(3, dto.getBoardId());
			
			
			stmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) {
					con.close();
				}if(stmt != null) {
					stmt.close();
				}if(rs != null) {
					rs.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//board Delete
	public void boardDelete(BoardDto dto) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = dataFactory.getConnection();
			String query = "DELETE FROM board WHERE b_id = ?";
			stmt = con.prepareStatement(query);
			int boardId = dto.getBoardId();
			
			stmt.setInt(1, boardId);
			stmt.executeQuery();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) {
					con.close();
				}if(stmt != null) {
					stmt.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
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
	
	//pagination
	public int totalRows() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalRows = 0;
		try {
			con = dataFactory.getConnection();

			String countQuery = "SELECT COUNT(*) FROM board";
			pstmt = con.prepareStatement(countQuery);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalRows = rs.getInt(1);
			}

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
		return totalRows;
	}

	
}
