package com.ssm.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.mapper.DrugMapper;
import com.ssm.model.Drug;
import com.ssm.service.DrugService;

@Service
public class DrugServiceImpl implements DrugService {

	/**
	 * 注入DrugMapper接口
	 */
	@Autowired
	private DrugMapper drugMapper;
	
	/**
	 * 新增用户
	 */
	@Override
	public void saveDrug(Drug drug) {
		drugMapper.saveDrug(drug);
	}

	/**
	 * 更新用户
	 */
	@Override
	public boolean updateDrug(Drug drug) {
		return drugMapper.updateDrug(drug);
	}

	/**
	 * 根据Id删除用户
	 */
	@Override
	public boolean deleteDrug(int did) {
		return drugMapper.deleteDrug(did);
	}
	
	/**
	 * 根据id查找用户
	 */
	@Override
	public Drug findDrugById(int did) {
		Drug drug = drugMapper.findDrugById(did);
		return drug;
	}
	
	/**
	 * 查询所有用户
	 */
	@Override
	public List<Drug> findAll() {
		List<Drug> allDrug = drugMapper.findAll();
		return allDrug;
	}

}