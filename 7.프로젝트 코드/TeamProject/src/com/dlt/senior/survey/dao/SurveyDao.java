package com.dlt.senior.survey.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.dlt.senior.survey.model.SurveyDto;


public class SurveyDao {
	
	private static SurveyDao instance = new SurveyDao();
	
	public static SurveyDao getInstance() {
		return instance;
	}
	
	private int getMaxSeq() {
		int maxSeq = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// SEQ의 값을 구하기 위함
		// 최초 셀레트 시에는 NULL이므로 1을 리턴함, NVL은 앞에께 NULL이면 뒤에걸 리턴하는 오라클 제공 함수임
		// 최초 이후에는 마지막 MAX(SEQ) 값의 +1로 리턴
		String query = "SELECT NVL(MAX(SEQ)+1, 1) AS MAXSEQ FROM SURVEY";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				maxSeq = rs.getInt("MAXSEQ");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return maxSeq;
		
	}
	
	public void addSurvey(SurveyDto surveyDto) {
		
		try {
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			String query = "INSERT INTO SURVEY ";
			query += " (SEQ, GENDER, AGE, ALLSATI, HEALTH1, HEALTH2, HEALTH3, ECONOMY1, ECONOMY2, ECONOMY3, SOCIAL1, SOCIAL2, SOCIAL3) ";
			query += " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getMaxSeq());
			pstmt.setString(2, surveyDto.getGender());
			pstmt.setString(3, surveyDto.getAge());
			pstmt.setString(4, surveyDto.getAllsati());
			pstmt.setString(5, surveyDto.getHealth1());
			pstmt.setString(6, surveyDto.getHealth2());
			pstmt.setString(7, surveyDto.getHealth3());
			pstmt.setString(8, surveyDto.getEconomy1());
			pstmt.setString(9, surveyDto.getEconomy2());
			pstmt.setString(10, surveyDto.getEconomy3());
			pstmt.setString(11, surveyDto.getSocial1());
			pstmt.setString(12, surveyDto.getSocial2());
			pstmt.setString(13, surveyDto.getSocial3());
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 연령대를 파라미터로 받아서 해당 연령대의 평균값을 리턴
	public SurveyDto getAvgSurvey(String age){
		SurveyDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT ROUND(AVG(((HEALTH1*20)+(HEALTH2*20)+(HEALTH3*20))/3), 0) HEALTH1, ROUND(AVG(((ECONOMY1*20)+(ECONOMY2*20)+(ECONOMY3*20))/3), 0) ECONOMY1, ROUND(AVG(((SOCIAL1*20)+(SOCIAL2*20)+(SOCIAL3*20))/3), 0) SOCIAL1 FROM SURVEY WHERE AGE = ? GROUP BY AGE";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, age);
			rs = pstmt.executeQuery();
			
			System.out.println("서베이평균 : "+age);
			while (rs.next()) {
				dto = new SurveyDto();
				dto.setHealth1(rs.getString("HEALTH1"));
				dto.setEconomy1(rs.getString("ECONOMY1"));
				dto.setSocial1(rs.getString("SOCIAL1"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	// 연령대를 파라미터로 받아서 해당 연령대의 전체 리스트를 출력
	public ArrayList<SurveyDto> getSurvey(String age){
		ArrayList<SurveyDto> surveyDtos = new ArrayList<SurveyDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT ALLSATI, HEALTH1, HEALTH2, HEALTH3, ECONOMY1, ECONOMY2, ECONOMY3, SOCIAL1, SOCIAL2, SOCIAL3 FROM SURVEY WHERE AGE = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, age);
			rs = pstmt.executeQuery();
			
			System.out.println("서베이현황1");
			while (rs.next()) {
				SurveyDto dto = new SurveyDto();
				dto.setAllsati(rs.getString("ALLSATI"));
				dto.setHealth1(rs.getString("HEALTH1"));
				dto.setHealth2(rs.getString("HEALTH2"));
				dto.setHealth3(rs.getString("HEALTH3"));
				dto.setEconomy1(rs.getString("ECONOMY1"));
				dto.setEconomy2(rs.getString("ECONOMY2"));
				dto.setEconomy3(rs.getString("ECONOMY3"));
				dto.setSocial1(rs.getString("SOCIAL1"));
				dto.setSocial2(rs.getString("SOCIAL2"));
				dto.setSocial3(rs.getString("SOCIAL3"));
				surveyDtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return surveyDtos;
	}
	
	public void saveResults(int hth1, int hth2, int hth3, int eco1, int eco2, int eco3, int rel1, int rel2, int rel3, int totHth, int totEco, int totRel, int totScore) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			String query = "INSERT INTO SURVEY_RESULTS";
			query += " (SEQ, hth1, hth2, hth3, eco1, eco2, eco3, rel1, rel2, rel3, totHth, totEco, totRel, totScore) ";
			query += " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?) ";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getMaxSeq());
			pstmt.setInt(2, hth1);
			pstmt.setInt(3, hth2);
			pstmt.setInt(4, hth3);
			pstmt.setInt(5, eco1);
			pstmt.setInt(6, eco2);
			pstmt.setInt(7, eco3);
			pstmt.setInt(8, rel1);
			pstmt.setInt(9, rel2);
			pstmt.setInt(10, rel3);
			pstmt.setInt(11, totHth);
			pstmt.setInt(12, totEco);
			pstmt.setInt(13, totRel);
			pstmt.setInt(14, totScore);
			pstmt.executeUpdate();
			pstmt.close();
		}	catch (Exception e) {
			e.printStackTrace();
		}	//추가
			finally {
				try {
					if(conn != null) {
						conn.close();
					}if(pstmt != null) {
						pstmt.close();
					}
				}catch(Exception e2) {
					e2.printStackTrace();
				}

			}
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
