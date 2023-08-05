package com.ddgold.vo;

public class SalesDtlVO {
	private int salesDtlSeq;
	private int salesSeq;
	private String salesType;
	private String salesTypeStr;
	private String prdType;
	private String prdTypeStr;
	private String karatage;
	private String karatageStr;
	private int buyingPrice;
	private float weight;
	private int laborCost;
	private int dtlPrdPrice;
	private int dtlSalePrice;
	private int diffPrice;

	public int getBuyingPrice() {
		return buyingPrice;
	}
	public void setBuyingPrice(int buyingPrice) {
		this.buyingPrice = buyingPrice;
	}
	public int getDiffPrice() { 
		return diffPrice;
	}
	public void setDiffPrice(int diffPrice) {
		this.diffPrice = diffPrice;
	}

	public int getLaborCost() {
		return laborCost;
	}
	public void setLaborCost(int laborCost) {
		this.laborCost = laborCost;
	}

	public int getSalesDtlSeq() {
		return salesDtlSeq;
	}
	public void setSalesDtlSeq(int salesDtlSeq) {
		this.salesDtlSeq = salesDtlSeq;
	}

	public int getSalesSeq() {
		return salesSeq;
	}

	public String getSalesType() {
		return salesType;
	}

	public String getSalesTypeStr() {
		return salesTypeStr;
	}

	public String getPrdType() {
		return prdType;
	}

	public String getPrdTypeStr() {
		return prdTypeStr;
	}

	public String getKaratage() {
		return karatage;
	}

	public String getKaratageStr() {
		return karatageStr;
	}

	public float getWeight() {
		return weight;
	}

	public int getDtlPrdPrice() {
		return dtlPrdPrice;
	}

	public int getDtlSalePrice() {
		return dtlSalePrice;
	}

	public void setSalesSeq(int salesSeq) {
		this.salesSeq = salesSeq;
	}

	public void setSalesType(String salesType) {
		this.salesType = salesType;
	}

	public void setSalesTypeStr(String salesTypeStr) {
		this.salesTypeStr = salesTypeStr;
	}

	public void setPrdType(String prdType) {
		this.prdType = prdType;
	}

	public void setPrdTypeStr(String prdTypeStr) {
		this.prdTypeStr = prdTypeStr;
	}

	public void setKaratage(String karatage) {
		this.karatage = karatage;
	}

	public void setKaratageStr(String karatageStr) {
		this.karatageStr = karatageStr;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public void setDtlPrdPrice(int dtlPrdPrice) {
		this.dtlPrdPrice = dtlPrdPrice;
	}

	public void setDtlSalePrice(int dtlSalePrice) {
		this.dtlSalePrice = dtlSalePrice;
	}

	@Override
	public String toString() {
		return "SalesDtlVO [salesDtlSeq=" + salesDtlSeq + ", salesSeq=" + salesSeq + ", salesType=" + salesType
				+ ", salesTypeStr=" + salesTypeStr + ", prdType=" + prdType + ", prdTypeStr=" + prdTypeStr
				+ ", karatage=" + karatage + ", karatageStr=" + karatageStr + ", weight=" + weight + ", dtlPrdPrice="
				+ dtlPrdPrice + ", dtlSalePrice=" + dtlSalePrice + "]";
	}

}
