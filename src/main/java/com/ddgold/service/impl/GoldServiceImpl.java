package com.ddgold.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddgold.dao.GoldDao;
import com.ddgold.service.GoldService;
import com.ddgold.vo.GoldVO;
import com.ddgold.vo.SalesParamVO;

@Service
public class GoldServiceImpl implements GoldService {
	@Autowired
	GoldDao goldDao;
	
	@Override
	public List<GoldVO> getGoldMngList(SalesParamVO vo) {
		return goldDao.selectGoldMngList(vo);
	}

	@Override
	public GoldVO getLastGoldMng() {
		return goldDao.selectLastGoldMng();
	}

	@Override
	public int insertGoldMng(GoldVO vo) {
		return goldDao.insertGoldMng(vo);
	}

	@Override
	public int updateGoldMng(GoldVO vo) {
		return goldDao.updateGoldMng(vo);
	}

	@Override
	public int deleteGoldMng(GoldVO vo) {
		return goldDao.deleteGoldMng(vo);
	}

}
