package com.ddgold.service;

import java.util.List;
import com.ddgold.vo.RepairDtlVO;
import com.ddgold.vo.RepairVO;
import com.ddgold.vo.SalesParamVO;

public interface RepairService {
    
    public List<RepairVO> getRepairList(SalesParamVO po);

    public RepairVO getRepair(int repairSeq);

    public int insertRepair(RepairVO po);

    public int updateRepair(RepairVO po);
    
    public int receiptRepair(RepairDtlVO po);
    
    public int finishRepair(RepairDtlVO po);

    public int deleteRepair(int repairSeq);
}
