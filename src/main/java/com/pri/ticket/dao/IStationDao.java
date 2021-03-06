package com.pri.ticket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.pri.ticket.service.CityObject;
import com.pri.ticket.service.Departure;
import com.pri.ticket.service.Station;
import com.pri.ticket.service.StationQuery;
import com.pri.ticket.service.UserObject;

@Repository("IStationDao")
public interface IStationDao {
	public List<Station> getStationList(@Param("query") StationQuery query);

	public void reserveTicket(@Param("query") StationQuery query);

	public void addCity(CityObject city);

	public List<CityObject> getCityList();

	public void deleteCity(@Param("ids") String[] ids);

	public void addStation(Station station);

	public void deleteStation(@Param("ids") String[] ids);

	public List<Departure> getDepartureList();

	public void addDeparture(Departure departure);

	public void deleteDeparture(@Param("ids") String[] ids);

	public List<Departure> getScodeList(@Param("sid") String sid);

	public List<Departure> getDepartureById(@Param("did") String did);

	public void orderTicket(@Param("did") String did, @Param("num") Integer orderNum);

	public Integer isExist(UserObject user);

	public void updateDeparture(Departure departure);

	public void updateInfoById(@Param("type") Integer type, @Param("value") String value, @Param("id") String id);
}
