package com.bitcamp.dto;

import java.util.Date;

public class GiveFundDTO {
	private int Sno;
	private String Stitle;
	private String Scontent;
	private Date Pdate;
	private int Pmoney;

	
	public String getScontent() {
		return Scontent;
	}
	public void setScontent(String scontent) {
		Scontent = scontent;
	}
	
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
	public Date getPdate() {
		return Pdate;
	}
	public void setPdate(Date pdate) {
		Pdate = pdate;
	}
	public int getPmoney() {
		return Pmoney;
	}
	public void setPmoney(int pmoney) {
		Pmoney = pmoney;
	}
	
}
