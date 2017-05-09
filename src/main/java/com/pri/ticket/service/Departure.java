package com.pri.ticket.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 车次信息
 * 
 * @author Administrator
 */
public class Departure {
	private String dId;
	private String cId;
	private String cName;
	private String dCode;
	private Date dStartTime;
	private Date dEndTime;
	private Integer dTicket;
	private String dStartTimeStr;
	private String dEndTimeStr;

	public Date getdStartTime() {
		return dStartTime;
	}

	public void setdStartTime(Date dStartTime) {
		this.dStartTime = dStartTime;
	}

	public Date getdEndTime() {
		return dEndTime;
	}

	public void setdEndTime(Date dEndTime) {
		this.dEndTime = dEndTime;
	}

	public String getdStartTimeStr() {
		return dStartTimeStr;
	}

	public void setdStartTimeStr(String dStartTimeStr) {
		if (dStartTimeStr != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			try {
				this.dStartTime = sdf.parse(dStartTimeStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		this.dStartTimeStr = dStartTimeStr;
	}

	public String getdEndTimeStr() {
		return dEndTimeStr;
	}

	public void setdEndTimeStr(String dEndTimeStr) {
		if (dEndTimeStr != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			try {
				this.dEndTime = sdf.parse(dEndTimeStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		this.dEndTimeStr = dEndTimeStr;
	}

	public String getdId() {
		return dId;
	}

	public void setdId(String dId) {
		this.dId = dId;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getdCode() {
		return dCode;
	}

	public void setdCode(String dCode) {
		this.dCode = dCode;
	}

	public Integer getdTicket() {
		return dTicket;
	}

	public void setdTicket(Integer dTicket) {
		this.dTicket = dTicket;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

}
