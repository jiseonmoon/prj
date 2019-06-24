package com.bitcamp.dto;

public class PageDTO {
	private int pagepercount;
	private int totalcount;
	private int totalpage;
	private int startrow;
	private int endrow;
	private int blocksize;
	private int startblock;
	private int endblock;
	private int currpage;
	public PageDTO(int pagepercount, int totalcount, int totalpage, int startrow, int endrow, int blocksize,
			int startblock, int endblock, int currpage) {
		super();
		this.pagepercount = pagepercount;
		this.totalcount = totalcount;
		this.totalpage = totalpage;
		this.startrow = startrow;
		this.endrow = endrow;
		this.blocksize = blocksize;
		this.startblock = startblock;
		this.endblock = endblock;
		this.currpage = currpage;
	}
	public PageDTO(){
		super();
	}
	public int getPagepercount() {
		return pagepercount;
	}
	public void setPagepercount(int pagepercount) {
		this.pagepercount = pagepercount;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public int getBlocksize() {
		return blocksize;
	}
	public void setBlocksize(int blocksize) {
		this.blocksize = blocksize;
	}
	public int getStartblock() {
		return startblock;
	}
	public void setStartblock(int startblock) {
		this.startblock = startblock;
	}
	public int getEndblock() {
		return endblock;
	}
	public void setEndblock(int endblock) {
		this.endblock = endblock;
	}
	public int getCurrpage() {
		return currpage;
	}
	public void setCurrpage(int currpage) {
		this.currpage = currpage;
	}
	@Override
	public String toString() {
		return "PageDTO [pagepercount=" + pagepercount + ", totalcount=" + totalcount + ", totalpage=" + totalpage
				+ ", startrow=" + startrow + ", endrow=" + endrow + ", blocksize=" + blocksize + ", startblock="
				+ startblock + ", endblock=" + endblock + ", currpage=" + currpage + "]";
	}
	
}
