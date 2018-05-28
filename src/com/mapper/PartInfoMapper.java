package com.mapper;

import java.util.List;

import com.vo.PartInfo;

public interface PartInfoMapper {
	public PartInfo select(String obj);
	public List<PartInfo> selectAll();
	
}
