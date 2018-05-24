package com.mapper;

import com.vo.CarInfo;

public interface CarInfoMapper {
	public CarInfo select(String obj);
	public void insert(CarInfo obj);
	public void delete(String obj);
	public void update(CarInfo obj);
}
