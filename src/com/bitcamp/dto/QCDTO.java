package com.bitcamp.dto;

public class QCDTO {

	private int qcno;
	private int qano;
	private String mid;
	private String qccontent;
	
	public QCDTO() {
		super();
	}

	public QCDTO(int qcno, int qano, String mid, String qccontent) {
		super();
		this.qcno = qcno;
		this.qano = qano;
		this.mid = mid;
		this.qccontent = qccontent;
	}

	public int getQcno() {
		return qcno;
	}

	public void setQcno(int qcno) {
		this.qcno = qcno;
	}

	public int getQano() {
		return qano;
	}

	public void setQano(int qano) {
		this.qano = qano;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getQccontent() {
		return qccontent;
	}

	public void setQccontent(String qccontent) {
		this.qccontent = qccontent;
	}
}
