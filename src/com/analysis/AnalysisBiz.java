package com.analysis;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.vo.AnalysisInfo;

@Service("analysisBiz")
public class AnalysisBiz {

	@Inject
	private AnalysisDao dao;
	
	
	public AnalysisInfo get(String s) {
		// TODO Auto-generated method stub
		return dao.select(s);
	}

	public List<AnalysisInfo> getMileage(String s) {
		// TODO Auto-generated method stub
		return dao.selectMileage(s);
	}

}
