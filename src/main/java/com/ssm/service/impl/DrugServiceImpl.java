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
	 * ע��DrugMapper�ӿ�
	 */
	@Autowired
	private DrugMapper drugMapper;
	
	/**
	 * �����û�
	 */
	@Override
	public void saveDrug(Drug drug) {
		drugMapper.saveDrug(drug);
	}

	/**
	 * �����û�
	 */
	@Override
	public boolean updateDrug(Drug drug) {
		return drugMapper.updateDrug(drug);
	}

	/**
	 * ����Idɾ���û�
	 */
	@Override
	public boolean deleteDrug(int did) {
		return drugMapper.deleteDrug(did);
	}
	
	/**
	 * ����id�����û�
	 */
	@Override
	public Drug findDrugById(int did) {
		Drug drug = drugMapper.findDrugById(did);
		return drug;
	}
	
	/**
	 * ��ѯ�����û�
	 */
	@Override
	public List<Drug> findAll() {
		List<Drug> allDrug = drugMapper.findAll();
		return allDrug;
	}

}