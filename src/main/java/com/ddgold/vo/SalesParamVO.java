package com.ddgold.vo;

public class SalesParamVO {
	private String ordField;
	private String ordDirection;
	private String year;
	private String month;
	private String dt;
	private String startDate;
	private String endDate;
	private String salesType;
	private String karatage;
	private String prdType;
	private int minSalePrice;
	private int maxSalePrice;
	private String status;


	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrdField() {
		return ordField;
	}
	public String getOrdDirection() {
		return ordDirection;
	}
	public void setOrdField(String ordField) {
		this.ordField = ordField;
	}
	public void setOrdDirection(String ordDirection) {
		this.ordDirection = ordDirection;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getMonth() {
		return month;
	}
	public String getStartDate() {
		return startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public String getSalesType() {
		return salesType;
	}
	public String getKaratage() {
		return karatage;
	}
	public int getMinSalePrice() {
		return minSalePrice;
	}
	public int getMaxSalePrice() {
		return maxSalePrice;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public void setSalesType(String salesType) {
		this.salesType = salesType;
	}
	public void setKaratage(String karatage) {
		this.karatage = karatage;
	}
	public String getPrdType() {
		return prdType;
	}
	public void setPrdType(String prdType) {
		this.prdType = prdType;
	}
	public void setMinSalePrice(int minSalePrice) {
		this.minSalePrice = minSalePrice;
	}
	public void setMaxSalePrice(int maxSalePrice) {
		this.maxSalePrice = maxSalePrice;
	}
	@Override
	public String toString() {
		return "SalesParamVO [year=" + year + ", month=" + month + ", dt=" + dt + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", salesType=" + salesType + ", karatage=" + karatage + ", prdType="
				+ prdType + ", minSalePrice=" + minSalePrice + ", maxSalePrice=" + maxSalePrice + "]";
	}
	

}
