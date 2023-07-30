package com.ddgold.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddgold.service.CashService;
import com.ddgold.vo.CashOnHandVO;
import com.ddgold.vo.SalesParamVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class CashController {

	@Autowired
	CashService cashService;

	@ResponseBody
	@GetMapping("/api/cashList")
	public String cashListJson(SalesParamVO po) {
		System.out.println(po);
		List<CashOnHandVO> list = cashService.getCashOnHandList(po);
		System.out.println(list);
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@PostMapping( consumes = "application/json", value = "/api/insertCashOnHand")
	public String insertCashOnHAnd(@RequestBody CashOnHandVO vo) {
		System.out.println(vo);
		
		cashService.insertCashOnHand(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	@ResponseBody
	@PostMapping( value = "/api/deleteCashOnHand")
	public String deleteCashOnHAnd(@RequestBody CashOnHandVO vo) {
		System.out.println(vo);
		
		cashService.deleteCashOnHand(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
	
	@ResponseBody
	@PostMapping("/api/closeCashOnHand")
	public String closeCashOnHAnd(SalesParamVO po) {
		System.out.println(po);
		
		cashService.insertLastCashOnHand();
		
		HashMap<String, String> result = new HashMap<>();
		
		result.put("result", "success");
		
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		
		return gson.toJson(result);
	}
	
	@ResponseBody
	@PostMapping("/api/cancleCloseCashOnHand")
	public String cancelCloseCashOnHAnd(SalesParamVO po) {
		System.out.println(po);
		
		int deleted = cashService.deleteLastCashOnHand();
		
		HashMap<String, String> result = new HashMap<>();
		if(deleted > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		
		return gson.toJson(result);
	}
	
	
}
