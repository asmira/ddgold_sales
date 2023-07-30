package com.ddgold.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddgold.service.StatisticsService;
import com.ddgold.vo.PaymentStatisticsVO;
import com.ddgold.vo.SalesParamVO;
import com.ddgold.vo.StatisticsVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class StatisticsController {

	@Autowired
	StatisticsService statisticsService;

	@ResponseBody
	@RequestMapping("/api/statistics/karat/{type}")
	public String statistics(@PathVariable String type, SalesParamVO po) {
		System.out.println(po);
		List<StatisticsVO> statList = null;
		switch (type) {
			case "daily" :
				statList = statisticsService.getDailyKaratStatistics(po);
				break;
			case "weekday" :
				statList = statisticsService.getWeekdayKaratStatistics(po);
				break;
			case "monthly" : 
				statList = statisticsService.getMonthlyKaratStatistics(po);
				break;
		}
		
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		return gson.toJson(statList);
	}

	@ResponseBody
	@RequestMapping("/api/statistics/payment/{type}")
	public String paymentStatistics(@PathVariable String type, SalesParamVO po) {
		System.out.println(po);
		List<PaymentStatisticsVO> statList = null;
		switch (type) {
		case "daily" :
			statList = statisticsService.getDailyPaymentStatistics(po);
			break;
		case "weekday" :
			statList = statisticsService.getWeekdayPaymentStatistics(po);
			break;
		case "monthly" : 
			statList = statisticsService.getMonthlyPaymentStatistics(po);
			break;
		}
		
		Gson gson = new GsonBuilder()
				.serializeNulls()
				.setDateFormat("yyyy-MM-dd")
				.create();
		return gson.toJson(statList);
	}
	
}
