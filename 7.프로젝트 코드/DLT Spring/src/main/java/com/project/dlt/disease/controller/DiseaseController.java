package com.project.dlt.disease.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.dlt.disease.service.IDiseaseService;

@Controller
public class DiseaseController {

	@Autowired
	IDiseaseService diseaseSrevice;

	@GetMapping(value = "/disease/map")
	public String map() {
		return "/disease/map";
	}
	
}	
