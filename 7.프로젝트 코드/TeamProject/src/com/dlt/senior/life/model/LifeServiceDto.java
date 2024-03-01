package com.dlt.senior.life.model;

public class LifeServiceDto {
	private int expecId;
	private int year;
	private int regionId;
	private float expectancyLife;
	
	public int getExpecId() {
		return expecId;
	}
	public int getYear() {
		return year;
	}
	public int getRegionId() {
		return regionId;
	}
	public float getExpectancyLife() {
		return expectancyLife;
	}
	public void setExpecId(int expecId) {
		this.expecId = expecId;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}
	public void setExpectancyLife(float expectancyLife) {
		this.expectancyLife = expectancyLife;
	}
}
