package com.project.dlt.disease.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;

import com.project.dlt.disease.model.DiseaseVO;
import com.project.dlt.disease.model.DistrictVO;

public interface IDiseaseRepository {
	public List<DistrictVO> statisticsService(@Param("area") String area);

	public List<DiseaseVO> getData(@Param("region") String region, @Param("disease") String disease);

	public void apiData(JSONArray HypertensionArray, JSONArray HyperlipidemiaArray, JSONArray DementiaArray,
			JSONArray DiabetesArray);

	public int isTableExists();

	public void deleteTable();

	public void createTable();

	public void apiInsert(DiseaseVO disease);
}
