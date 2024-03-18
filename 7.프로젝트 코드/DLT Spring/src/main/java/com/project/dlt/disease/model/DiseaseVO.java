package com.project.dlt.disease.model;

public class DiseaseVO {
	private String districtId;
	private String demeniaData;
	private String diabetesData;
	private String hyperlipidemiaData;
	private String hypertensionData;
	private String year;
	
	
	public String getDistrictId() {
		return districtId;
	}
	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}
	public String getDemeniaData() {
		return demeniaData;
	}
	public void setDemeniaData(String demeniaData) {
		this.demeniaData = demeniaData;
	}
	public String getDiabetesData() {
		return diabetesData;
	}
	public void setDiabetesData(String diabetesData) {
		this.diabetesData = diabetesData;
	}
	public String getHyperlipidemiaData() {
		return hyperlipidemiaData;
	}
	public void setHyperlipidemiaData(String hyperlipidemiaData) {
		this.hyperlipidemiaData = hyperlipidemiaData;
	}
	public String getHypertensionData() {
		return hypertensionData;
	}
	public void setHypertensionData(String hypertensionData) {
		this.hypertensionData = hypertensionData;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	
	@Override
	public String toString() {
		return "DiseaseVO [districtId=" + districtId + ", demeniaData=" + demeniaData + ", diabetesData=" + diabetesData
				+ ", hyperlipidemiaData=" + hyperlipidemiaData + ", hypertensionData=" + hypertensionData + ", year="
				+ year + "]";
	}
	
	
}
