package com.ddgold.vo;

public class CodeVO {
	private int codeSeq;
	private String codeGrp;
	private String codeVal;
	private String codeDesc;
	public int getCodeSeq() {
		return codeSeq;
	}
	public String getCodeGrp() {
		return codeGrp;
	}
	public String getCodeVal() {
		return codeVal;
	}
	public String getCodeDesc() {
		return codeDesc;
	}
	public void setCodeSeq(int codeSeq) {
		this.codeSeq = codeSeq;
	}
	public void setCodeGrp(String codeGrp) {
		this.codeGrp = codeGrp;
	}
	public void setCodeVal(String codeVal) {
		this.codeVal = codeVal;
	}
	public void setCodeDesc(String codeDesc) {
		this.codeDesc = codeDesc;
	}
	@Override
	public String toString() {
		return "CodeVO [codeSeq=" + codeSeq + ", codeGrp=" + codeGrp + ", codeVal=" + codeVal + ", codeDesc=" + codeDesc
				+ "]";
	}
}
