package com.carInfo;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carLocation.CarLocationDao;
import com.vo.CarInfo;

@Service("carInfoBiz")
public class CarInfoBiz {

	@Inject
	private CarInfoDao dao;
	
	@Inject
	private CarLocationDao locdao;
	
	
	@Transactional
	public void register(CarInfo c) {
		// TODO Auto-generated method stub
		dao.insert(c);
		locdao.insert(c.getCar_num());
		
	}

	
	public void remove(String s) {
		// TODO Auto-generated method stub
		dao.delete(s);
	}


	public void modify(CarInfo c) {
		// TODO Auto-generated method stub
		dao.update(c);
	}

	
	public CarInfo get(String s) {
		// TODO Auto-generated method stub
		return dao.select(s);
	}



}
