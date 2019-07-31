package com.ssm.mapper;
import java.util.List;

import com.ssm.model.Drug;
public interface DrugMapper {

void saveDrug(Drug drug);
	
	boolean updateDrug(Drug drug);
	
	boolean deleteDrug(int did);
	
	Drug findDrugById(int did);
	
	List<Drug> findAll();
}
