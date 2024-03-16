package com.dlt.senior.policy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.dlt.senior.policy.model.SeniorDto;

public class SeniorDao {
	
	private static SeniorDao instance = new SeniorDao();
	
	public static SeniorDao getInstance() {
		return instance;
	}
	
	public ArrayList<SeniorDto> getWelfare(SeniorDto dto){
		ArrayList<SeniorDto> welfareDtos = new ArrayList<SeniorDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT region_id, SEQ, ORGNAME, ADDRSEQ, ADDRESS, TELNO, JACHIGU, ETCINFO FROM WELFARE WHERE region_id = ? ORDER BY DATASEQ, ADDRSEQ";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getRegionId());
			rs = pstmt.executeQuery();
			
			System.out.println("복지관현황");
			while (rs.next()) {
				dto = new SeniorDto();
				dto.setSeq(rs.getInt("SEQ"));
				dto.setOrgName(rs.getString("ORGNAME"));
				dto.setAddrSeq(rs.getString("ADDRSEQ"));
				dto.setAddress(rs.getString("ADDRESS"));
				dto.setTelno(rs.getString("TELNO"));
				dto.setJachigu(rs.getString("JACHIGU"));
				dto.setEtcInfo(rs.getString("ETCINFO"));
				welfareDtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) {
					conn.close();
				}if(rs != null) {
					rs.close();
				}if(pstmt != null) {
					pstmt.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return welfareDtos;
	}
	
	public ArrayList<SeniorDto> getSocial(SeniorDto dto){
		ArrayList<SeniorDto> welfareDtos = new ArrayList<SeniorDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT SEQ, CATEGORY, DTLCATEGORY, BIZCON, SUPPORTCON FROM JOB_SOCIAL";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			System.out.println("서울 사회서비스");
			while (rs.next()) {
				dto = new SeniorDto();
				dto.setSeq(rs.getInt("SEQ"));
				dto.setCategory(rs.getString("CATEGORY"));
				dto.setDtlCategory(rs.getString("DTLCATEGORY"));
				dto.setBizCon(rs.getString("BIZCON"));
				if(rs.getString("SUPPORTCON") != null) {
					dto.setSupportCon(rs.getString("SUPPORTCON").replaceAll("\n", "<br>"));
				}
				
				welfareDtos.add(dto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}if(rs != null) {
					rs.close();
				}if(pstmt != null) {
					pstmt.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		
		}
		return welfareDtos;
	}
	
	public ArrayList<SeniorDto> getMarket(SeniorDto dto){
		ArrayList<SeniorDto> marketDtos = new ArrayList<SeniorDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT SEQ, DTLCATEGORY, JOBCON, SUPPORTCON FROM SEOULJOB_MARKET";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			System.out.println("서울 시장형사업단");
			while (rs.next()) {
				dto  = new SeniorDto();
				dto.setSeq(rs.getInt("SEQ"));
				dto.setDtlCategory(rs.getString("DTLCATEGORY"));
				dto.setJobCon(rs.getString("JOBCON"));
				if(rs.getString("SUPPORTCON") != null) {
					dto.setSupportCon(rs.getString("SUPPORTCON").replaceAll("\n", "<br>"));
				}
				marketDtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}if(rs != null) {
					rs.close();
				}if(pstmt != null) {
					pstmt.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		
		}
		
		return marketDtos;
	}
	
	public ArrayList<SeniorDto> getPublic(SeniorDto dto){
		ArrayList<SeniorDto> welfareDtos = new ArrayList<SeniorDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT CATEGORY, DTLBIZCON, JOBSAM, SUPPORTCON FROM JOB_PUBLIC WHERE region_id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getRegionId());
			rs = pstmt.executeQuery();
			
			
			System.out.println("서울 공익활동");
			while (rs.next()) {
				dto = new SeniorDto();
				dto.setCategory(rs.getString("CATEGORY"));
				dto.setDtlBizCon(rs.getString("DTLBIZCON"));
				dto.setJobSam(rs.getString("JOBSAM"));
				if(rs.getString("SUPPORTCON") != null) {
					dto.setSupportCon(rs.getString("SUPPORTCON").replaceAll("\n", "<br>"));
				}
				
				welfareDtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}if(rs != null) {
					rs.close();
				}if(pstmt != null) {
					pstmt.close();
				}
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		
		}
		
		return welfareDtos;
	}
	
	private Connection getConnection() {
		Context context = null;
		DataSource dataSource = null;
		Connection conn = null;
		
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			conn = dataSource.getConnection();
		}
		catch (Exception e){
			e.printStackTrace();
		}
		
		return conn;
		
	} 

}
