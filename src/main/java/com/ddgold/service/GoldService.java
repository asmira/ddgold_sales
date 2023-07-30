package com.ddgold.service;

import java.util.List;

import com.ddgold.vo.GoldVO;
import com.ddgold.vo.SalesParamVO;

public interface GoldService {
	
	List<GoldVO> getGoldMngList(SalesParamVO vo);
	
	GoldVO getLastGoldMng();
	
	int insertGoldMng(GoldVO vo);
	
	int updateGoldMng(GoldVO vo);
	
	int deleteGoldMng(GoldVO vo);
}
