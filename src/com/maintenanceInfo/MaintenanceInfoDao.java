package com.maintenanceInfo;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mapper.MaintenanceInfoMapper;
import com.vo.MaintenanceInfo;

@Repository("maintenanceInfoDao")
public class MaintenanceInfoDao {
	
	@Autowired
	MaintenanceInfoMapper mapper;
	
	
	public void insert(HashMap<String,String> map) {
		// TODO Auto-generated method stub
		mapper.insert(map);
	}

	
	public void delete(String s) {
		// TODO Auto-generated method stub
		mapper.delete(s);		
	}

	
	public void update(MaintenanceInfo c) {
		// TODO Auto-generated method stub
		mapper.update(c);
	}
	public void updateST(MaintenanceInfo c) {
		// TODO Auto-generated method stub
		mapper.updateST(c);
	}
	public void updateMile(MaintenanceInfo c) {
		// TODO Auto-generated method stub
		mapper.updateMile(c);
	}
	public MaintenanceInfo select(String s) {
		// TODO Auto-generated method stub
		return mapper.select(s);
	}
	public List<MaintenanceInfo> listCar(String car_num){
		return mapper.selectCarAll(car_num);
	}

	public List<MaintenanceInfo> listSt(String car_num){
		return mapper.selectChangeST(car_num);
	}
	public List<MaintenanceInfo> listSp(String car_num){
		return mapper.selectSupply(car_num);
	}

	


}
