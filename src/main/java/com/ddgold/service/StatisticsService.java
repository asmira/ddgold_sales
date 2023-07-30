package com.ddgold.service;

import java.util.List;

import com.ddgold.vo.PaymentStatisticsVO;
import com.ddgold.vo.SalesParamVO;
import com.ddgold.vo.StatisticsVO;

public interface StatisticsService {
	List<StatisticsVO> getDailyKaratStatistics(SalesParamVO po);

	List<StatisticsVO> getWeekdayKaratStatistics(SalesParamVO po);
	
	List<StatisticsVO> getMonthlyKaratStatistics(SalesParamVO po);

	List<PaymentStatisticsVO> getDailyPaymentStatistics(SalesParamVO po);
	
	List<PaymentStatisticsVO> getWeekdayPaymentStatistics(SalesParamVO po);
	
	List<PaymentStatisticsVO> getMonthlyPaymentStatistics(SalesParamVO po);
}
