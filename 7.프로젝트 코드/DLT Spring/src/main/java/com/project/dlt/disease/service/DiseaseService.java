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
	public void statisticsService(Model model,String area) {
		List<DistrictVO> list =  diseaseRepository.statisticsService(area); 
		model.addAttribute("list", list);
		model.addAttribute("area", list.get(0).getRegionName());
	}
	
	@Override
	public List<DiseaseVO> getData(String district) {
		List<DiseaseVO> list = diseaseRepository.getData(district);
		return list;
	}
}
