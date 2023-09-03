package com.ddgold.controller;

import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ddgold.service.impl.CodeServiceImpl;
import com.ddgold.vo.CodeVO;
import com.ddgold.vo.SalesParamVO;

@Controller
public class PageController {
	
	@Autowired
	CodeServiceImpl codeService;
	
	/*
	 * 대시보드
	 */
	@GetMapping({"/"})
	public ModelAndView home(Model model, SalesParamVO param) {
		ModelAndView mv= new ModelAndView();
		
		mv.addObject("title","Dashboard");
		mv.addObject("pagePath", "../main.ftl");
		mv.setViewName("/layout/layout");
		return mv;
	}
	
	/*
	 * 영업일지
	 */
	@GetMapping({"/salesList", "/test"})
	public ModelAndView salesList(Model model, SalesParamVO param) {
		ModelAndView mv= new ModelAndView();
		Calendar cal = Calendar.getInstance();
		
		if(!StringUtils.hasText(param.getYear())) {
			param.setYear(String.valueOf(cal.get(Calendar.YEAR)));
		}

		if(!StringUtils.hasText(param.getMonth())) {
			param.setMonth(String.format("%02d",cal.get(Calendar.MONTH)+1));
		} else {
			param.setMonth(String.format("%02s",param.getMonth()));
		}
		
		CodeVO cvo1 = new CodeVO();
		List<CodeVO> cvoAll = codeService.getCodes(cvo1);
		
		mv.addObject("salesTypes", filterSpecificCode(cvoAll, "sales_type"));
		mv.addObject("karatages", filterSpecificCode(cvoAll, "karatage"));
		mv.addObject("prdTypes", filterSpecificCode(cvoAll, "prd_type"));
		
		mv.addObject("title","영업일지 관리");
		mv.addObject("salesParam",param);
		mv.addObject("pagePath", "../salesList.ftl");
		mv.setViewName("/layout/layout");
		
		return mv;
	}
	
	/*
	 * 고금관리
	 */
	@GetMapping({"/gold"})
	public ModelAndView goldMng(Model model, SalesParamVO param) {
		ModelAndView mv= new ModelAndView();
		
		Calendar cal = Calendar.getInstance();
		if(!StringUtils.hasText(param.getYear())) {
			param.setYear(String.valueOf(cal.get(Calendar.YEAR)));
		}
		
		if(!StringUtils.hasText(param.getMonth())) {
			param.setMonth(String.format("%02d",cal.get(Calendar.MONTH)+1));
		} else {
			param.setMonth(String.format("%02s",param.getMonth()));
		}
		
		mv.addObject("title","고금관리");
		mv.addObject("salesParam",param);
		mv.addObject("pagePath", "../gold.ftl");
		mv.setViewName("/layout/layout");
		return mv;
	}
	
	/*
	 * 시재관리
	 */
	@GetMapping({"/cash"})
	public ModelAndView cashOnHand(Model model, SalesParamVO param) {
		ModelAndView mv= new ModelAndView();
		
		Calendar cal = Calendar.getInstance();
		if(!StringUtils.hasText(param.getYear())) {
			param.setYear(String.valueOf(cal.get(Calendar.YEAR)));
		}
		
		if(!StringUtils.hasText(param.getMonth())) {
			param.setMonth(String.format("%02d",cal.get(Calendar.MONTH)+1));
		} else {
			param.setMonth(String.format("%02s",param.getMonth()));
		}
		
		mv.addObject("title","시재관리");
		mv.addObject("salesParam",param);
		mv.addObject("pagePath", "../cash.ftl");
		mv.setViewName("/layout/layout");
		return mv;
	}
	
	/*
	 * 수리
	 */
	@GetMapping({"/repair"})
	public ModelAndView repair(Model model, SalesParamVO param) {
		ModelAndView mv= new ModelAndView();
		
		Calendar cal = Calendar.getInstance();
		if(!StringUtils.hasText(param.getYear())) {
			param.setYear(String.valueOf(cal.get(Calendar.YEAR)));
		}
		
		if(!StringUtils.hasText(param.getMonth())) {
			param.setMonth(String.format("%02d",cal.get(Calendar.MONTH)+1));
		} else {
			param.setMonth(String.format("%02s",param.getMonth()));
		}
		CodeVO cvo1 = new CodeVO();
		List<CodeVO> cvoAll = codeService.getCodes(cvo1);
		
		mv.addObject("salesTypes", filterSpecificCode(cvoAll, "sales_type"));
		mv.addObject("karatages", filterSpecificCode(cvoAll, "karatage"));
		mv.addObject("prdTypes", filterSpecificCode(cvoAll, "prd_type"));
		mv.addObject("colors", filterSpecificCode(cvoAll, "color"));
		
		mv.addObject("title","A/S대장");
		mv.addObject("salesParam",param);
		mv.addObject("pagePath", "../repair.ftl");
		mv.setViewName("/layout/layout");
		return mv;
	}

	/*
	 * 일별통계페이지
	 */
	@GetMapping({"/statistics","/statistics/daily"})
	public ModelAndView statisticsDaily(Model model, SalesParamVO param) {
		ModelAndView mv= new ModelAndView();
		
		Calendar cal = Calendar.getInstance();
		if(!StringUtils.hasText(param.getYear())) {
			param.setYear(String.valueOf(cal.get(Calendar.YEAR)));
		}
		
		if(!StringUtils.hasText(param.getMonth())) {
			param.setMonth(String.format("%02d",cal.get(Calendar.MONTH)+1));
		} else {
			param.setMonth(String.format("%02s",param.getMonth()));
		}
		
		mv.addObject("title","통계");
		mv.addObject("salesParam",param);
		mv.addObject("pagePath", "../statisticsDaily.ftl");
		mv.setViewName("/layout/layout");
		return mv;
	}
	
	/*
	 * 공통코드 자르기
	 */
	public List<CodeVO> filterSpecificCode(List<CodeVO> cvoAll, String codeGrp) {
		return cvoAll.stream().filter((cvo) -> {
			return codeGrp.equals(cvo.getCodeGrp());
		}).collect(Collectors.toList());
	}
}
