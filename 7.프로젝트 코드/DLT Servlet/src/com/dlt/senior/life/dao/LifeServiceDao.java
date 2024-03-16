package com.dlt.senior.life.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.dlt.senior.life.model.LifeServiceDto;

public class LifeServiceDao {
	private DataSource dataFactory;
	public static LifeServiceDao instance;
	
	public LifeServiceDao() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static LifeServiceDao getInstance() {
		if(instance == null) {
			instance = new LifeServiceDao();
		}
		return instance;
	}
	
	public List<LifeServiceDto> lifeList(int regionFirst, int regionSecond, String yearStart, String yearEnd){
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = dataFactory.getConnection();
			String query = "SELECT * FROM region_life_expectancy WHERE lifeyear >= ? AND lifeyear <= ? AND (region_id = ? OR region_id = ?)";
			stmt = con.prepareStatement(query);
			int start = Integer.parseInt(yearStart);
			int end = Integer.parseInt(yearEnd);
			stmt.setInt(1, start);
			stmt.setInt(2, end);
			stmt.setInt(3, regionFirst);
			stmt.setInt(4, regionSecond);
			ResultSet rs = stmt.executeQuery();
			
			List<LifeServiceDto> list = new ArrayList<LifeServiceDto>();
			
			LifeServiceDto lifeDto;

			while(rs.next()) {
				lifeDto = new LifeServiceDto();
				String lifeyear = rs.getString("lifeyear");
				int regionId = rs.getInt("region_id");
				float lifeExpectancy = rs.getFloat("expectancylife");
				lifeDto.setYear(Integer.parseInt(lifeyear));
				lifeDto.setRegionId(regionId);
				lifeDto.setExpectancyLife(lifeExpectancy);
				list.add(lifeDto);
				//현재 여기에서 두번 도는 문제 -> 지역이 2개니까 연도도 2배임
			}
			return list;
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
	
		
		return null;
	}
	
	//독립 변수 값들 가져오기
	public List<Float> personalLife(int ageCheck, int gender) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = dataFactory.getConnection();
			String query = "SELECT * FROM personal_life_expectancy WHERE age_group = ? AND gender = ?";
			stmt = con.prepareStatement(query);
			
			stmt.setInt(1, ageCheck);
			stmt.setInt(2, gender);
			
			rs = stmt.executeQuery();
			
			rs.next();

		
			List<Float> list = new ArrayList<Float>();
			list.add(rs.getFloat("smoke_rate"));
			list.add(rs.getFloat("drinking_rate"));
			list.add(rs.getFloat("hbp_rate"));
			list.add(rs.getFloat("diabetes_rate"));
			
			return list;
			
			
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
		return null;
	}
}
