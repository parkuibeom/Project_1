package com.dlt.senior.userMgmt.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.dlt.senior.useMgmt.model.MemberDto;



public class MemberDao {
	private DataSource dataFactory;
	public static MemberDao instance;
	
	public MemberDao() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}


	
	public static MemberDao getInstance() {
		if(instance == null) {	
			instance = new MemberDao();
		}
		return instance;
	}
	
	public MemberDto checkId(MemberDto dto){
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = dataFactory.getConnection();		
			String query = "SELECT * FROM members WHERE ab_id = ?";				
			stmt = con.prepareStatement(query);
			String userId = dto.getUserId();
			String userPw = dto.getPw();
			stmt.setString(1, userId);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				String pw = rs.getString("ab_pw");
				//login success
				if(userPw.equals(pw))
				{
					String userPhone = rs.getString("ab_phone");
					String userName = rs.getString("ab_name");
					String userEmail = rs.getString("ab_email");
					Date userDate = rs.getDate("ab_rdate");
					
					dto.setPhone(userPhone);
					dto.setName(userName);
					dto.setEmail(userEmail);
					dto.setDate(userDate);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(con != null) {
					con.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public void registerMember(MemberDto dto) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = dataFactory.getConnection();
			//DB 아이디, 비밀번호, 전화번호, 이메일 중복 검사
//			String query = "SELECT * FROM members WHERE ab_id = ? OR ab_pw = ? OR ab_phone = ? OR ab_email = ?";
//			stmt = con.prepareStatement(query);
//			stmt.setString(1, dto.getUserId());
//			stmt.setString(2, dto.getPw());
//			stmt.setString(3, dto.getPhone());
//			stmt.setString(4, dto.getEmail());
//			
//			ResultSet rs = stmt.executeQuery();
////			rs.next(); //DB에 중복 없을 때
//			rs.next();
//			
//			while(rs.next()) {
//				String memberId = rs.getString("ab_id");
//				String memberPhone = rs.getString("ab_phone");
//				String memberEmail = rs.getString("ab_email");
//				
//				//id가 같은 경우
//				if(memberId.equals(dto.getUserId())) {
//					
//				}
//				//휴대폰 번호가 같은 경우
//				else if(memberPhone.equals(dto.getPhone())) {
//					
//				}
//				//이메일이 같은 경우
//				else if(memberEmail.equals(dto.getEmail())) {
//					
//				}
//			}
//			
//						
//			
//			stmt.close();
			String query2 = "INSERT INTO members(ab_id, ab_pw, ab_phone, ab_name, ab_email) VALUES (?, ?, ?, ?, ?)";
			//stmt를 다시 설정하지 않으면 문제가 생김
			stmt = con.prepareStatement(query2);
			stmt.setString(1, dto.getUserId());
			stmt.setString(2, dto.getPw());
			stmt.setString(3, dto.getPhone());
			stmt.setString(4, dto.getName());
			stmt.setString(5, dto.getEmail());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(con != null) {
					con.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
