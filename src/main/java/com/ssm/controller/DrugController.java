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
	 *��ת�����ҩƷ����
	 */
	@RequestMapping("toAddDrug")
	public String toAddDrug(){
		return "addDrug";
	}
	
	/**
	 * ���ҩƷ���ض���  
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
	 * �޸�ҩƷ
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
	 * ��ѯ����ҩƷ
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
	 * ��ѯ����ҩƷ
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
	 * ����idɾ��ҩƷ
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
	 * ��ҳ��ѯҩƷ��Ϣ
	 * @param pn Ĭ�ϴӵ�һҳ��ʼ  �������
	 * @param model
	 * @return
	 */
	@RequestMapping("drugInfo")
	public String getDrugs(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		//�ӵ�һ����ʼ ÿҳ��ѯ��������
		PageHelper.startPage(pn, 5);
		List<Drug> drugs = drugService.findAll();
		//��ҩƷ��Ϣ����PageInfo������
		PageInfo page = new PageInfo(drugs,5);
		model.addAttribute("pageInfo", page);
		return "allDrug";
	}
}
