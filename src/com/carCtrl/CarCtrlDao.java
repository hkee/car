package com.carCtrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mapper.CarCtrlMapper;
import com.vo.CarLocation;
import com.vo.ControlInfo;

@Repository("carCtrlDao")
public class CarCtrlDao {
	
	@Autowired
	CarCtrlMapper mapper;
	
	
	public void insert(String cnum) {
		// TODO Auto-generated method stub
		mapper.insert(cnum);
	}

	
	public void delete(String s) {
		// TODO Auto-generated method stub
		mapper.delete(s);		
	}

	
	public void update(ControlInfo obj) {
		// TODO Auto-generated method stub
		mapper.update(obj);
	}

	
	public ControlInfo select(String s) {
		// TODO Auto-generated method stub
		return mapper.select(s);
	}

	

	


}
