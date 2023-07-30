package com.ddgold.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddgold.dao.RepairDao;
import com.ddgold.service.RepairService;
import com.ddgold.vo.RepairVO;
import com.ddgold.vo.SalesParamVO;

@Service
public class RepairServiceImpl implements RepairService {

    @Autowired
    RepairDao repairDao;

    public List<RepairVO> getRepairList(SalesParamVO po){
        return repairDao.selectRepairList(po);
    }

    public RepairVO getRepair(int repairSeq){
        return repairDao.selectRepair(repairSeq);
    }

    public int insertRepair(RepairVO po) {
        int res = repairDao.insertRepair(po);
        //영업일지 추가
        //현금일 경우 시재추가
        return res;
    }
    public int updateRepair(RepairVO po){
        int res= repairDao.updateRepair(po);
        return res;
    }
    public int deleteRepair(int repairSeq){
        int res=repairDao.deleteRepair(repairSeq);
        return res;
    }
}
