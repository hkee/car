package com.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.analysis.AnalysisBiz;
import com.vo.AnalysisInfo;

@Controller
public class AnalysisController {

	@Inject
	private AnalysisBiz biz;
	
	@RequestMapping("getAnalysis.do")
	public String selectAnalysis(Model m, @RequestParam("car_num") String car_num,@RequestParam("car_type") String car_type) {
			m.addAttribute("center","chartStatus");
			
			AnalysisInfo anal = biz.get(car_num);
			System.out.println(anal.getNe());
			m.addAttribute("hit",anal);
			
			
		return "main";
		
	}
	

	
	
	
	
}
