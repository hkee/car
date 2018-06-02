package com.carLocation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mapper.CarLocationMapper;
import com.vo.CarInfo;
import com.vo.CarLocation;

@Repository("carLocationDao")
public class CarLocationDao {
	
	@Autowired
	CarLocationMapper mapper;
	
	
	public void insert(String cnum) {
		// TODO Auto-generated method stub
		mapper.insert(cnum);
	}

	
	public void delete(String s) {
		// TODO Auto-generated method stub
		mapper.delete(s);		
	}

	
	public void update(CarLocation c) {
		// TODO Auto-generated method stub
		mapper.update(c);
	}

	
	public CarLocation select(String s) {
		// TODO Auto-generated method stub
		return mapper.select(s);
	}
	public int selectmile(String s) {
		// TODO Auto-generated method stub
		return mapper.selectmile(s);
	}
	

	


}
