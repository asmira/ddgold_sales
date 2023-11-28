package com.ddgold.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.ddgold.vo.OrderVO;
import com.ddgold.vo.RemainVO;
import com.ddgold.vo.SalesDtlVO;
import com.ddgold.vo.SalesParamVO;
import com.ddgold.vo.SalesVO;

@Mapper
public interface OrderDao {
	List<OrderVO> selectOrderList(SalesParamVO po);
	
	OrderVO selectOrder(int orderSeq);
}
