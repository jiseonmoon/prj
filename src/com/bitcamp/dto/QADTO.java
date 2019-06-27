package com.bitcamp.dto;

import java.util.Date;

public class QADTO {
	
	private int qano;
	private String category;
	private int mno;
	private String mid;
	private String title;
	private String secret;
	private String content;
	private Date date;
	private int mtier;
	
	public QADTO() {
		super();
	}

	public QADTO(int qano, String category, int mno, String mid, String title, String secret, String content,
			Date date, int mtier) {
		super();
		this.qano = qano;
		this.category = category;
		this.mno = mno;
		this.mid = mid;
		this.title = title;
		this.secret = secret;
		this.content = content;
		this.date = date;
		this.mtier = mtier;
	}

	public int getQano() {
		return qano;
	}

	public void setQano(int qano) {
		this.qano = qano;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getMtier() {
		return mtier;
	}

	public void setMtier(int mtier) {
		this.mtier = mtier;
	}
	
	

}
