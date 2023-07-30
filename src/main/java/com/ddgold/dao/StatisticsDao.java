package com.ddgold.dao;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddgold.vo.CashOnHandVO;
import com.ddgold.vo.PaymentStatisticsVO;
import com.ddgold.vo.SalesParamVO;
import com.ddgold.vo.SalesVO;
import com.ddgold.vo.StatisticsVO;

@Mapper
public interface StatisticsDao {
	
	List<StatisticsVO> selectDailyKaratStatistics(SalesParamVO po);

	List<StatisticsVO> selectWeekdayKaratStatistics(SalesParamVO po);
	
	List<StatisticsVO> selectMonthlyKaratStatistics(SalesParamVO po);
	
	List<PaymentStatisticsVO> selectDailyPaymentStatistics(SalesParamVO po);
	
	List<PaymentStatisticsVO> selectWeekdayPaymentStatistics(SalesParamVO po);
	
	List<PaymentStatisticsVO> selectMonthlyPaymentStatistics(SalesParamVO po);
}
