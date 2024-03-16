package com.dlt.senior.life.service;

import java.io.BufferedReader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.dlt.senior.life.dao.LifeServiceDao;

public class SLifePersonalCommand implements SLCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		LifeServiceDao dao = LifeServiceDao.getInstance();
		JSONObject jsonObject = null;
		
		//R에서 계산한 계수
		float ageGroup = (float) -0.8800585;
		float gender = (float) 1.8732418;
		float smokeRate = (float) -0.1005591;
		float drinkingRate = (float) -0.0948583;
		float hbpRate = (float) -0.0779488;
		float diabetesRate = (float) -0.0672881;
		float bias = (float) 82.9454053;
		
		try {
			//사용자가 입력한 정보
			StringBuilder buffer = new StringBuilder();
			BufferedReader reader = request.getReader();
			String line;
			while ((line = reader.readLine()) != null) {
			     buffer.append(line);
			}
			String data = buffer.toString();
			jsonObject = new JSONObject(data);
		}catch(Exception e) {
			e.printStackTrace();
		}


		int ageCheck = jsonObject.getInt("personal_age");
		int genderCheck = jsonObject.getInt("genderCheck");
		int smokingCheck = jsonObject.getInt("smokeCheck");
		int drinkingCheck = jsonObject.getInt("drinkingCheck");
		int hbpCheck = jsonObject.getInt("hbpCheck");
		int diabetesCheck = jsonObject.getInt("diabetesCheck");
		
		//연령을 연령대로 변환
		int ageGroupCheck = ageCheck/5 * 5;
		
		List<Float> coefficient = dao.personalLife(ageGroupCheck, genderCheck);
		float ageX = ageGroup * ageCheck;
		float genderX = gender * genderCheck;
		float smokeX = (coefficient.get(0) * smokingCheck * smokeRate);
		float drinkX = (coefficient.get(1) * drinkingCheck * drinkingRate);
		float hbpX = (coefficient.get(2) * hbpCheck * hbpRate);
		float diaX = (coefficient.get(3) * diabetesCheck * diabetesRate);
		
		//흡연율, 음주율, 고혈압 비율, 당뇨병 비율 -> 여부로 데이터 변환
		float age = bias + (ageX + genderX + smokeX + drinkX + hbpX + diaX);

		int intAge = Math.round(age);
		
		if(intAge > 90) {
			intAge = intAge - 5;
		}
		
		//남은 기대 수명이 0살일 때 1살 증가
		if(age == 0) {
			age = 1;
		}
		
		
		
		request.setAttribute("age", intAge);
	}
	
}
