package com.mapper;

import java.util.HashMap;
import java.util.List;

import com.vo.MaintenanceInfo;

public interface MaintenanceInfoMapper {
	public MaintenanceInfo select(String obj);
	public void insert(HashMap<String,String> map);
	public void delete(String obj);
	public void update(MaintenanceInfo obj);
	public void updateST(MaintenanceInfo obj);
	public void updateMile(MaintenanceInfo obj);
	public List<MaintenanceInfo> selectCarAll(String car_num);
	public List<MaintenanceInfo> selectChangeST(String car_num);
	public List<MaintenanceInfo> selectSupply(String car_num);
}
