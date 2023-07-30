package com.ddgold.vo;

import java.util.Date;

public class GoldVO {
	private int goldSeq;
	private Date goldDt;
	private int k10;  
	private int k14;  
	private int k18;	 
	private int k24;	 
	private int diamond;
	private int transfer;
	private int cash;  
	private int goods;
	private int gold;
	public int getGoldSeq() {
		return goldSeq;
	}
	public Date getGoldDt() {
		return goldDt;
	}
	public int getK10() {
		return k10;
	}
	public int getK14() {
		return k14;
	}
	public int getK18() {
		return k18;
	}
	public int getK24() {
		return k24;
	}
	public int getDiamond() {
		return diamond;
	}
	public int getTransfer() {
		return transfer;
	}
	public int getCash() {
		return cash;
	}
	public int getGoods() {
		return goods;
	}
	public int getGold() {
		return gold;
	}
	public void setGoldSeq(int goldSeq) {
		this.goldSeq = goldSeq;
	}
	public void setGoldDt(Date goldDt) {
		this.goldDt = goldDt;
	}
	public void setK10(int k10) {
		this.k10 = k10;
	}
	public void setK14(int k14) {
		this.k14 = k14;
	}
	public void setK18(int k18) {
		this.k18 = k18;
	}
	public void setK24(int k24) {
		this.k24 = k24;
	}
	public void setDiamond(int diamond) {
		this.diamond = diamond;
	}
	public void setTransfer(int transfer) {
		this.transfer = transfer;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public void setGoods(int goods) {
		this.goods = goods;
	}
	public void setGold(int gold) {
		this.gold = gold;
	}
	
	@Override
	public String toString() {
		return "GoldVO [goldSeq=" + goldSeq + ", goldDt=" + goldDt + ", k10=" + k10 + ", k14=" + k14 + ", k18=" + k18
				+ ", k24=" + k24 + ", transfer=" + transfer + ", cash=" + cash + ", goods=" + goods + ", gold=" + gold
				+ "]";
	}
	
	
}
