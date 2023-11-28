package com.ddgold.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddgold.service.OrderService;
import com.ddgold.vo.OrderDtlVO;
import com.ddgold.vo.OrderVO;
import com.ddgold.vo.SalesParamVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/api/order")
public class OrderController {
    
	@Autowired
	OrderService orderService;
	
	@ResponseBody
	@GetMapping("/list")
	public String orderListJson(SalesParamVO po) {
		List<OrderVO> list = orderService.getOrderList(po);
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		return gson.toJson(list);
	}

	@ResponseBody
	@GetMapping("/{orderSeq}")
	public String orderJson(@PathVariable int orderSeq) {
		OrderVO dtl = orderService.getOrder(orderSeq);
		Gson gson = new GsonBuilder()
					.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
		return gson.toJson(dtl);
	}

    
	@ResponseBody
	@PostMapping( consumes = "application/json", value = "/api/insertOrder")
	public String insertOrder(@RequestBody OrderVO vo) {
		orderService.insertOrder(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	@ResponseBody
	@PostMapping( value = "/update")
	public String updateOrder(@RequestBody OrderVO vo) {
		orderService.updateOrder(vo);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
	@ResponseBody
    @PostMapping( value = {"/receipt", "/cancelReceipt"})
    public String updateReceipt(@RequestBody OrderDtlVO vo) {
        orderService.receiptOrder(vo);
        
        HashMap<String, String> result = new HashMap<>();
        result.put("result", "success");
        
        Gson gson = new Gson();
        return gson.toJson(result);
    }
	

    @ResponseBody
    @PostMapping( value = {"/finish"})
    public String updateFinish(@RequestBody OrderDtlVO vo) {
        if("R".equals(vo.getFinishStatus())) {
          orderService.restockOrder(vo);
        } else {
          orderService.finishOrder(vo);
        }
        
        HashMap<String, String> result = new HashMap<>();
        result.put("result", "success");
        
        Gson gson = new Gson();
        return gson.toJson(result);
    }

    @ResponseBody
    @PostMapping( value = {"/cancelFinish"})
    public String cancelFinish(@RequestBody OrderDtlVO vo) {
      orderService.cancelFinish(vo);
      
      HashMap<String, String> result = new HashMap<>();
      result.put("result", "success");
      
      Gson gson = new Gson();
      return gson.toJson(result);
    }
    
	
	@ResponseBody
	@PostMapping( value = "/delete/{orderSeq}")
	public String deleteCashOnHAnd(@PathVariable int orderSeq) {
		orderService.deleteOrder(orderSeq);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
}
