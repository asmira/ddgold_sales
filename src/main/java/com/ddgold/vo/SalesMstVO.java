package com.ddgold.vo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SalesMstVO {
	private int salesSeq;
	private Date salesDt;
	private int prdPrice;
	private int salePrice;
	private int paymentCardDtl; 
	private int paymentTransferDtl;
	private int paymentCashDtl;
	private int paymentGoldDtl;
	private int paymentGoodsDtl;
	private String description;
	public int getSalesSeq() {
		return salesSeq;
	}
	public Date getSalesDt() {
		return salesDt;
	}
	public int getPrdPrice() {
		return prdPrice;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public String getDescription() {
		return description;
	}
	public void setSalesSeq(int salesSeq) {
		this.salesSeq = salesSeq;
	}
	public void setSalesDt(Date salesDt) {
		this.salesDt = salesDt;
	}
	public void setPrdPrice(int prdPrice) {
		this.prdPrice = prdPrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSalesDtStr() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(getSalesDt());
	}
	public int getPaymentCardDtl() {
		return paymentCardDtl;
	}
	public int getPaymentTransferDtl() {
		return paymentTransferDtl;
	}
	public int getPaymentCashDtl() {
		return paymentCashDtl;
	}
	public int getPaymentGoldDtl() {
		return paymentGoldDtl;
	}
	public int getPaymentGoodsDtl() {
		return paymentGoodsDtl;
	}
	public void setPaymentCardDtl(int paymentCardDtl) {
		this.paymentCardDtl = paymentCardDtl;
	}
	public void setPaymentTransferDtl(int paymentTransferDtl) {
		this.paymentTransferDtl = paymentTransferDtl;
	}
	public void setPaymentCashDtl(int paymentCashDtl) {
		this.paymentCashDtl = paymentCashDtl;
	}
	public void setPaymentGoldDtl(int paymentGoldDtl) {
		this.paymentGoldDtl = paymentGoldDtl;
	}
	public void setPaymentGoodsDtl(int paymentGoodsDtl) {
		this.paymentGoodsDtl = paymentGoodsDtl;
	}
	
	@Override
	public String toString() {
		return "SalesMstVO [salesSeq=" + salesSeq + ", salesDt=" + salesDt + ", prdPrice=" + prdPrice + ", salePrice="
				+ salePrice + ", paymentCardDtl=" + paymentCardDtl + ", paymentTransferDtl=" + paymentTransferDtl
				+ ", paymentCashDtl=" + paymentCashDtl + ", paymentGoldDtl=" + paymentGoldDtl + ", paymentGoodsDtl="
				+ paymentGoodsDtl + ", description=" + description + "]";
	}

	
}
