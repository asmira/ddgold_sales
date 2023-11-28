package com.ddgold.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddgold.service.CashService;
import com.ddgold.vo.CashOnHandVO;
import com.ddgold.vo.SalesParamVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/api/cash")
public class CashController {

	@Autowired
	CashService cashService;

	@ResponseBody
	//@GetMapping("/api/cashList")
	@GetMapping("/list")
	public String cashListJson(SalesParamVO po) {
		List<CashOnHandVO> list = cashService.getCashOnHandList(po);

		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		
		return gson.toJson(list);
	}
	
	@ResponseBody
	@PostMapping( consumes = "application/json", value = "/insert")
	public String insertCashOnHAnd(@RequestBody CashOnHandVO vo) {
		cashService.insertCashOnHand(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	@ResponseBody
	@PostMapping( value = "/delete")
	public String deleteCashOnHAnd(@RequestBody CashOnHandVO vo) {
		cashService.deleteCashOnHand(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
	
	@ResponseBody
	@PostMapping("/close")
	public String closeCashOnHAnd(SalesParamVO po) {
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
	@PostMapping("/cancleClose")
	public String cancelCloseCashOnHAnd(SalesParamVO po) {
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
