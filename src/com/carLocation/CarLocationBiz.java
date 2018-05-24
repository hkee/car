package com.carLocation;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.vo.CarInfo;
import com.vo.CarLocation;

@Service("carLocationBiz")
public class CarLocationBiz {

	@Inject
	private CarLocationDao dao;
	
	
	public void register(String cnum) {
		// TODO Auto-generated method stub
		dao.insert(cnum);
	}

	
	public void remove(String s) {
		// TODO Auto-generated method stub
		dao.delete(s);
	}


	public void modify(CarLocation c) {
		// TODO Auto-generated method stub
		dao.update(c);
	}

	
	public CarLocation get(String s) {
		// TODO Auto-generated method stub
		return dao.select(s);
	}



}
