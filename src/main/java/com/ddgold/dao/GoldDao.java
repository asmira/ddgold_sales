package com.ddgold.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddgold.vo.GoldVO;
import com.ddgold.vo.SalesParamVO;

@Mapper
public interface GoldDao {
	
	List<GoldVO> selectGoldMngList(SalesParamVO vo);
	
	GoldVO selectLastGoldMng();
	
	int insertGoldMng(GoldVO vo);
	
	int updateGoldMng(GoldVO vo);
	
	int deleteGoldMng(GoldVO vo);
}
