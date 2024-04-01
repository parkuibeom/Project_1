package com.project.dlt.disease.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dlt.disease.model.DiseaseVO;
import com.project.dlt.disease.service.IDiseaseService;

@Controller
public class DiseaseController {

	@Autowired
	IDiseaseService diseaseSrevice;

	@GetMapping(value = "/disease/chartData")
	public@ResponseBody List<DiseaseVO> getData(String region,String disease) {
		List<DiseaseVO> list = diseaseSrevice.getData(region,disease);
		return list;
	}

}	
