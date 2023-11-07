package com.ddgold.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ddgold.dao.CashDao;
import com.ddgold.dao.RepairDao;
import com.ddgold.dao.SalesDao;
import com.ddgold.service.RepairService;
import com.ddgold.vo.CashOnHandVO;
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

  @Autowired
  CashDao cashDao;
  
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
  public int restockRepair(RepairDtlVO po) {
    // 실제 수리장 정보 조회
    RepairVO vo = repairDao.selectRepair(po.getRepairSeq());

    RepairDtlVO curDtl = null;
    // 들어온 수리장 detail 조회
    List<RepairDtlVO> dtls = vo.getRepairDtlList();
    Optional<RepairDtlVO> curDtlOpt = dtls.stream().filter((dtl)-> {
      return dtl.getRepairDtlSeq() == po.getRepairDtlSeq();
    }).findFirst();

    int res = 0;
    if(curDtlOpt.isPresent()) {
      curDtl = curDtlOpt.get();
      Calendar cal = Calendar.getInstance();
      Date repairDate = po.getFinishDate();
      if(repairDate == null) repairDate = cal.getTime();
      
      vo.setRepairDate(repairDate);
      
      //재입고 신규 등록
      vo.setRepairDesc(po.getRepairDesc());
      repairDao.insertRepair(vo);
      curDtl.setRepairSeq(vo.getRepairSeq());
      
      repairDao.insertRepairDtl(curDtl);
      
      //기존 상세 재입고로 변경
      res = repairDao.updateRestock(po);
    }
    
    
    return res;
  }
  
  @Override
  @Transactional
  public int cancelFinish(RepairDtlVO po) {
    return repairDao.cancelFinish(po);
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
      return dtl.getRepairDtlSeq() == po.getRepairDtlSeq();
    }).findFirst();
    
    
    if(curDtlOpt.isPresent()) {
      curDtl = curDtlOpt.get();
    }
    
    // detail이 조회되고, 수리비를 받았을때 영업일지에 추가한다.
    if(curDtlOpt.isPresent() && po.getRepairPrice() > 0) {
      sales.setPaymentCashDtl(po.getPaymentCashDtl());
      sales.setPaymentTransferDtl(po.getPaymentTransferDtl());
      sales.setPaymentCardDtl(po.getPaymentCardDtl());
      sales.setSalePrice(po.getRepairPrice());
      sales.setSalesDt(po.getFinishDate());
      sales.setDescription(vo.getRepairName() + "님 " + curDtl.getPrdTypeStr() + " 수리비");
      saleDao.insertSalesMst(sales);
      
      salesDtl.setSalesSeq(sales.getSalesSeq());
      salesDtl.setSalesType("7");
      salesDtl.setKaratage(curDtl.getKaratage());
      salesDtl.setPrdType(curDtl.getPrdType());
      res = saleDao.insertSalesDtl(salesDtl);
      
      // 현금일 경우 오늘자 수리건은 시재추가
      DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
      Calendar cal = Calendar.getInstance();
      String today = df.format(cal.getTime());
      String finishDt = df.format(po.getFinishDate());
      
      if(finishDt.equals(today) && po.getPaymentCashDtl() > 0) {
        CashOnHandVO cvo = new CashOnHandVO();
        cvo.setCashDt(po.getFinishDate());
        cvo.setCashIncome(po.getPaymentCashDtl());
        cvo.setCashType(vo.getRepairName() + "님 " + curDtl.getPrdTypeStr() + " 수리비");
        
        cashDao.insertCashOnHand(cvo);
      }
    }
    return res;
  }
  
  @Override
  public int deleteRepair(int repairSeq) {
    int res = repairDao.deleteRepairDtl(repairSeq);
    res += repairDao.deleteRepair(repairSeq);
    
    return res;
  }

}
