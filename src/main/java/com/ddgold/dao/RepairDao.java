package com.ddgold.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ddgold.vo.RepairDtlVO;
import com.ddgold.vo.RepairVO;
import com.ddgold.vo.SalesParamVO;

@Mapper
public interface RepairDao {
    List<RepairVO> selectRepairList(SalesParamVO po);

    RepairVO selectRepair(int repairSeq);

    int insertRepair(RepairVO po);

    int insertRepairDtl(RepairDtlVO po);
    
    int updateRepair(RepairVO po);

    int updateRepairDtl(RepairDtlVO po);
    
    int updateReciept(RepairDtlVO po);
    
    int updateFinish(RepairDtlVO po);
    
    int deleteRepair(int repairSeq);
    
    int deleteRepairDtl(int repairSeq);
}