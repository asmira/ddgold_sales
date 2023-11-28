package com.ddgold.vo;

import java.util.List;

public class OrderVO extends SalesVO {
  private int orderSeq;
  private String name;// 이름
  private String mobile;// 연락처
  private List<OrderDtlVO> orderDtlList;

  public int getOrderSeq() {
    return orderSeq;
  }

  public void setOrderSeq(int orderSeq) {
    this.orderSeq = orderSeq;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getMobile() {
    return mobile;
  }

  public void setMobile(String mobile) {
    this.mobile = mobile;
  }

  public List<OrderDtlVO> getOrderDtlList() {
    return orderDtlList;
  }

  public void setOrderDtlList(List<OrderDtlVO> orderDtlList) {
    this.orderDtlList = orderDtlList;
  }

  @Override
  public String toString() {
    return "OrderVO [orderSeq=" + orderSeq + ", name=" + name + ", mobile=" + mobile
        + ", orderDtlList=" + orderDtlList + ", getRemainTargetSeq()=" + getRemainTargetSeq()
        + ", getRemain()=" + getRemain() + ", getSalesSeq()=" + getSalesSeq() + ", getSalesDt()="
        + getSalesDt() + ", getPrdPrice()=" + getPrdPrice() + ", getSalePrice()=" + getSalePrice()
        + ", getPaymentCardDtl()=" + getPaymentCardDtl() + ", getPaymentTransferDtl()="
        + getPaymentTransferDtl() + ", getPaymentCashDtl()=" + getPaymentCashDtl()
        + ", getPaymentGoldDtl()=" + getPaymentGoldDtl() + ", getPaymentGoodsDtl()="
        + getPaymentGoodsDtl() + ", getDescription()=" + getDescription() + ", getSalesDtlList()="
        + getSalesDtlList() + ", getTotalPayment()=" + getTotalPayment() + ", toString()="
        + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
  }

}
