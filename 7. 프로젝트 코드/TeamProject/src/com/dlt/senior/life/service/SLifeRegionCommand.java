package com.dlt.senior.life.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.life.dao.LifeServiceDao;
import com.dlt.senior.life.model.LifeServiceDto;

public class SLifeRegionCommand implements SLCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		LifeServiceDao lifeDao = LifeServiceDao.getInstance();
		
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
		
		String regionFirst = request.getParameter("regionFirst");
		String regionSecond = request.getParameter("regionSecond");
		String yearStart = request.getParameter("yearStart");
		String yearEnd = request.getParameter("yearEnd");
		
		int firstRegionId = regionMap.getOrDefault(regionFirst, 0);
		int secondRegionId = regionMap.getOrDefault(regionSecond, 0);
		
		List<LifeServiceDto> list = lifeDao.lifeList(firstRegionId, secondRegionId, yearStart, yearEnd);
		request.setAttribute("lifeList", list);
		
	}
}
