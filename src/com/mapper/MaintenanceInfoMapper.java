package com.mapper;

import com.vo.MaintenanceInfo;

public interface MaintenanceInfoMapper {
	public MaintenanceInfo select(String obj);
	public void insert(MaintenanceInfo obj);
	public void delete(String obj);
	public void update(MaintenanceInfo obj);
}
