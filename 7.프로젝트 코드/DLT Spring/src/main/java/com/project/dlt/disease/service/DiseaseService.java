package com.project.dlt.disease.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dlt.disease.dao.IDiseaseRepository;
import com.project.dlt.disease.model.DiseaseVO;
import com.project.dlt.disease.model.DistrictVO;

@Service
public class DiseaseService implements IDiseaseService{
	@Autowired
	IDiseaseRepository diseaseRepository;
	
	@Override
	public List<DiseaseVO> getData(String region,String disease) {
		
		if(disease.equals("hyperlipidemia")) {
			disease = "HYPERLIPIDEMIA_DATA";
		}else if(disease.equals("dementia")) {
			disease = "DEMENTIA_DATA";
		}else if(disease.equals("diabetes")) {
			disease = "DIABETES_DATA";
		}else if(disease.equals("hbp")) {
			disease = "HYPERTENSION_DATA";
		}
		List<DiseaseVO> list = diseaseRepository.getData(region,disease);
		return list;
	}
}
