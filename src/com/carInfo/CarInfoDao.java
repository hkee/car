package com.carInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mapper.CarInfoMapper;
import com.vo.CarInfo;

@Repository("carInfoDao")
public class CarInfoDao {
	
	@Autowired
	CarInfoMapper mapper;
	
	
	public void insert(CarInfo c) {
		// TODO Auto-generated method stub
		mapper.insert(c);
	}

	
	public void delete(String s) {
		// TODO Auto-generated method stub
		mapper.delete(s);		
	}

	
	public void update(CarInfo c) {
		// TODO Auto-generated method stub
		mapper.update(c);
	}

	
	public CarInfo select(String s) {
		// TODO Auto-generated method stub
		return mapper.select(s);
	}

	

	


}
