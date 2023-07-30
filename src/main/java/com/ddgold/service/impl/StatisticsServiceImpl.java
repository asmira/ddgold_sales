package com.ddgold.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddgold.dao.StatisticsDao;
import com.ddgold.service.StatisticsService;
import com.ddgold.vo.PaymentStatisticsVO;
import com.ddgold.vo.SalesParamVO;
import com.ddgold.vo.StatisticsVO;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Autowired
	StatisticsDao statisticsDao;
	
	@Override
	public List<StatisticsVO> getDailyKaratStatistics(SalesParamVO po) {
		return statisticsDao.selectDailyKaratStatistics(po);
	}

	@Override
	public List<StatisticsVO> getWeekdayKaratStatistics(SalesParamVO po) {
		return statisticsDao.selectWeekdayKaratStatistics(po);
	}

	@Override
	public List<StatisticsVO> getMonthlyKaratStatistics(SalesParamVO po) {
		return statisticsDao.selectMonthlyKaratStatistics(po);
	}

	@Override
	public List<PaymentStatisticsVO> getDailyPaymentStatistics(SalesParamVO po) {
		return statisticsDao.selectDailyPaymentStatistics(po);
	}

	@Override
	public List<PaymentStatisticsVO> getWeekdayPaymentStatistics(SalesParamVO po) {
		return statisticsDao.selectWeekdayPaymentStatistics(po);
	}

	@Override
	public List<PaymentStatisticsVO> getMonthlyPaymentStatistics(SalesParamVO po) {
		return statisticsDao.selectMonthlyPaymentStatistics(po);
	}

}
