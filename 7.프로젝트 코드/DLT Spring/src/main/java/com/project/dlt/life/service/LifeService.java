package com.project.dlt.life.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dlt.life.dao.ILifeRepository;
import com.project.dlt.life.model.LifeExpectancyVO;

@Service
public class LifeService implements ILifeService {
	@Autowired
	ILifeRepository lifeRepository;

	//개인별 기대 수명 계산
	@Override
	public int calcLife(Map<String, Object> sendData) {
		//R에서 계산한 계수(DB 커넥션 변경 예정)
		float ageGroup = (float) -0.8800585;
		float gender = (float) 1.8732418;
		float smokeRate = (float) -0.1005591;
		float drinkingRate = (float) -0.0948583;
		float hbpRate = (float) -0.0779488;
		float diabetesRate = (float) -0.0672881;
		float bias = (float) 82.9454053;
		

		
		int ageCheck = Integer.parseInt((String) sendData.get("personal_age"))/5 * 5;
		int genderCheck = Integer.parseInt((String) sendData.get("genderCheck"));
		int smokingCheck = Integer.parseInt((String) sendData.get("smokeCheck"));
		int drinkingCheck = Integer.parseInt((String) sendData.get("drinkingCheck"));
		int hbpCheck = Integer.parseInt((String) sendData.get("hbpCheck"));
		int diabetesCheck = Integer.parseInt((String) sendData.get("diabetesCheck"));
		
		LifeExpectancyVO vo = lifeRepository.getCoefficient(ageCheck, genderCheck);
		
		float ageX = ageGroup * ageCheck;
		float genderX = gender * genderCheck;
		float smokeX = vo.getSmokeRate() * smokingCheck * smokeRate;
		float drinkX = vo.getDrinkingRate() * drinkingCheck * drinkingRate;
		float hbpX = vo.getHbpRate() * hbpCheck * hbpRate;
		float diaX = vo.getDiabetesRate() * diabetesCheck * diabetesRate;
		
		
		
		
		//흡연율, 음주율, 고혈압 비율, 당뇨병 비율 -> 여부로 데이터 변환
		float lifeExpectancy = Math.round(bias + (ageX + genderX + smokeX + drinkX + hbpX + diaX));
		lifeExpectancy = lifeExpectancy - 10;
		
		//남은 기대 여명이 0살일 때 1살 증가
		if(lifeExpectancy == 0) {
			lifeExpectancy = 1;
		}
		
		int lifeExpectancyConvert = Math.round(lifeExpectancy);
		return lifeExpectancyConvert;
		
	}
	
	//미래 기대 수명 로딩
	@Override
	public String getLife(String regionFirst, int yearStart, int yearEnd) {
		Map<String, Integer> regionMap = new HashMap<String, Integer>();
		
		//맵 지역 매핑
        regionMap.put("서울특별시", 1);
        regionMap.put("전라남도", 2);
        regionMap.put("강원도", 3);
        regionMap.put("경기도", 4);
        regionMap.put("경상남도", 5);
        regionMap.put("경상북도", 6);
        regionMap.put("광주광역시", 7);
        regionMap.put("대구광역시", 8);
        regionMap.put("대전광역시", 9);
        regionMap.put("부산광역시", 10);
        regionMap.put("세종특별자치시", 11);
        regionMap.put("울산광역시", 12);
        regionMap.put("인천광역시", 13);
        regionMap.put("전라북도", 14);
        regionMap.put("제주특별자치도", 15);
        regionMap.put("충청남도", 16);
        regionMap.put("충청북도", 17);
		
		
		int firstRegionId = regionMap.getOrDefault(regionFirst, 0);
		
		List<LifeExpectancyVO> list = lifeRepository.getLife(firstRegionId, 0, yearStart, yearEnd);
		JSONArray jsonArray = new JSONArray();
		
		for(LifeExpectancyVO data : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("year", data.getYear());
			jsonObject.put("region_id", data.getRegionId());
			jsonObject.put("value", data.getExpectancyLife());
			jsonArray.put(jsonObject);
		}
	
		String json = jsonArray.toString();
		
		return json;
	}

	//과거 기대 수명 로딩
	@Override
	public String getLife(String regionFirst, String regionSecond, int yearStart, int yearEnd) {
		Map<String, Integer> regionMap = new HashMap<String, Integer>();
		
		//맵 지역 매핑
        regionMap.put("서울특별시", 1);
        regionMap.put("전라남도", 2);
        regionMap.put("강원도", 3);
        regionMap.put("경기도", 4);
        regionMap.put("경상남도", 5);
        regionMap.put("경상북도", 6);
        regionMap.put("광주광역시", 7);
        regionMap.put("대구광역시", 8);
        regionMap.put("대전광역시", 9);
        regionMap.put("부산광역시", 10);
        regionMap.put("세종특별자치시", 11);
        regionMap.put("울산광역시", 12);
        regionMap.put("인천광역시", 13);
        regionMap.put("전라북도", 14);
        regionMap.put("제주특별자치도", 15);
        regionMap.put("충청남도", 16);
        regionMap.put("충청북도", 17);
		
		
		int firstRegionId = regionMap.getOrDefault(regionFirst, 0);
		int secondRegionId = regionMap.getOrDefault(regionSecond, 0);
		
		List<LifeExpectancyVO> list = lifeRepository.getLife(firstRegionId, secondRegionId, yearStart, yearEnd);
		JSONArray jsonArray = new JSONArray();
		
		for(LifeExpectancyVO data : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("year", data.getYear());
			jsonObject.put("region_id", data.getRegionId());
			jsonObject.put("value", data.getExpectancyLife());
			jsonArray.put(jsonObject);
		}
	
		String json = jsonArray.toString();
		
		return json;
	}
	
	
	
}
