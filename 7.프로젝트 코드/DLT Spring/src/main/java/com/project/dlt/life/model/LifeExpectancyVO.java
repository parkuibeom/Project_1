package com.project.dlt.life.model;

public class LifeExpectancyVO {
	//계수(기대 수명 계산기)
	private float smokeRate;
	private float drinkingRate;
	private float hbpRate;
	private float diabetesRate;
	
	//기대 수명
	private int expecId;
	private int year;
	private int regionId;
	private float expectancyLife;
	
	public float getSmokeRate() {
		return smokeRate;
	}
	public void setSmokeRate(float smokeRate) {
		this.smokeRate = smokeRate;
	}
	public float getDrinkingRate() {
		return drinkingRate;
	}
	public void setDrinkingRate(float drinkingRate) {
		this.drinkingRate = drinkingRate;
	}
	public float getHbpRate() {
		return hbpRate;
	}
	public void setHbpRate(float hbpRate) {
		this.hbpRate = hbpRate;
	}
	public float getDiabetesRate() {
		return diabetesRate;
	}
	public void setDiabetesRate(float diabetesRate) {
		this.diabetesRate = diabetesRate;
	}
	public int getExpecId() {
		return expecId;
	}
	public void setExpecId(int expecId) {
		this.expecId = expecId;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getRegionId() {
		return regionId;
	}
	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}
	public float getExpectancyLife() {
		return expectancyLife;
	}
	public void setExpectancyLife(float expectancyLife) {
		this.expectancyLife = expectancyLife;
	}
}
