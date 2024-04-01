package com.project.dlt.disease.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.annotation.PostConstruct;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dlt.disease.dao.IDiseaseRepository;
import com.project.dlt.disease.model.DiseaseVO;

@Service
public class DiseaseApiData {
	@Autowired
	IDiseaseRepository diseaseRepository;
	@PostConstruct
	public void init() {
    	try {
            // Open API에서 JSON 데이터 가져오기
    		if (diseaseRepository.isTableExists() > 0) {
				// 테이블이 존재하면 데이터 삭제 후 생성
    			diseaseRepository.deleteTable();
    			diseaseRepository.createTable();
			} else {
				// 테이블이 존재하지 않으면 테이블 생성
				diseaseRepository.createTable();
			}
    		//고혈압
            String HypertensionApiUrl = "https://api.odcloud.kr/api/15064607/v1/uddi:79d21707-cbc3-4f53-b2f8-872803530317?page=1&perPage=15000&serviceKey=OPU9u5W5vsaLPG%2BKA8hOEul5sITK2Z313hOSWeSaUmZE3jGsPPvWZ73TzkuPpCzwEiTj6jq9d%2BNJ5nARHLVYqQ%3D%3D";
            String HypertensionData = fetchDataFromAPI(HypertensionApiUrl);
            //고지혈증
            String HyperlipidemiaApiUrl1 = "https://api.odcloud.kr/api/15064611/v1/uddi:7c535fe0-8727-462b-b538-fc944923136b?page=1&perPage=15000&serviceKey=OPU9u5W5vsaLPG%2BKA8hOEul5sITK2Z313hOSWeSaUmZE3jGsPPvWZ73TzkuPpCzwEiTj6jq9d%2BNJ5nARHLVYqQ%3D%3D";
            String HyperlipidemiaData = fetchDataFromAPI(HyperlipidemiaApiUrl1);
            //치매
            String DementiaApiUrl1 = "https://api.odcloud.kr/api/15089354/v1/uddi:ba837d9a-6cff-47a8-b457-b4fef930c8ad?page=1&perPage=15000&serviceKey=OPU9u5W5vsaLPG%2BKA8hOEul5sITK2Z313hOSWeSaUmZE3jGsPPvWZ73TzkuPpCzwEiTj6jq9d%2BNJ5nARHLVYqQ%3D%3D";
            String DementiaData = fetchDataFromAPI(DementiaApiUrl1);
            //당뇨
            String DiabetesApiUrl1 = "https://api.odcloud.kr/api/15064610/v1/uddi:c0174de2-33d0-4db9-a14d-c17aed2f845e?page=1&perPage=15000&serviceKey=OPU9u5W5vsaLPG%2BKA8hOEul5sITK2Z313hOSWeSaUmZE3jGsPPvWZ73TzkuPpCzwEiTj6jq9d%2BNJ5nARHLVYqQ%3D%3D";
            String DiabetesData = fetchDataFromAPI(DiabetesApiUrl1);
            
            // JSON 데이터 파싱
            JSONObject HypertensionDataJson = new JSONObject(HypertensionData);
            JSONArray HypertensionArray = HypertensionDataJson.getJSONArray("data");
       
            JSONObject HyperlipidemiaDataJson = new JSONObject(HyperlipidemiaData);
            JSONArray HyperlipidemiaArray = HyperlipidemiaDataJson.getJSONArray("data");

            JSONObject DementiaDataJson = new JSONObject(DementiaData);
            JSONArray DementiaArray = DementiaDataJson.getJSONArray("data");

            JSONObject DiabetesDataJson = new JSONObject(DiabetesData);
            JSONArray DiabetesArray = DiabetesDataJson.getJSONArray("data");
     
           
            for (int i = 0; i < HypertensionArray.length(); i++) {
				DiseaseVO diseaseVO = new DiseaseVO();
				diseaseVO.setDemeniaData(DementiaArray.getJSONObject(i).getString("지표값(퍼센트)"));
				diseaseVO.setDiabetesData(DiabetesArray.getJSONObject(i).getString("지표값(퍼센트)"));
				diseaseVO.setHyperlipidemiaData(HyperlipidemiaArray.getJSONObject(i).getString("지표값(퍼센트)"));
				diseaseVO.setHypertensionData(HypertensionArray.getJSONObject(i).getString("지표값(퍼센트)"));
				diseaseVO.setYear(HypertensionArray.getJSONObject(i).getInt("지표연도"));
				diseaseVO.setProvince(HypertensionArray.getJSONObject(i).getString("시도"));
				diseaseVO.setCityOrDistrict(HypertensionArray.getJSONObject(i).getString("시군구"));
				diseaseRepository.apiInsert(diseaseVO);
			}
    	
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	private String fetchDataFromAPI(String apiUrl) throws IOException {
		HttpURLConnection connection = (HttpURLConnection) new URL(apiUrl).openConnection();
		connection.setRequestMethod("GET");
		BufferedReader reader = null;
		StringBuilder apiData = new StringBuilder();

		try {
			reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			while ((line = reader.readLine()) != null) {
				apiData.append(line);
			}
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return apiData.toString();
	}
   

}