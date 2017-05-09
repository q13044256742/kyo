package com.pri.ticket.service;

import java.util.List;

public interface IStationService {
	
	public List<Station> getStationList(StationQuery query);

	public void reserveTicket(StationQuery query);

	public void addCity(CityObject city);

	public List<CityObject> getCityList();

	public void deleteCity(String[] ids);

	public void addStation(Station station);

	public void deleteStation(String[] ids);

	public List<Departure> getDepartureList();

	public void addDeparture(Departure departure);

	public void deleteDeparture(String[] ids);

	public List<Departure> getScodeList(String sid);

	public List<Departure> getDepartureById(String did);

	public void orderTicket(String did);

	public boolean isExist(UserObject user);
	
}
