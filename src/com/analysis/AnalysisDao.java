package com.analysis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mapper.AnalysisMapper;
import com.vo.AnalysisInfo;

@Repository("analysisDao")
public class AnalysisDao {
	
	@Autowired
	AnalysisMapper mapper;
	
	
	
	public AnalysisInfo select(String s) {
		// TODO Auto-generated method stub
		return mapper.select(s);
	}

	

	


}
