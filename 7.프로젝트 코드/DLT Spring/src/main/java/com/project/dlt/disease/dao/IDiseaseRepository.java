package com.project.dlt.disease.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.dlt.disease.model.DiseaseVO;
import com.project.dlt.disease.model.DistrictVO;

public interface IDiseaseRepository {
	public List<DistrictVO> statisticsService(@Param("area") String area);
	
	public List<DiseaseVO> getData(@Param("district")String district);
}
