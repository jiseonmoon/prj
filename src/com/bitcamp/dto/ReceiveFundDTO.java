package com.bitcamp.dto;

import java.util.Date;

public class ReceiveFundDTO {
	private int Sno;
	private String Stitle;
	private String Scontent;
	private int destmoney;
	private int minmoney;
	private Date finaldate;
	private int nowmoney;
	
	public int getSno() {
		return Sno;
	}
	public void setSno(int sno) {
		Sno = sno;
	}
	public String getStitle() {
		return Stitle;
	}
	public void setStitle(String stitle) {
		Stitle = stitle;
	}
	public String getScontent() {
		return Scontent;
	}
	public void setScontent(String scontent) {
		Scontent = scontent;
	}
	public int getDestmoney() {
		return destmoney;
	}
	public void setDestmoney(int destmoney) {
		this.destmoney = destmoney;
	}
	public int getMinmoney() {
		return minmoney;
	}
	public void setMinmoney(int minmoney) {
		this.minmoney = minmoney;
	}
	public Date getFinaldate() {
		return finaldate;
	}
	public void setFinaldate(Date finaldate) {
		this.finaldate = finaldate;
	}
	public int getNowmoney() {
		return nowmoney;
	}
	public void setNowmoney(int nowmoney) {
		this.nowmoney = nowmoney;
	}
	
	
	
}
