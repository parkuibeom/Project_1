package com.project.dlt.life.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.dlt.life.model.LifeExpectancyVO;

public interface ILifeRepository {
	public LifeExpectancyVO getCoefficient(@Param("ageCheck") int ageCheck, @Param("gender") int gender);
	public List<LifeExpectancyVO> getLife(@Param("firstRegionId") int firstRegionId, @Param("secondRegionId") int secondRegionId, @Param("yearStart") int yearStart, @Param("yearEnd") int yearEnd);
}
