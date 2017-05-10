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
	//05.10新增字段
	private String dStartName;//起始车站
	private String dTheWayName;//途经站名
	private String[] dTheWayNameArray;
	private String dTheWayTime;//途经时间
	private String[] dTheWayTimeArray;
	private String dTakePrice;//价格
	private String[] dTakePriceArray;
	private String dType;//车型
	private String[] dTypeArray;
	private String dDistance;//距离
	private String[] dDistanceArray;
	
	public String[] getdTheWayNameArray() {
		return dTheWayNameArray;
	}

	public void setdTheWayNameArray(String[] dTheWayNameArray) {
		String dTheWayNameArrayStr = "";
		for (int i = 0; i < dTheWayNameArray.length; i++) {
			if(i != 0) dTheWayNameArrayStr += "&";
			dTheWayNameArrayStr += dTheWayNameArray[i];
		}
		this.dTheWayName = dTheWayNameArrayStr;
	}

	public String[] getdTheWayTimeArray() {
		return dTheWayTimeArray;
	}

	public void setdTheWayTimeArray(String[] dTheWayTimeArray) {
		String dTheWayTimeArrayStr = "";
		for (int i = 0; i < dTheWayTimeArray.length; i++) {
			if(i != 0) dTheWayTimeArrayStr += "&";
			dTheWayTimeArrayStr += dTheWayTimeArray[i];
		}
		this.dTheWayTime = dTheWayTimeArrayStr;
	}

	public String[] getdTakePriceArray() {
		return dTakePriceArray;
	}

	public void setdTakePriceArray(String[] dTakePriceArray) {
		String dTakePriceArrayStr = "";
		for (int i = 0; i < dTakePriceArray.length; i++) {
			if(i != 0) dTakePriceArrayStr += "&";
			dTakePriceArrayStr += dTakePriceArray[i];
		}
		this.dTakePrice = dTakePriceArrayStr;
	}

	public String[] getdTypeArray() {
		return dTypeArray;
	}

	public void setdTypeArray(String[] dTypeArray) {
		String dTypeArrayStr = "";
		for (int i = 0; i < dTypeArray.length; i++) {
			if(i != 0) dTypeArrayStr += "&";
			dTypeArrayStr += dTypeArray[i];
		}
		this.dType = dTypeArrayStr;
	}

	public String[] getdDistanceArray() {
		return dDistanceArray;
	}

	public void setdDistanceArray(String[] dDistanceArray) {
		String dDistanceArrayStr = "";
		for (int i = 0; i < dDistanceArray.length; i++) {
			if(i != 0) dDistanceArrayStr += "&";
			dDistanceArrayStr += dDistanceArray[i];
		}
		this.dDistance = dDistanceArrayStr;
	}

	public String getdStartName() {
		return dStartName;
	}

	public void setdStartName(String dStartName) {
		this.dStartName = dStartName;
	}

	public String getdTheWayName() {
		return dTheWayName;
	}

	public void setdTheWayName(String dTheWayName) {
		this.dTheWayName = dTheWayName;
	}

	public String getdTheWayTime() {
		return dTheWayTime;
	}

	public void setdTheWayTime(String dTheWayTime) {
		this.dTheWayTime = dTheWayTime;
	}

	public String getdTakePrice() {
		return dTakePrice;
	}

	public void setdTakePrice(String dTakePrice) {
		this.dTakePrice = dTakePrice;
	}

	public String getdType() {
		return dType;
	}

	public void setdType(String dType) {
		this.dType = dType;
	}

	public String getdDistance() {
		return dDistance;
	}

	public void setdDistance(String dDistance) {
		this.dDistance = dDistance;
	}

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
