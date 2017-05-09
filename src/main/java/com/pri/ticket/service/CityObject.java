package com.pri.ticket.service;

public class CityObject {
	private String cId;//城市ID
	private String cName;//城市名
	private Integer pId;//所属省
	private Integer cTid;//所属市
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public Integer getcTid() {
		return cTid;
	}
	public void setcTid(Integer cTid) {
		this.cTid = cTid;
	}
	
}
