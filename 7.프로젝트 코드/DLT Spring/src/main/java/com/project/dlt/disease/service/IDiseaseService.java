package com.project.dlt.disease.service;

import java.util.List;

import org.json.JSONArray;
import org.springframework.ui.Model;

import com.project.dlt.disease.model.DiseaseVO;

public interface IDiseaseService {
	public List<DiseaseVO> getData(String region,String disease);
}
