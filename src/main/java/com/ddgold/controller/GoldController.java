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

import com.ddgold.service.GoldService;
import com.ddgold.vo.GoldVO;
import com.ddgold.vo.SalesParamVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/api/gold")
public class GoldController {

	@Autowired
	GoldService goldService;
	
	@ResponseBody
	@GetMapping("/list")
	public String goldListJson(SalesParamVO po) {
		System.out.println(po);
		List<GoldVO> list = goldService.getGoldMngList(po);
		System.out.println(list);
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@PostMapping( consumes = "application/json", value = "/insert")
	public String insertGoldMng(@RequestBody GoldVO vo) {
		System.out.println(vo);
		
		goldService.insertGoldMng(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	@ResponseBody
	@PostMapping( value = "/update")
	public String updateGoldMng(@RequestBody GoldVO vo) {
		System.out.println(vo);
		
		goldService.updateGoldMng(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	@ResponseBody
	@PostMapping( value = "/delete")
	public String deleteCashOnHAnd(@RequestBody GoldVO vo) {
		System.out.println(vo);
		
		goldService.deleteGoldMng(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
}
