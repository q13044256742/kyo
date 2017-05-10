package com.pri.ticket.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pri.ticket.service.CityObject;
import com.pri.ticket.service.Departure;
import com.pri.ticket.service.IStationService;
import com.pri.ticket.service.Station;
import com.pri.ticket.service.StationQuery;
import com.pri.ticket.service.UserObject;

@Controller
@RequestMapping("bus")
public class StationController {

	@Autowired
	@Qualifier("StationServiceImpl")
	IStationService service;

	/**
	 * 获取当前城市下的所有长途汽车站信息
	 * 
	 * @param query
	 * @param model
	 * @return
	 */
	@RequestMapping("showList")
	public String showList(StationQuery query, Model model) {
		List<CityObject> cityList = service.getCityList();
		model.addAttribute("cityList", cityList);
		List<Station> airPlaneList = service.getStationList(query);
		model.addAttribute("resultList", airPlaneList);
		return "stationList.jsp";
	}

	/**
	 * 根据指定车站id获取对应的车次信息
	 * 
	 * @param sid
	 * @return
	 */
	@RequestMapping("getScodeList")
	@ResponseBody
	public List<Departure> getScodeList(String did, String sid) {
		if (did != null && did != "") {
			List<Departure> resultList = service.getDepartureById(did);
			return resultList;
		} else {
			List<Departure> resultList = service.getScodeList(sid);
			return resultList;
		}
	}

	/**
	 * 跳转到管理员后台数据页面
	 * 
	 * @return
	 */
	@RequestMapping("dataManage")
	public String dataManage(Integer type, Model model) {
		StationQuery query = new StationQuery();
		List<Station> stationList = service.getStationList(query);
		List<CityObject> cityList = service.getCityList();
		List<Departure> departureList = service.getDepartureList();
		model.addAttribute("cityList", cityList);
		model.addAttribute("stationList", stationList);
		model.addAttribute("departureList", departureList);
		model.addAttribute("type", type);
		return "dataManage.jsp";
	}

	/**
	 * 跳转到账户信息页面
	 * 
	 * @return
	 */
	@RequestMapping("accountManage")
	public String accountManage() {

		return "accountManage.jsp";
	}

	/**
	 * 获取剩余票数
	 * 
	 * @param query
	 * @return
	 */
	@RequestMapping("getRemainTicket")
	@ResponseBody
	public Integer getRemainTicket(StationQuery query) {
		return 0;
	}

	/**
	 * 用户订票
	 * 
	 * @param query
	 * @return
	 */
	@RequestMapping("reserveTicket")
	@ResponseBody
	public Integer reserveTicket(StationQuery query) {
		return getRemainTicket(query);
	}

	/**
	 * 新增城市信息
	 * 
	 * @param city
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping("addCity")
	public String addCity(CityObject city, Integer type, Model model) {
		service.addCity(city);
		model.addAttribute("type", type);
		return "redirect:/bus/dataManage";
	}

	/**
	 * 删除城市信息
	 * 
	 * @param ids
	 * @param type
	 * @return
	 */
	@RequestMapping("deleteCity")
	public String deleteCity(String[] ids, Integer type, Model model) {
		if (ids != null && ids.length > 0) {
			service.deleteCity(ids);
		}
		model.addAttribute("type", type);
		return "redirect:/bus/dataManage";
	}

	/**
	 * 新增车站信息
	 * 
	 * @return
	 */
	@RequestMapping("addStation")
	public String addStation(Station station, Integer type, Model model) {
		service.addStation(station);
		model.addAttribute("type", type);
		return "redirect:/bus/dataManage";
	}

	/**
	 * 删除车站信息
	 * 
	 * @return
	 */
	@RequestMapping("deleteStation")
	public String deleteStation(String[] ids, Integer type, Model model) {
		if (ids != null && ids.length > 0) {
			service.deleteStation(ids);
		}
		model.addAttribute("type", type);
		return "redirect:/bus/dataManage";
	}

	/**
	 * 添加车次信息
	 */
	@RequestMapping("addDeparture")
	public String addDeparture(Departure departure, Integer type, Model model) {
		service.addDeparture(departure);
		model.addAttribute("type", type);
		return "redirect:/bus/dataManage";
	}

	/**
	 * 删除车次信息
	 * 
	 * @return
	 */
	@RequestMapping("deleteDeparture")
	public String deleteDeparture(String[] ids, Integer type, Model model) {
		if (ids != null && ids.length > 0) {
			service.deleteDeparture(ids);
		}
		model.addAttribute("type", type);
		return "redirect:/bus/dataManage";
	}

	@RequestMapping("orderTicket")
	@ResponseBody
	public void orderTicket(String did) {
		service.orderTicket(did);
	}

	@RequestMapping("userLogin")
	public String userLogin(UserObject user) {
		boolean isExist = service.isExist(user);
		if (isExist)
			return "redirect:/bus/showList";
		return "accountManage.jsp?tip=" + (user.getUsername() == null ? "" : "error");
	}
}
