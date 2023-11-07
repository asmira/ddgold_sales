package com.ddgold.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddgold.service.RepairService;
import com.ddgold.vo.RepairDtlVO;
import com.ddgold.vo.RepairVO;
import com.ddgold.vo.SalesParamVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class RepairController {
    
	@Autowired
	RepairService repairService;
	
	@ResponseBody
	@GetMapping("/api/repairList")
	public String repairListJson(SalesParamVO po) {
		List<RepairVO> list = repairService.getRepairList(po);
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		return gson.toJson(list);
	}

	@ResponseBody
	@GetMapping("/api/repair/{repairSeq}")
	public String repairJson(@PathVariable int repairSeq) {
		RepairVO dtl = repairService.getRepair(repairSeq);
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		return gson.toJson(dtl);
	}

    
	@ResponseBody
	@PostMapping( consumes = "application/json", value = "/api/insertRepair")
	public String insertRepair(@RequestBody RepairVO vo) {
		repairService.insertRepair(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	@ResponseBody
	@PostMapping( value = "/api/updateRepair")
	public String updateRepair(@RequestBody RepairVO vo) {
		repairService.updateRepair(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
	@ResponseBody
    @PostMapping( value = {"/api/updateReceipt", "/api/cancelReceipt"})
    public String updateReceipt(@RequestBody RepairDtlVO vo) {
        repairService.receiptRepair(vo);
        
        HashMap<String, String> result = new HashMap<>();
        result.put("result", "success");
        
        Gson gson = new Gson();
        return gson.toJson(result);
    }
	

    @ResponseBody
    @PostMapping( value = {"/api/updateFinish"})
    public String updateFinish(@RequestBody RepairDtlVO vo) {
        if("R".equals(vo.getFinishStatus())) {
          repairService.restockRepair(vo);
        } else {
          repairService.finishRepair(vo);
        }
        
        HashMap<String, String> result = new HashMap<>();
        result.put("result", "success");
        
        Gson gson = new Gson();
        return gson.toJson(result);
    }

    @ResponseBody
    @PostMapping( value = {"/api/cancelFinish"})
    public String cancelFinish(@RequestBody RepairDtlVO vo) {
      repairService.cancelFinish(vo);
      
      HashMap<String, String> result = new HashMap<>();
      result.put("result", "success");
      
      Gson gson = new Gson();
      return gson.toJson(result);
    }
    
	
	@ResponseBody
	@PostMapping( value = "/api/deleteRepair/{repairSeq}")
	public String deleteCashOnHAnd(@PathVariable int repairSeq) {
		repairService.deleteRepair(repairSeq);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
}
