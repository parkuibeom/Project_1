package com.dlt.senior.disease.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dlt.senior.disease.dao.SDiseaseServiceDao;

public class SCCheckData {

	private SDiseaseServiceDao diseaseDao;

	public SCCheckData() {
		diseaseDao = SDiseaseServiceDao.getInstance();
	}

	public void initializeIfNeeded() {
		// 데이터가 이미 존재하는지 여부를 확인합니다.
		boolean dataExists = diseaseDao.checkData();
		System.out.println(dataExists);
		if (!dataExists) {
			// 데이터가 없는 경우에만 초기화 작업을 수행합니다.
			initializeData();
		}
	}

	private void initializeData() {
		// 데이터를 초기화하는 코드를 작성합니다.
		SDDataCommand sdDataCommand = new SDDataCommand();
	}

}
