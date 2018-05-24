package com.mapper;

import com.vo.ControlInfo;

public interface CarCtrlMapper {
	public ControlInfo select(String obj);
	public void insert(String obj);
	public void delete(String obj);
	public void update(ControlInfo obj);
}
