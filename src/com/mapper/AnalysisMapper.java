package com.mapper;

import java.util.List;

import com.vo.AnalysisInfo;

public interface AnalysisMapper {
	public AnalysisInfo select(String obj);
	public List<AnalysisInfo> selectMileage(String obj);
}
