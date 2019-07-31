package com.ssm.service;
import java.util.List;

import com.ssm.model.Drug;
public interface DrugService {
void saveDrug(Drug drug);
	
	boolean updateDrug(Drug drug);
	
	boolean deleteDrug(int did);
	
	Drug findDrugById(int did);
	
	List<Drug> findAll();

}
