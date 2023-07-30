package com.ddgold.vo;

import java.util.Date;

public class RepairVO {
	private int repairSeq;
	private String repairMobile;
	private String repairName;
	private String prdType;
	private String prdTypeStr;
	private String karatage;
	private String karatageStr;
	private String repairDesc;
	private int repairPrice;
	private int paymentCardDtl;
	private int paymentTransferDtl;
	private int paymentCashDtl;
	private Date repairDate;
	private Date receiptDate;
	private Date finishDate;
	

	public String getPrdTypeStr() {
		return this.prdTypeStr;
	}

	public void setPrdTypeStr(String prdTypeStr) {
		this.prdTypeStr = prdTypeStr;
	}

	public String getKaratageStr() {
		return this.karatageStr;
	}

	public void setKaratageStr(String karatageStr) {
		this.karatageStr = karatageStr;
	}

	public int getRepairSeq() {
		return this.repairSeq;
	}

	public void setRepairSeq(int repairSeq) {
		this.repairSeq = repairSeq;
	}

	public String getRepairMobile() {
		return this.repairMobile;
	}

	public void setRepairMobile(String repairMobile) {
		this.repairMobile = repairMobile;
	}

	public String getRepairName() {
		return this.repairName;
	}

	public void setRepairName(String repairName) {
		this.repairName = repairName;
	}

	public String getPrdType() {
		return this.prdType;
	}

	public void setPrdType(String prdType) {
		this.prdType = prdType;
	}

	public String getKaratage() {
		return this.karatage;
	}

	public void setKaratage(String karatage) {
		this.karatage = karatage;
	}

	public String getRepairDesc() {
		return this.repairDesc;
	}

	public void setRepairDesc(String repairDesc) {
		this.repairDesc = repairDesc;
	}

	public int getRepairPrice() {
		return this.repairPrice;
	}

	public void setRepairPrice(int repairPrice) {
		this.repairPrice = repairPrice;
	}

	public int getPaymentCardDtl() {
		return this.paymentCardDtl;
	}

	public void setPaymentCardDtl(int paymentCardDtl) {
		this.paymentCardDtl = paymentCardDtl;
	}

	public int getPaymentTransferDtl() {
		return this.paymentTransferDtl;
	}

	public void setPaymentTransferDtl(int paymentTransferDtl) {
		this.paymentTransferDtl = paymentTransferDtl;
	}

	public int getPaymentCashDtl() {
		return this.paymentCashDtl;
	}

	public void setPaymentCashDtl(int paymentCashDtl) {
		this.paymentCashDtl = paymentCashDtl;
	}

	public Date getRepairDate() {
		return this.repairDate;
	}

	public void setRepairDate(Date repairDate) {
		this.repairDate = repairDate;
	}

	public Date getReceiptDate() {
		return this.receiptDate;
	}

	public void setReceiptDate(Date receiptDate) {
		this.receiptDate = receiptDate;
	}

	public Date getFinishDate() {
		return this.finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}


	@Override
	public String toString() {
		return "{" +
			" repairSeq='" + getRepairSeq() + "'" +
			", repairMobile='" + getRepairMobile() + "'" +
			", repairName='" + getRepairName() + "'" +
			", prdType='" + getPrdType() + "'" +
			", karatage='" + getKaratage() + "'" +
			", repairDesc='" + getRepairDesc() + "'" +
			", repairPrice='" + getRepairPrice() + "'" +
			", paymentCardDtl='" + getPaymentCardDtl() + "'" +
			", paymentTransferDtl='" + getPaymentTransferDtl() + "'" +
			", paymentCashDtl='" + getPaymentCashDtl() + "'" +
			", repairDate='" + getRepairDate() + "'" +
			", receiptDate='" + getReceiptDate() + "'" +
			", finishDate='" + getFinishDate() + "'" +
			"}";
	}
	
}
