package com.pri.ticket.service;

import java.util.Date;

public class StationQuery {
	private Date searchStartTime;
	private Date searchEndTime;
	private String searchCityId;
	
	public Date getSearchStartTime() {
		return searchStartTime;
	}
	public void setSearchStartTime(Date searchStartTime) {
		this.searchStartTime = searchStartTime;
	}
	public Date getSearchEndTime() {
		return searchEndTime;
	}
	public void setSearchEndTime(Date searchEndTime) {
		this.searchEndTime = searchEndTime;
	}
	public String getSearchCityId() {
		return searchCityId;
	}
	public void setSearchCityId(String searchCityId) {
		this.searchCityId = searchCityId;
	}
	
}
