package com.ddgold.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddgold.vo.RemainVO;
import com.ddgold.vo.SalesDtlVO;
import com.ddgold.vo.SalesParamVO;
import com.ddgold.vo.SalesVO;

@Mapper
public interface SalesDao {
	List<SalesVO> selectSalesList(SalesParamVO po);
	
	SalesVO selectSales(int salesSeq);
	
	int insertSalesMst(SalesVO po);
	
	int insertSalesDtl(SalesDtlVO po);
	
	int updateSalesMst(SalesVO po);

	int deleteSalesMst(int salesSeq);
	
	int deleteSalesDtls(int salesSeq);
	
	int deleteSalesDtl(int salesDtlSeq);
	
	List<RemainVO> selectRemainSalesList();
	
	RemainVO selectRemainPayment(RemainVO po);

	int insertRemainSalesPayment(RemainVO po);

	int payRemainSalesPayment(RemainVO po);

	int deleteRemainSalesPayment(int salesSeq);
}
