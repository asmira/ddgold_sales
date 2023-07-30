package com.ddgold.service;

import java.util.List;

import com.ddgold.vo.CashOnHandVO;
import com.ddgold.vo.SalesParamVO;

public interface CashService {
	List<CashOnHandVO> getCashOnHandList(SalesParamVO po);
	
	CashOnHandVO getLastDateCashOnHand();
	
	int insertCashOnHand(CashOnHandVO param);
	
	int insertLastCashOnHand();

	int updateCashOnHand(CashOnHandVO param);
	
	int deleteCashOnHand(CashOnHandVO param);
	
	int deleteLastCashOnHand();
}
