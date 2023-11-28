package com.ddgold.service;

import java.util.List;
import com.ddgold.vo.OrderDtlVO;
import com.ddgold.vo.OrderVO;
import com.ddgold.vo.SalesParamVO;

public interface OrderService {
    
    public List<OrderVO> getOrderList(SalesParamVO po);

    public OrderVO getOrder(int repairSeq);

    public int insertOrder(OrderVO po);

    public int updateOrder(OrderVO po);
    
    public int receiptOrder(OrderDtlVO po);
    
    public int finishOrder(OrderDtlVO po);

    public int deleteOrder(int repairSeq);

    int restockOrder(OrderDtlVO po);

    int cancelFinish(OrderDtlVO po);
}
