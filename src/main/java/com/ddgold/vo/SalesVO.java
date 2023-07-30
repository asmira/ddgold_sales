package com.ddgold.vo;

import java.util.Date;
import java.util.List;

public class SalesVO {
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
	private List<SalesDtlVO> salesDtlList;
	private RemainVO remain;
	private int remainTargetSeq;
	
	public int getRemainTargetSeq() {
		return remainTargetSeq;
	}
	public void setRemainTargetSeq(int remainTargetSeq) {
		this.remainTargetSeq = remainTargetSeq;
	}
	public RemainVO getRemain() {
		return remain;
	}
	public void setRemain(RemainVO remain) {
		this.remain = remain;
	}
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
	public int getPaymentCardDtl() {
		return paymentCardDtl;
	}
	public void setPaymentCardDtl(int paymentCardDtl) {
		this.paymentCardDtl = paymentCardDtl;
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
	public String getDescription() {
		return description;
	}
	public List<SalesDtlVO> getSalesDtlList() {
		return salesDtlList;
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
	public void setSalesDtlList(List<SalesDtlVO> salesDtlList) {
		this.salesDtlList = salesDtlList;
	}
	public int getTotalPayment() {
		return paymentCardDtl+paymentCashDtl+paymentGoldDtl+paymentGoodsDtl+paymentTransferDtl;
	}

	@Override
	public String toString() {
		return "SalesVO [salesSeq=" + salesSeq + ", salesDt=" + salesDt + ", prdPrice=" + prdPrice + ", salePrice="
				+ salePrice + ", paymentCardDtl=" + paymentCardDtl + ", paymentTransferDtl=" + paymentTransferDtl
				+ ", paymentCashDtl=" + paymentCashDtl + ", paymentGoldDtl=" + paymentGoldDtl + ", paymentGoodsDtl="
				+ paymentGoodsDtl + ", description=" + description + ", salesDtlList=" + salesDtlList + "]";
	}

	
}