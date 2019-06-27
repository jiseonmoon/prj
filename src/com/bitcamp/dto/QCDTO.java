package com.bitcamp.dto;


public class QCDTO {
	private int qcno;
	private String qccontent;
	private int boardno;
	private String mid;
	
	public QCDTO() {
		super();
	}

	public QCDTO(int qcno, String qccontent, int boardno, String mid) {
		super();
		this.qcno = qcno;
		this.qccontent = qccontent;
		this.boardno = boardno;
		this.mid = mid;
	}

	public int getQcno() {
		return qcno;
	}

	public void setQcno(int qcno) {
		this.qcno = qcno;
	}

	public String getQccontent() {
		return qccontent;
	}

	public void setQccontent(String qccontent) {
		this.qccontent = qccontent;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}
	
}
