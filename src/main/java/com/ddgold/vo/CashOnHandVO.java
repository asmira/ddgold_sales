package com.ddgold.vo;

import java.util.Date;

public class CashOnHandVO {
	private int cashSeq;
	private String cashType; 
	private Date cashDt;
	private int cashIncome; 
	private int cashExpense;
	
	public int getCashSeq() {
		return cashSeq;
	}
	public String getCashType() {
		return cashType;
	}
	public Date getCashDt() {
		return cashDt;
	}
	public int getCashIncome() {
		return cashIncome;
	}
	public int getCashExpense() {
		return cashExpense;
	}
	public void setCashSeq(int cashSeq) {
		this.cashSeq = cashSeq;
	}
	public void setCashType(String cashType) {
		this.cashType = cashType;
	}
	public void setCashDt(Date cashDt) {
		this.cashDt = cashDt;
	}
	public void setCashIncome(int cashIncome) {
		this.cashIncome = cashIncome;
	}
	public void setCashExpense(int cashExpense) {
		this.cashExpense = cashExpense;
	}
	
	@Override
	public String toString() {
		return "CashOnHandVO [cashSeq=" + cashSeq + ", cashType=" + cashType + ", cashDt=" + cashDt + ", cashIncome="
				+ cashIncome + ", cashExpense=" + cashExpense + "]";
	}
	
}
