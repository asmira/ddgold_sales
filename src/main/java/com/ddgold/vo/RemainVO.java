package com.ddgold.vo;

import java.util.Date;

public class RemainVO {
	private int remainSeq;
	private int salesSeq;
	private Date salesDt;
	private int orderSeq;
	private int remainAmt;
	private int remainSalesSeq;
	private Date remainSalesDt;
	private int remainPaymentAmt;
	private String description;

	
	public Date getSalesDt() {
		return salesDt;
	}
	public void setSalesDt(Date salesDt) {
		this.salesDt = salesDt;
	}
	public Date getRemainSalesDt() {
		return remainSalesDt;
	}
	public void setRemainSalesDt(Date remainSalesDt) {
		this.remainSalesDt = remainSalesDt;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getRemainSeq() {
		return remainSeq;
	}
	public int getSalesSeq() {
		return salesSeq;
	}
	public int getOrderSeq() {
		return orderSeq;
	}
	public int getRemainAmt() {
		return remainAmt;
	}
	public int getRemainSalesSeq() {
		return remainSalesSeq;
	}
	public int getRemainPaymentAmt() {
		return remainPaymentAmt;
	}
	public void setRemainSeq(int remainSeq) {
		this.remainSeq = remainSeq;
	}
	public void setSalesSeq(int salesSeq) {
		this.salesSeq = salesSeq;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public void setRemainAmt(int remainAmt) {
		this.remainAmt = remainAmt;
	}
	public void setRemainSalesSeq(int remainSalesSeq) {
		this.remainSalesSeq = remainSalesSeq;
	}
	public void setRemainPaymentAmt(int remainPaymentAmt) {
		this.remainPaymentAmt = remainPaymentAmt;
	}

	@Override
	public String toString() {
		return "RemainVO [remainSeq=" + remainSeq + ", salesSeq=" + salesSeq + ", orderSeq=" + orderSeq + ", remainAmt="
				+ remainAmt + ", remainSalesSeq=" + remainSalesSeq + ", remainPaymentAmt=" + remainPaymentAmt + "]";
	}
}
