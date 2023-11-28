package com.ddgold.controller;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ddgold.service.OrderService;
import com.ddgold.service.SalesService;
import com.ddgold.vo.OrderVO;
import com.ddgold.vo.RemainVO;
import com.ddgold.vo.SalesParamVO;
import com.ddgold.vo.SalesVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class SalesController {

	@Autowired
	SalesService salesService;
	
	@Autowired
	OrderService orderService;

	@ResponseBody
	@GetMapping("/api/salesList")
	public String salesListJson(SalesParamVO po) {
		System.out.println(po);
		List<SalesVO> list = salesService.getSalesList(po);
		
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@GetMapping("/api/sales/{salesSeq}")
	public String salesJson(@PathVariable int salesSeq) {
		System.out.println(salesSeq);
		SalesVO vo = salesService.getSales(salesSeq);
		
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		return gson.toJson(vo);
	}

	@ResponseBody
	@GetMapping("/api/salesRemainList")
	public String salesRemainList(@RequestParam(required = false) String type) {
		List<RemainVO> list = salesService.getSalesRemainList();
		List<RemainVO> filteredList = list;
		if(!"full".equals(type)) {
    		filteredList = list.stream().filter(r -> {
    		  return r.getRemainAmt() != r.getRemainPaymentAmt();
    		}).toList();
		}
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		return gson.toJson(filteredList);
	}
	
	@ResponseBody
	@PostMapping("/api/insertSales")
	public String insertSales(@RequestBody SalesVO po, @RequestBody OrderVO oo) {
		System.out.println(po);
		salesService.insertSales(po);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	@ResponseBody
	@PostMapping("/api/updateSales")
	public String updateSales(@RequestBody SalesVO po) {
		System.out.println(po);
		salesService.updateSales(po);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	@ResponseBody
	@PostMapping("/api/deleteSales")
	public String deleteSales(@RequestBody SalesVO po) {
		System.out.println(po);
		salesService.deleteSales(po.getSalesSeq());
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
}
