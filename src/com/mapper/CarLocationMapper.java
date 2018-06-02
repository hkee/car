package com.mapper;

import com.vo.CarLocation;

public interface CarLocationMapper {
	public CarLocation select(String obj);
	public int selectmile(String obj);
	public void insert(String obj);
	public void delete(String obj);
	public void update(CarLocation obj);
}
