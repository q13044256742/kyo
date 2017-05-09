package com.pri.ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pri.ticket.dao.IStationDao;
import com.pri.ticket.service.CityObject;
import com.pri.ticket.service.Departure;
import com.pri.ticket.service.IStationService;
import com.pri.ticket.service.Station;
import com.pri.ticket.service.StationQuery;
import com.pri.ticket.service.UserObject;

@Service("StationServiceImpl")
public class StationServiceImpl implements IStationService {

	@Autowired
	@Qualifier("IStationDao")
	IStationDao airPlaneDao;

	public List<Station> getStationList(StationQuery query) {
		return airPlaneDao.getStationList(query);
	}

	public void reserveTicket(StationQuery query) {
		airPlaneDao.reserveTicket(query);
	}

	public void addCity(CityObject city) {
		airPlaneDao.addCity(city);
	}

	public List<CityObject> getCityList() {
		return airPlaneDao.getCityList();
	}

	public void deleteCity(String[] ids) {
		airPlaneDao.deleteCity(ids);
	}

	public void addStation(Station station) {
		airPlaneDao.addStation(station);
	}

	public void deleteStation(String[] ids) {
		airPlaneDao.deleteStation(ids);
	}

	public List<Departure> getDepartureList() {
		return airPlaneDao.getDepartureList();
	}

	public void addDeparture(Departure departure) {
		airPlaneDao.addDeparture(departure);
	}

	public void deleteDeparture(String[] ids) {
		airPlaneDao.deleteDeparture(ids);
	}

	public List<Departure> getScodeList(String sid) {
		return airPlaneDao.getScodeList(sid);
	}

	public List<Departure> getDepartureById(String did) {
		return airPlaneDao.getDepartureById(did);
	}

	public void orderTicket(String did) {
		airPlaneDao.orderTicket(did);
	}

	public boolean isExist(UserObject user) {
		return airPlaneDao.isExist(user)>0?true:false;
	}

}
