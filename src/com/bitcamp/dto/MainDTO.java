package com.bitcamp.dto;

import java.util.List;

public class MainDTO {
	private List<SponDTO> pop;
	private List<SponDTO> close;
	private List<SponDTO> newest;
	public MainDTO() {
		super();
	}
	public MainDTO(List<SponDTO> pop, List<SponDTO> close, List<SponDTO> newest) {
		super();
		this.pop = pop;
		this.close = close;
		this.newest = newest;
	}
	public List<SponDTO> getPop() {
		return pop;
	}
	public void setPop(List<SponDTO> pop) {
		this.pop = pop;
	}
	public List<SponDTO> getClose() {
		return close;
	}
	public void setClose(List<SponDTO> close) {
		this.close = close;
	}
	public List<SponDTO> getNewest() {
		return newest;
	}
	public void setNewest(List<SponDTO> newest) {
		this.newest = newest;
	}

	
}
