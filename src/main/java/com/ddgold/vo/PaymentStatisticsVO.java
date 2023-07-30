package com.ddgold.vo;

public class PaymentStatisticsVO {
	private String colValue;
	private int paymentCardDtl;
	private int paymentTransferDtl;
	private int paymentCashDtl;
	private int paymentGoldDtl;
	private int paymentGoodsDtl;
	private int total;

	public String getColValue() {
		return colValue;
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
	public void setColValue(String colValue) {
		this.colValue = colValue;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "PaymentStatisticsVO [colValue=" + colValue + ", paymentCardDtl=" + paymentCardDtl
				+ ", paymentTransferDtl=" + paymentTransferDtl + ", paymentCashDtl=" + paymentCashDtl
				+ ", paymentGoldDtl=" + paymentGoldDtl + ", paymentGoodsDtl=" + paymentGoodsDtl + ", total=" + total
				+ "]";
	}
}
