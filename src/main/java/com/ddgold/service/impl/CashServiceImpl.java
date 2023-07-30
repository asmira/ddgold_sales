package com.ddgold.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddgold.dao.CashDao;
import com.ddgold.service.CashService;
import com.ddgold.vo.CashOnHandVO;
import com.ddgold.vo.SalesParamVO;

@Service
public class CashServiceImpl implements CashService {

	@Autowired
	CashDao cashDao;
	
	@Override
	public List<CashOnHandVO> getCashOnHandList(SalesParamVO po) {
		return cashDao.selectCashOnHands(po);
	}

	@Override
	public int insertCashOnHand(CashOnHandVO param) {
		return cashDao.insertCashOnHand(param);
	}

	@Override
	public int updateCashOnHand(CashOnHandVO param) {
		return cashDao.updateCashOnHand(param);
	}

	@Override
	public int deleteCashOnHand(CashOnHandVO param) {
		return cashDao.deleteCashOnHand(param);
	}

	@Override
	public CashOnHandVO getLastDateCashOnHand() {
		return cashDao.selectLastCashOnHand();
	}

	@Override
	public int insertLastCashOnHand() {
		return cashDao.insertLastCashOnHand();
	}

	@Override
	public int deleteLastCashOnHand() {
		CashOnHandVO last =  cashDao.selectLastCashOnHand();
		if("전일시재".equals(last.getCashType())) {
			return cashDao.deleteCashOnHand(last);
		}
		return 0;
	}

}
