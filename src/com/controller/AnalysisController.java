package com.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("appgetAnalysis.do")
	public String selectappAnalysis(Model m, @RequestParam("car_num") String car_num,@RequestParam("car_type") String car_type) {
			
			
			AnalysisInfo anal = biz.get(car_num);
			System.out.println(anal.getNe());
			m.addAttribute("hit",anal);
			
			
		return "appchartStatus";
		
	}
	@RequestMapping("getMileage.do")
	public String selectMileage(Model m, @RequestParam("car_num") String car_num,@RequestParam("car_type") String car_type) {
			m.addAttribute("center","chartMileage");
			return "main";
	}
	@RequestMapping("appgetMileage.do")
	public String selectappMileage(Model m, @RequestParam("car_num") String car_num,@RequestParam("car_type") String car_type) {
			
			return "appchartMileage";
	}
	
	@RequestMapping("getMileageimpl.do")
	@ResponseBody
	public void selectMileageImpl(HttpServletResponse res, @RequestParam("car_num") String car_num,@RequestParam("car_type") String car_type) throws Exception {
		res.setCharacterEncoding("UTF-8");
	      res.setContentType("application/json");
	      PrintWriter out = res.getWriter();
	      JSONArray ja = new JSONArray();
	      JSONArray fuel = new JSONArray();
	      JSONArray offfuel = new JSONArray();
	      JSONObject data = new JSONObject();
	      JSONObject data2 = new JSONObject();
			List<AnalysisInfo> anal = biz.getMileage(car_num);
		
			double result;
			for(int i=0;i<anal.size();i++) {
				result=(double)anal.get(i).getMile()/anal.get(i).getOil();
				System.out.println(result);
				fuel.add(Math.round(result*10d)/10d);
				offfuel.add(10.0);
			}
			data.put("name", "내차 연비");
			data.put("data", fuel);
			data2.put("name", "공인 연비");
			data2.put("data", offfuel);
			ja.add(data);
			ja.add(data2);
			 out.write(ja.toJSONString());
		      out.close();
		

		
	}
	
	
	
	
}
