package com.ddgold.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddgold.vo.CashOnHandVO;
import com.ddgold.vo.SalesParamVO;

@Mapper
public interface CashDao {
	List<CashOnHandVO> selectCashOnHands(SalesParamVO po);
	
	CashOnHandVO selectLastCashOnHand();
	
	int insertCashOnHand(CashOnHandVO param);
	
	int insertLastCashOnHand();

	int updateCashOnHand(CashOnHandVO param);
	
	int deleteCashOnHand(CashOnHandVO param);
}
