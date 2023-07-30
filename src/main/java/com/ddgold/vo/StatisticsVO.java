package com.ddgold.vo;

import java.util.Date;
import java.util.List;

public class StatisticsVO {
	private String colValue;
	private int k14;
	private int k18;
	private int gold;
	private int silver;
	private int total;
	private int avg;
	
	public String getColValue() {
		return colValue;
	}
	public int getK14() {
		return k14;
	}
	public int getK18() {
		return k18;
	}
	public int getGold() {
		return gold;
	}
	public int getSilver() {
		return silver;
	}
	public int getTotal() {
		return total;
	}
	public int getAvg() {
		return avg;
	}
	public void setColValue(String colValue) {
		this.colValue = colValue;
	}
	public void setK14(int k14) {
		this.k14 = k14;
	}
	public void setK18(int k18) {
		this.k18 = k18;
	}
	public void setGold(int gold) {
		this.gold = gold;
	}
	public void setSilver(int silver) {
		this.silver = silver;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setAvg(int avg) {
		this.avg = avg;
	}
	@Override
	public String toString() {
		return "StatisticsVO [colValue=" + colValue + ", k14=" + k14 + ", k18=" + k18 + ", gold=" + gold + ", silver="
				+ silver + ", total=" + total + ", avg=" + avg + "]";
	}
	
}