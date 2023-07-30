package com.ddgold.service;

import java.util.List;

import com.ddgold.vo.RemainVO;
import com.ddgold.vo.SalesParamVO;
import com.ddgold.vo.SalesVO;

public interface SalesService {
	List<SalesVO> getSalesList(SalesParamVO po);
	
	SalesVO getSales(int salesSeq);
	
	List<RemainVO> getSalesRemainList();
	
	int insertSales(SalesVO po);
	
	int deleteSales(int salesSeq);
}
