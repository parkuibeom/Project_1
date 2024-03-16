package com.dlt.senior.disease.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;

import com.dlt.senior.disease.model.DistrictDto;

public class SDiseaseServiceDao {
	private DataSource dataFactory;
	private static SDiseaseServiceDao instance;

	public SDiseaseServiceDao() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static SDiseaseServiceDao getInstance() {
		if (instance == null) {
			instance = new SDiseaseServiceDao();
		}
		return instance;
	}

	public String getArea(String id) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String Region_Name = null;
		try {
			con = dataFactory.getConnection();
			String query = "SELECT * FROM region WHERE region_id = ?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, id);
			rs = stmt.executeQuery();

			if (rs.next()) {
				Region_Name = rs.getString("region_name");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				stmt.close();
				rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return Region_Name;
	}

	public ArrayList<DistrictDto> listDistrict(String id) {
		ArrayList<DistrictDto> list = new ArrayList<DistrictDto>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DistrictDto dto = null;
		try {
			con = dataFactory.getConnection();
			String query = "SELECT region.*, district.* FROM region INNER JOIN district ON region.region_id = district.region_id WHERE region.region_id = ?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, id);
			rs = stmt.executeQuery();

			while (rs.next()) {
				String District_Id = rs.getString("district_id");
				String District_Name = rs.getString("district_name");
				dto = new DistrictDto();
				dto.setDistrict_Id(District_Id);
				dto.setDistrict_Name(District_Name);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				stmt.close();
				rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}

	public JSONArray getAllDiseaseData(String district) {
		JSONArray jsonArray = new JSONArray();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = dataFactory.getConnection();
			String query = "SELECT * FROM disease where district_id = ?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, district);
			rs = stmt.executeQuery();
			while (rs.next()) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("data_id", rs.getInt("data_id"));
				jsonObject.put("district_id", rs.getInt("district_id"));
				jsonObject.put("dementia_data", rs.getDouble("dementia_data"));
				jsonObject.put("diabetes_data", rs.getDouble("diabetes_data"));
				jsonObject.put("hyperlipidemia_data", rs.getDouble("hyperlipidemia_data"));
				jsonObject.put("hypertension_data", rs.getDouble("hypertension_data"));
				jsonObject.put("year", rs.getInt("year"));
				jsonArray.put(jsonObject);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return jsonArray;
	}

	public void saveDataToDatabase(JSONArray HypertensionArray, JSONArray HyperlipidemiaArray,
	        JSONArray DementiaDataArray, JSONArray DiabetesArray) {
	    Connection con = null;
	    PreparedStatement stmt = null;
	    try {
	        con = dataFactory.getConnection();
	        String query = "INSERT INTO disease (DATA_ID, DISTRICT_ID, DISTRICT, HYPERTENSION_DATA, HYPERLIPIDEMIA_DATA, DEMENTIA_DATA, DIABETES_DATA, YEAR) VALUES (?, 0, ?, ?, ?, ?, ?, ?)";
	        stmt = con.prepareStatement(query);
	        int num = 600;
	        for (int i = 0; i < HypertensionArray.length(); i++) {
	            if ("서울특별시".equals(HypertensionArray.getJSONObject(i).getString("시도")) || "전라남도".equals(HypertensionArray.getJSONObject(i).getString("시도"))) {
	                String District = HypertensionArray.getJSONObject(i).getString("시군구");
	                double hypertensionValue = Double.parseDouble(HypertensionArray.getJSONObject(i).getString("지표값(퍼센트)"));
	                double hyperlipidemiaValue = Double.parseDouble(HyperlipidemiaArray.getJSONObject(i).getString("지표값(퍼센트)"));
	                double dementiaDataValue = Double.parseDouble(DementiaDataArray.getJSONObject(i).getString("지표값(퍼센트)"));
	                double diabetesValue = Double.parseDouble(DiabetesArray.getJSONObject(i).getString("지표값(퍼센트)"));
	                int indicatorYear = HypertensionArray.getJSONObject(i).getInt("지표연도");

	                // 파라미터 설정
	                stmt.setInt(1, num);
	                stmt.setString(2, District);
	                stmt.setDouble(3, hypertensionValue);
	                stmt.setDouble(4, hyperlipidemiaValue);
	                stmt.setDouble(5, dementiaDataValue);
	                stmt.setDouble(6, diabetesValue);
	                stmt.setInt(7, indicatorYear);

	                // 쿼리 실행
	                stmt.executeUpdate();
	                num++;
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) {
	                con.close();
	            }
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	}
	
	public boolean checkData() {
		// 데이터베이스에서 데이터 존재 여부를 확인하는 코드를 작성합니다.
	    // 예를 들어, DISEASE 테이블에 데이터가 있는지 여부를 확인합니다.
	    boolean dataExists = false;
	    
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = dataFactory.getConnection();
			String query = "SELECT COUNT(*) AS count FROM DISEASE";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			 if (rs.next()) {
		            int rowCount = rs.getInt("count");
		            dataExists = (rowCount > 600);     }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dataExists;
	}
}
