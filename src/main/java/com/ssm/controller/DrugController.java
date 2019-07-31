package com.ssm.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.model.Drug;
import com.ssm.service.DrugService;

@Controller
@RequestMapping("/drug")

public class DrugController {
	@Autowired
	private DrugService drugService;  
	
	/**
	 *跳转到添加药品界面
	 */
	@RequestMapping("toAddDrug")
	public String toAddDrug(){
		return "addDrug";
	}
	
	/**
	 * 添加药品并重定向  
	 * @param model
	 * @param Drug
	 * @return
	 */
	@RequestMapping("addDrug") 
	public String addDrug(Model model,Drug drug){
		if(drug != null){
			drugService.saveDrug(drug);
		}
		return "redirect:/drug/drugInfo";
	}
	
	/**
	 * 修改药品
	 * @param model
	 * @param request
	 * @param Drug
	 * @return
	 */
	@RequestMapping("updateDrug")  
	public String UpdateDrug(Model model,Drug drug){
			 if(drugService.updateDrug(drug)){  
				    drug = drugService.findDrugById(drug.getDid());  
		            model.addAttribute("drug", drug);  
		            return "redirect:/drug/drugInfo";  
		        } 
		 return "/error";  
	}
	
	/**
	 * 查询所有药品
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("getAllDrug")  
	public String getAllDrug(Model model){
		List<Drug> drug = drugService.findAll();
		model.addAttribute("drugList",drug);
		return "allDrug";
	}
	
	/**
	 * 查询单个药品
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getDrug")  
	public String getDrug(int did,Model model){
		model.addAttribute("drug", drugService.findDrugById(did));  
		return "editDrug";
	}
	/**
	 * 根据id删除药品
	 * @param id
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delDrug") 
	public String deleteDrug(int did,Model model){
		model.addAttribute("drug", drugService.deleteDrug(did));  
	    return "redirect:/drug/drugInfo";
	}
	
	/**
	 * 分页查询药品信息
	 * @param pn 默认从第一页开始  请求参数
	 * @param model
	 * @return
	 */
	@RequestMapping("drugInfo")
	public String getDrugs(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		//从第一条开始 每页查询五条数据
		PageHelper.startPage(pn, 5);
		List<Drug> drugs = drugService.findAll();
		//将药品信息放入PageInfo对象里
		PageInfo page = new PageInfo(drugs,5);
		model.addAttribute("pageInfo", page);
		return "allDrug";
	}
}
