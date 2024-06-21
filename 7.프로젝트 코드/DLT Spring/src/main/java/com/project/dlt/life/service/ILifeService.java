package com.project.dlt.life.service;

import java.util.Map;

import org.json.JSONArray;



public interface ILifeService {
	public int calcLife(Map<String, Object> sendData);
	public String getLife(String regionFirst, String regionSecond, int yearStart, int yearEnd);
	public String getLife(String regionFirst, int yearStart, int yearEnd);
}
