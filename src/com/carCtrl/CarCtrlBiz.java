package com.carCtrl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.vo.ControlInfo;

@Service("carCtrlBiz")
public class CarCtrlBiz {

	@Inject
	private CarCtrlDao dao;
	
	
	public void register(String cnum) {
		// TODO Auto-generated method stub
		dao.insert(cnum);
	}

	
	public void remove(String s) {
		// TODO Auto-generated method stub
		dao.delete(s);
	}


	public void modify(ControlInfo obj) {
		// TODO Auto-generated method stub
		dao.update(obj);
	}

	
	public ControlInfo get(String s) {
		// TODO Auto-generated method stub
		return dao.select(s);
	}



}
