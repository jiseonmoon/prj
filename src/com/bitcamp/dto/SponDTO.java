package com.bitcamp.dto;

public class SponDTO {
	private int boardno;
	private String boardtitle;
	private String boardcontent;
	private String boardtag;
	private int writerno;
	private String boardwriter;
	private int destmoney;
	private int minmoney;
	private String finaldate;
	private String imagepath;
	private int nowmoney;
	private int bankno;
	public SponDTO(int boardno, String boardtitle, String boardcontent, String boardtag, int writerno,
			String boardwriter ,int destmoney, int minmoney, String finaldate, String imagepath, int nowmoney, int bankno) {
		super();
		this.boardno = boardno;
		this.boardtitle = boardtitle;
		this.boardcontent = boardcontent;
		this.boardtag = boardtag;
		this.writerno = writerno;
		this.boardwriter = boardwriter;
		this.destmoney = destmoney;
		this.minmoney = minmoney;
		this.finaldate = finaldate;
		this.imagepath = imagepath;
		this.nowmoney = nowmoney;
		this.bankno = bankno;
	}
	public SponDTO() {
		super();
	} 
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public String getBoardtag() {
		return boardtag;
	}
	public void setBoardtag(String boardtag) {
		this.boardtag = boardtag;
	}
	public int getWriterno() {
		return writerno;
	}
	public void setWriterno(int writerno) {
		this.writerno = writerno;
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
	public String getFinaldate() {
		return finaldate;
	}
	public void setFinaldate(String finaldate) {
		this.finaldate = finaldate;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public int getNowmoney() {
		return nowmoney;
	}
	public void setNowmoney(int nowmoney) {
		this.nowmoney = nowmoney;
	}
	public String getBoardwriter() {
		return boardwriter;
	}
	public void setBoardwriter(String boardwriter) {
		this.boardwriter = boardwriter;
	}
	
	public int getBankno() {
		return bankno;
	}
	public void setBankno(int bankno) {
		this.bankno = bankno;
	}
	@Override
	public String toString() {
		return "SponDTO [boardno=" + boardno + ", boardtitle=" + boardtitle + ", boardcontent=" + boardcontent
				+ ", boardtag=" + boardtag + ", writerno=" + writerno + ", boardwriter=" + boardwriter + ", destmoney="
				+ destmoney + ", minmoney=" + minmoney + ", finaldate=" + finaldate + ", imagepath=" + imagepath
				+ ", nowmoney=" + nowmoney + ", bankno=" + bankno + "]";
	}
	
	
}
