package com.maintenanceInfo;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carCtrl.CarCtrlDao;
import com.carLocation.CarLocationDao;
import com.vo.CarInfo;

@Service("carInfoBiz")
public class MaintenanceInfoBiz {

	@Inject
	private MaintenanceInfoDao dao;
	
	@Inject
	private CarLocationDao locdao;
	
	@Inject 
	private CarCtrlDao ctrldao;
	
	
	@Transactional
	public void register(CarInfo c) {
		// TODO Auto-generated method stub
		dao.insert(c);
		locdao.insert(c.getCar_num());
		ctrldao.insert(c.getCar_num());
		
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

	public List<CarInfo> listUserAll(int seq){
		return dao.listUser(seq);
	}

}
