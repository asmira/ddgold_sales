package com.ddgold.vo;

import java.util.Date;
import java.util.List;

public class RepairVO {
	private int repairSeq;
	private String repairMobile;
	private String repairName;
	private String repairDesc;
	private String repairDesc2;
	private String repairDesc3;
	private String repairDesc4;
	private String repairDesc5;
	private Date repairDate;
	private Date receiptDate;
	private Date finishDate;
	private String hasOrder;
	private List<RepairDtlVO> repairDtlList;
	
	public int getRepairSeq() {
		return repairSeq;
	}
	public void setRepairSeq(int repairSeq) {
		this.repairSeq = repairSeq;
	}
	public String getRepairMobile() {
		return repairMobile;
	}
	public void setRepairMobile(String repairMobile) {
		this.repairMobile = repairMobile;
	}
	public String getRepairName() {
		return repairName;
	}
	public void setRepairName(String repairName) {
		this.repairName = repairName;
	}
	public String getRepairDesc() {
		return repairDesc;
	}
	public void setRepairDesc(String repairDesc) {
		this.repairDesc = repairDesc;
	}
	public String getRepairDesc2() {
		return repairDesc2;
	}
	public void setRepairDesc2(String repairDesc2) {
		this.repairDesc2 = repairDesc2;
	}
	public String getRepairDesc3() {
		return repairDesc3;
	}
	public void setRepairDesc3(String repairDesc3) {
		this.repairDesc3 = repairDesc3;
	}
	public String getRepairDesc4() {
		return repairDesc4;
	}
	public void setRepairDesc4(String repairDesc4) {
		this.repairDesc4 = repairDesc4;
	}
	public String getRepairDesc5() {
		return repairDesc5;
	}
	public void setRepairDesc5(String repairDesc5) {
		this.repairDesc5 = repairDesc5;
	}
	public Date getRepairDate() {
		return repairDate;
	}
	public void setRepairDate(Date repairDate) {
		this.repairDate = repairDate;
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
	public String getHasOrder() {
		return hasOrder;
	}
	public void setHasOrder(String hasOrder) {
		this.hasOrder = hasOrder;
	}
	public List<RepairDtlVO> getRepairDtlList() {
		return repairDtlList;
	}
	public void setRepairDtlList(List<RepairDtlVO> repairDtlList) {
		this.repairDtlList = repairDtlList;
	}
	@Override
	public String toString() {
		return "RepairVO [repairSeq=" + repairSeq + ", repairMobile=" + repairMobile + ", repairName=" + repairName
				+ ", repairDesc=" + repairDesc + ", repairDesc2=" + repairDesc2 + ", repairDesc3=" + repairDesc3
				+ ", repairDesc4=" + repairDesc4 + ", repairDesc5=" + repairDesc5 + ", repairDate=" + repairDate
				+ ", receiptDate=" + receiptDate + ", finishDate=" + finishDate + ", hasOrder=" + hasOrder
				+ ", repairDtlList=" + repairDtlList + "]";
	}
	
}
