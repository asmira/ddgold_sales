package com.ddgold.service.impl;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ddgold.dao.CashDao;
import com.ddgold.dao.CodeDao;
import com.ddgold.dao.SalesDao;
import com.ddgold.service.SalesService;
import com.ddgold.vo.CashOnHandVO;
import com.ddgold.vo.CodeVO;
import com.ddgold.vo.RemainVO;
import com.ddgold.vo.SalesDtlVO;
import com.ddgold.vo.SalesParamVO;
import com.ddgold.vo.SalesVO;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	SalesDao salesDao;

	@Autowired
	CodeDao codeDao;

	@Autowired
	CashDao cashDao;
	
	@Override
	public List<SalesVO> getSalesList(SalesParamVO po) {
		return salesDao.selectSalesList(po);
	}

	@Override
	public SalesVO getSales(int salesSeq) {
		return salesDao.selectSales(salesSeq);
	}
	
	@Override
	public List<RemainVO> getSalesRemainList() {
		return salesDao.selectRemainSalesList();
	}

	@Override
	@Transactional
	public int insertSales(SalesVO po) {
		
		int cnt = salesDao.insertSalesMst(po);
		
		List<SalesDtlVO> dtlList = po.getSalesDtlList();
		for(SalesDtlVO dtl : dtlList) {
			dtl.setSalesSeq(po.getSalesSeq());
			cnt += salesDao.insertSalesDtl(dtl);
		}
		
		int totalPayment = po.getTotalPayment();
		boolean isRemainPayment = po.getSalesDtlList() != null 
				&& po.getSalesDtlList().size() > 0
				&& "6".equals(po.getSalesDtlList().get(0).getSalesType());
		
		// 잔고처리
		if(isRemainPayment) {
			RemainVO rvo = new RemainVO();
			rvo.setSalesSeq(po.getRemainTargetSeq());
			rvo.setRemainSalesDt(po.getSalesDt());
			rvo.setRemainSalesSeq(po.getSalesSeq());
			rvo.setRemainPaymentAmt(totalPayment);
			rvo.setRemainAmt(totalPayment);
			salesDao.payRemainSalesPayment(rvo);

			// 기존 판매액 업데이트
			SalesVO tvo = salesDao.selectSales(po.getRemainTargetSeq());
			SalesVO uvo = new SalesVO();
			uvo.setSalesSeq(po.getRemainTargetSeq());
			uvo.setSalePrice(tvo.getTotalPayment() + totalPayment);
			salesDao.updateSalesMst(uvo);

		} else if(po.getSalePrice()-totalPayment > 0) {
			// 잔고등록
			RemainVO rvo = new RemainVO();
			rvo.setSalesSeq(po.getSalesSeq());
			rvo.setSalesDt(po.getSalesDt());
			rvo.setRemainAmt(po.getSalePrice()-totalPayment);
			
			salesDao.insertRemainSalesPayment(rvo);
		}

		// 자동 시재등록
		if(po.getPaymentCashDtl() > 0) {
			String title = "";
			
			if(isRemainPayment) {
				title="잔고";
			} else {
				Map<String, List<SalesDtlVO>> res = po.getSalesDtlList().stream().collect(Collectors.groupingBy(SalesDtlVO::getPrdType));
				Iterator<String> itor = res.keySet().iterator();
				
				while(itor.hasNext()) {
					String prdType =itor.next();
					List<SalesDtlVO> result = res.get(prdType);
					CodeVO cvo = new CodeVO();
					cvo.setCodeGrp("prd_type");
					cvo.setCodeVal(prdType);
					CodeVO c = codeDao.selectCode(cvo);
					title += c.getCodeDesc() + ((result.size() > 1)?String.valueOf(result.size()):"");
					title = itor.hasNext()?title +",":title;
				}
			}
			CashOnHandVO cashVO = new CashOnHandVO();
			cashVO.setCashDt(new Date());
			cashVO.setCashType(title);
			cashVO.setCashIncome(po.getPaymentCashDtl());
			cashDao.insertCashOnHand(cashVO);
		}
		
		return cnt;
	}

	@Override
	@Transactional
	public int updateSales(SalesVO po) {
		int cnt = 0;
		// update mst
		cnt += salesDao.updateSalesMst(po);

		// delete dtl
		cnt += salesDao.deleteSalesDtls(po.getSalesSeq());
		// insert dtl
		List<SalesDtlVO> dtlList = po.getSalesDtlList();
		for(SalesDtlVO dtl : dtlList) {
			dtl.setSalesSeq(po.getSalesSeq());
			cnt += salesDao.insertSalesDtl(dtl);
		}

		// update or delete and insert remain
		int totalPayment = po.getTotalPayment();
		boolean isRemainPayment = po.getSalesDtlList() != null 
				&& po.getSalesDtlList().size() > 0
				&& "6".equals(po.getSalesDtlList().get(0).getSalesType());
		
		// 잔고처리
		if(isRemainPayment) {
			RemainVO rvo = new RemainVO();
			rvo.setSalesSeq(po.getRemainTargetSeq());
			rvo.setRemainSalesDt(po.getSalesDt());
			rvo.setRemainSalesSeq(po.getSalesSeq());
			rvo.setRemainPaymentAmt(totalPayment);
			rvo.setRemainAmt(totalPayment);
			salesDao.payRemainSalesPayment(rvo);

			// 기존 판매액 업데이트
			SalesVO tvo = salesDao.selectSales(po.getRemainTargetSeq());
			SalesVO uvo = new SalesVO();
			uvo.setSalesSeq(po.getRemainTargetSeq());
			uvo.setSalePrice(tvo.getTotalPayment() + totalPayment);
			salesDao.updateSalesMst(uvo);

		} else if(po.getSalePrice()-totalPayment > 0) {
			// delete remain
			salesDao.deleteRemainSalesPayment(po.getSalesSeq());

			// 잔고등록
			RemainVO rvo = new RemainVO();
			rvo.setSalesSeq(po.getSalesSeq());
			rvo.setSalesDt(po.getSalesDt());
			rvo.setRemainAmt(po.getSalePrice()-totalPayment);
			
			salesDao.insertRemainSalesPayment(rvo);
		}
		return cnt;
	}

	@Override
	@Transactional
	public int deleteSales(int salesSeq) {
		SalesVO vo = salesDao.selectSales(salesSeq);
		int res =0;
		if(vo.getSalesDtlList() != null && vo.getSalesDtlList().size() > 0) {
			System.out.println("[ salesType ]"+vo.getSalesDtlList().get(0).getSalesType());
			if("6".equals(vo.getSalesDtlList().get(0).getSalesType())) {
				RemainVO po = new RemainVO();
				po.setRemainSalesSeq(salesSeq);
				RemainVO cro = salesDao.selectRemainPayment(po);

				RemainVO rvo = new RemainVO();
				rvo.setRemainPaymentAmt(0);
				rvo.setRemainSalesSeq(0);
				rvo.setRemainSalesDt(null);
				rvo.setSalesSeq(cro.getSalesSeq());
				res += salesDao.payRemainSalesPayment(rvo);
			} else {
				res += salesDao.deleteRemainSalesPayment(salesSeq);
			}
			res += salesDao.deleteSalesDtls(salesSeq);
			res += salesDao.deleteSalesMst(salesSeq);
		}
		return res;
	}

	
}
