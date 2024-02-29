package com.dlt.senior.disease.service;


import org.json.JSONArray;
import org.json.JSONObject;

import com.dlt.senior.disease.dao.SDiseaseServiceDao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


public class SDDataCommand {
	    public SDDataCommand() {
	    	SDiseaseServiceDao dao = SDiseaseServiceDao.getInstance();
	    	try {
	            // Open API에서 JSON 데이터 가져오기
	    		//고혈압
	            String HypertensionApiUrl = "https://api.odcloud.kr/api/15064607/v1/uddi:79d21707-cbc3-4f53-b2f8-872803530317?page=1&perPage=15000&serviceKey=OPU9u5W5vsaLPG%2BKA8hOEul5sITK2Z313hOSWeSaUmZE3jGsPPvWZ73TzkuPpCzwEiTj6jq9d%2BNJ5nARHLVYqQ%3D%3D";
	            String HypertensionData = fetchDataFromApi(HypertensionApiUrl);
	            //고지혈증
	            String HyperlipidemiaApiUrl1 = "https://api.odcloud.kr/api/15064611/v1/uddi:7c535fe0-8727-462b-b538-fc944923136b?page=1&perPage=15000&serviceKey=OPU9u5W5vsaLPG%2BKA8hOEul5sITK2Z313hOSWeSaUmZE3jGsPPvWZ73TzkuPpCzwEiTj6jq9d%2BNJ5nARHLVYqQ%3D%3D";
	            String HyperlipidemiaData = fetchDataFromApi(HyperlipidemiaApiUrl1);
	            //치매
	            String DementiaApiUrl1 = "https://api.odcloud.kr/api/15089354/v1/uddi:ba837d9a-6cff-47a8-b457-b4fef930c8ad?page=1&perPage=15000&serviceKey=OPU9u5W5vsaLPG%2BKA8hOEul5sITK2Z313hOSWeSaUmZE3jGsPPvWZ73TzkuPpCzwEiTj6jq9d%2BNJ5nARHLVYqQ%3D%3D";
	            String DementiaData = fetchDataFromApi(DementiaApiUrl1);
	            //당뇨
	            String DiabetesApiUrl1 = "https://api.odcloud.kr/api/15064610/v1/uddi:c0174de2-33d0-4db9-a14d-c17aed2f845e?page=1&perPage=15000&serviceKey=OPU9u5W5vsaLPG%2BKA8hOEul5sITK2Z313hOSWeSaUmZE3jGsPPvWZ73TzkuPpCzwEiTj6jq9d%2BNJ5nARHLVYqQ%3D%3D";
	            String DiabetesData = fetchDataFromApi(DiabetesApiUrl1);
	            
	            // JSON 데이터 파싱
	            JSONObject HypertensionDataJson = new JSONObject(HypertensionData);
	            JSONArray HypertensionArray = HypertensionDataJson.getJSONArray("data");
	       
	            JSONObject HyperlipidemiaDataJson = new JSONObject(HyperlipidemiaData);
	            JSONArray HyperlipidemiaArray = HyperlipidemiaDataJson.getJSONArray("data");
	
	            JSONObject DementiaDataJson = new JSONObject(DementiaData);
	            JSONArray DementiaArray = DementiaDataJson.getJSONArray("data");

	            JSONObject DiabetesDataJson = new JSONObject(DiabetesData);
	            JSONArray DiabetesArray = DiabetesDataJson.getJSONArray("data");
	     
	            
	            
	            // 데이터베이스에 저장
	            dao.saveDataToDatabase(HypertensionArray,HyperlipidemiaArray,DementiaArray,DiabetesArray);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    private String fetchDataFromApi(String apiUrl) throws IOException {
	        HttpURLConnection connection = (HttpURLConnection) new URL(apiUrl).openConnection();
	        connection.setRequestMethod("GET");

	        try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
	            StringBuilder apiData = new StringBuilder();
	            String line;

	            while ((line = reader.readLine()) != null) {
	                apiData.append(line);
	            }

	            return apiData.toString();
	        }
	    }

	   

}
