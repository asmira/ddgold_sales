package com.ddgold.service.impl;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ddgold.dao.RepairDao;
import com.ddgold.dao.SalesDao;
import com.ddgold.service.RepairService;
import com.ddgold.vo.RepairDtlVO;
import com.ddgold.vo.RepairVO;
import com.ddgold.vo.SalesDtlVO;
import com.ddgold.vo.SalesParamVO;
import com.ddgold.vo.SalesVO;

@Service
public class RepairServiceImpl implements RepairService {

  @Autowired
  RepairDao repairDao;

  @Autowired
  SalesDao saleDao;

  @Override
  public List<RepairVO> getRepairList(SalesParamVO po) {
    return repairDao.selectRepairList(po);
  }

  @Override
  public RepairVO getRepair(int repairSeq) {
    return repairDao.selectRepair(repairSeq);
  }

  @Override
  @Transactional
  public int insertRepair(RepairVO po) {
    int res = repairDao.insertRepair(po);
    
    List<RepairDtlVO> dtlList = po.getRepairDtlList();
    
    for(RepairDtlVO dtl : dtlList) {
      dtl.setRepairSeq(po.getRepairSeq());
      res += repairDao.insertRepairDtl(dtl);
    }
    return res;
  }

  @Override
  @Transactional
  public int updateRepair(RepairVO po) {
    int res = repairDao.updateRepair(po);
    
    List<RepairDtlVO> dtlList = po.getRepairDtlList();
    for(RepairDtlVO dtl : dtlList) {
      res += repairDao.updateRepairDtl(dtl);
    }
    return res;
  }

  @Override
  public int receiptRepair(RepairDtlVO po) {
    return repairDao.updateReciept(po);
  }
  
  @Override
  @Transactional
  public int finishRepair(RepairDtlVO po) {
    int res = repairDao.updateFinish(po);
    
    // 영업일지 추가 => updateFinish로 이전
    SalesVO sales = new SalesVO();
    SalesDtlVO salesDtl = new SalesDtlVO();
    
    
    // 실제 수리장 정보 조회
    RepairVO vo = repairDao.selectRepair(po.getRepairSeq());
    
    RepairDtlVO curDtl = null;
    // 들어온 수리장 detail 조회
    List<RepairDtlVO> dtls = vo.getRepairDtlList();
    Optional<RepairDtlVO> curDtlOpt = dtls.stream().filter((dtl)-> {
      return dtl.getRepairDtlSeq() == po.getRepairPrice();
    }).findFirst();
    
    if(curDtlOpt.isPresent()) {
      curDtl = curDtlOpt.get();
    }
    
    // detail이 조회되면 영업일지에 추가한다.
    if(curDtlOpt.isPresent()) {
      sales.setPaymentCashDtl(po.getPaymentCashDtl());
      sales.setPaymentTransferDtl(po.getPaymentTransferDtl());
      sales.setPaymentCardDtl(po.getPaymentCardDtl());
      sales.setSalePrice(po.getRepairPrice());
      sales.setSalesDt(po.getFinishDate());
      saleDao.insertSalesMst(sales);
      
      salesDtl.setSalesSeq(sales.getSalesSeq());
      salesDtl.setKaratage(curDtl.getKaratage());
      salesDtl.setPrdType(curDtl.getPrdType());
      saleDao.insertSalesDtl(salesDtl);
    }
    // 현금일 경우 시재추가
    return res;
  }
  
  @Override
  public int deleteRepair(int repairSeq) {
    int res = repairDao.deleteRepairDtl(repairSeq);
    res += repairDao.deleteRepair(repairSeq);
    
    return res;
  }

}
