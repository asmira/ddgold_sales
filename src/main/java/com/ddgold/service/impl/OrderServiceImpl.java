package com.ddgold.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ddgold.dao.OrderDao;
import com.ddgold.service.OrderService;
import com.ddgold.vo.OrderDtlVO;
import com.ddgold.vo.OrderVO;
import com.ddgold.vo.SalesParamVO;

@Service
public class OrderServiceImpl implements OrderService {

  @Autowired
  OrderDao orderDao;
  
  @Override
  public List<OrderVO> getOrderList(SalesParamVO po) {
    return orderDao.selectOrderList(po);
  }
  
  @Override
  public OrderVO getOrder(int orderSeq) {
    return orderDao.selectOrder(orderSeq);
  }

  @Override
  public int insertOrder(OrderVO po) {
    return 0;
  }

  @Override
  public int updateOrder(OrderVO po) {
    return 0;
  }

  @Override
  public int receiptOrder(OrderDtlVO po) {
    return 0;
  }

  @Override
  public int finishOrder(OrderDtlVO po) {
    return 0;
  }

  @Override
  public int deleteOrder(int repairSeq) {
    return 0;
  }

  @Override
  public int restockOrder(OrderDtlVO po) {
    return 0;
  }

  @Override
  public int cancelFinish(OrderDtlVO po) {
    return 0;
  }

}
