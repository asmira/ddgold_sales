package com.ddgold.vo;

import java.util.Date;

public class RepairDtlVO {
  private int repairDtlSeq;
  private int repairSeq;
  private String prdType;
  private String prdTypeStr;
  private String karatage;
  private String karatageStr;
  private String color;
  private String colorStr;
  private Date receiptDate; //수령일
  private Date finishDate;  //전달일
  private String finishStatus;
  private int repairPrice;
  private int paymentCardDtl;
  private int paymentTransferDtl;
  private int paymentCashDtl;
  private int paymentGoldDtl;
  private String repairDesc;

  public int getRepairDtlSeq() {
    return repairDtlSeq;
  }

  public void setRepairDtlSeq(int repairDtlSeq) {
    this.repairDtlSeq = repairDtlSeq;
  }

  public int getRepairSeq() {
    return repairSeq;
  }

  public void setRepairSeq(int repairSeq) {
    this.repairSeq = repairSeq;
  }

  public String getPrdType() {
    return prdType;
  }

  public void setPrdType(String prdType) {
    this.prdType = prdType;
  }

  public String getKaratage() {
    return karatage;
  }

  public void setKaratage(String karatage) {
    this.karatage = karatage;
  }

  public String getColor() {
    return color;
  }

  public void setColor(String color) {
    this.color = color;
  }

  public Date getReceiptDate() {
    return receiptDate;
  }

  public void setReceiptDate(Date receiptDate) {
    this.receiptDate = receiptDate;
  }

  public Date getFinishDate() {
    return finishDate;
  }

  public void setFinishDate(Date finishDate) {
    this.finishDate = finishDate;
  }

  public String getFinishStatus() {
    return finishStatus;
  }

  public void setFinishStatus(String finishStatus) {
    this.finishStatus = finishStatus;
  }

  public int getRepairPrice() {
    return repairPrice;
  }

  public void setRepairPrice(int repairPrice) {
    this.repairPrice = repairPrice;
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

  public void setPaymentTransferDtl(int paymentTransferDtl) {
    this.paymentTransferDtl = paymentTransferDtl;
  }

  public int getPaymentCashDtl() {
    return paymentCashDtl;
  }

  public void setPaymentCashDtl(int paymentCashDtl) {
    this.paymentCashDtl = paymentCashDtl;
  }

  public String getPrdTypeStr() {
    return prdTypeStr;
  }

  public void setPrdTypeStr(String prdTypeStr) {
    this.prdTypeStr = prdTypeStr;
  }

  public String getKaratageStr() {
    return karatageStr;
  }

  public void setKaratageStr(String karatageStr) {
    this.karatageStr = karatageStr;
  }

  public String getColorStr() {
    return colorStr;
  }

  public void setColorStr(String colorStr) {
    this.colorStr = colorStr;
  }

  public String getRepairDesc() {
    return repairDesc;
  }

  public void setRepairDesc(String repairDesc) {
    this.repairDesc = repairDesc;
  }

  public int getPaymentGoldDtl() {
    return paymentGoldDtl;
  }

  public void setPaymentGoldDtl(int paymentGoldDtl) {
    this.paymentGoldDtl = paymentGoldDtl;
  }

  @Override
  public String toString() {
    return "RepairDtlVO [repairDtlSeq=" + repairDtlSeq + ", repairSeq=" + repairSeq + ", prdType="
        + prdType + ", prdTypeStr=" + prdTypeStr + ", karatage=" + karatage + ", karatageStr="
        + karatageStr + ", color=" + color + ", colorStr=" + colorStr + ", receiptDate="
        + receiptDate + ", finishDate=" + finishDate + ", finishStatus=" + finishStatus
        + ", repairPrice=" + repairPrice + ", paymentCardDtl=" + paymentCardDtl
        + ", paymentTransferDtl=" + paymentTransferDtl + ", paymentCashDtl=" + paymentCashDtl + "]";
  }
  
}
