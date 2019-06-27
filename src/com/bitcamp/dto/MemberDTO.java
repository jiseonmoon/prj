package com.bitcamp.dto;

public class MemberDTO {
	/*private int mno;
	private String mid;
	private String memail;
	private String mtel;
	private int mtier;

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public int getMtier() {
		return mtier;
	}

	public void setMtier(int mtier) {
		this.mtier = mtier;
	}*/
	
	private int Mno;
	private int Mtier;
	private String Mid;
	private String Mpwd;
	private String email1;
	private String email2;
	private String tel;
	private String addr;
	private String bank;
	private String card;
	
	public int getMno() {
		return Mno;
	}
	public void setMno(int mno) {
		Mno = mno;
	}
	
	public int getMtier() {
		return Mtier;
	}
	public void setMtier(int mtier) {
		Mtier = mtier;
	}
	
	public String getMid() {
		return Mid;
	}
	public void setMid(String mid) {
		Mid = mid;
	}
	
	public String getMpwd() {
		return Mpwd;
	}
	public void setMpwd(String mpwd) {
		Mpwd = mpwd;
	}
	
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	
	public String getEmail2() {
		return email2;
	}
	
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
}
