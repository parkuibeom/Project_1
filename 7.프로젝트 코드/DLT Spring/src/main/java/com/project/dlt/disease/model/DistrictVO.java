package com.project.dlt.disease.model;

public class DistrictVO {

	private String districtId;
	private String districtName;
	private String regionId;
	private String regionName;
	
	
	public String getDistrictId() {
		return districtId;
	}
	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public String getRegionId() {
		return regionId;
	}
	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	
	
	@Override
	public String toString() {
		return "DistrictDto [districtId=" + districtId + ", districtName=" + districtName + ", regionId=" + regionId
				+ ", regionName=" + regionName + "]";
	}

 
}
