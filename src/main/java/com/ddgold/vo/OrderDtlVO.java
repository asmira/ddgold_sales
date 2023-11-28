package com.ddgold.vo;

import java.util.Date;

public class OrderDtlVO extends SalesDtlVO {
  private int orderDtlSeq;
  private int orderSeq;
  private Date receiptDate; // 수령일
  private Date finishDate; // 전달일
  private String finishStatus;

  public int getOrderDtlSeq() {
    return orderDtlSeq;
  }

  public void setOrderDtlSeq(int orderDtlSeq) {
    this.orderDtlSeq = orderDtlSeq;
  }

  public int getOrderSeq() {
    return orderSeq;
  }

  public void setOrderSeq(int orderSeq) {
    this.orderSeq = orderSeq;
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

  @Override
  public String toString() {
    return "OrderDtlVO [orderDtlSeq=" + orderDtlSeq + ", orderSeq=" + orderSeq + ", receiptDate="
        + receiptDate + ", finishDate=" + finishDate + ", finishStatus=" + finishStatus
        + ", getBuyingPrice()=" + getBuyingPrice() + ", getDiffPrice()=" + getDiffPrice()
        + ", getLaborCost()=" + getLaborCost() + ", getSalesDtlSeq()=" + getSalesDtlSeq()
        + ", getSalesSeq()=" + getSalesSeq() + ", getSalesType()=" + getSalesType()
        + ", getSalesTypeStr()=" + getSalesTypeStr() + ", getPrdType()=" + getPrdType()
        + ", getPrdTypeStr()=" + getPrdTypeStr() + ", getKaratage()=" + getKaratage()
        + ", getKaratageStr()=" + getKaratageStr() + ", getWeight()=" + getWeight()
        + ", getDtlPrdPrice()=" + getDtlPrdPrice() + ", getDtlSalePrice()=" + getDtlSalePrice()
        + ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()="
        + hashCode() + "]";
  }


}
