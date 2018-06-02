package com.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.maintenanceInfo.MaintenanceInfoBiz;
import com.vo.MaintenanceInfo;

@Controller
public class CarMaintenanceController {

	@Inject
	private MaintenanceInfoBiz biz;
	
	
	@RequestMapping("/settingsupply.do")
	public String selectST(HttpServletResponse res, @RequestParam("car_num") String car_num,Model m) {
		m.addAttribute("center", "settingSupply");
		//System.out.printf("Call servlet %s \n",car_num);
		List<MaintenanceInfo> minfo = biz.listStAll(car_num);
		m.addAttribute("stlist", minfo);
		for(int i=0;i<minfo.size();i++) {
			System.out.println(minfo.get(i).getPart_name());
		} 
			return "main";
		
		
	}
	
	@RequestMapping("/diagnosis.do")
	public String diagnosis(HttpServletResponse res,@RequestParam("car_type") String car_type, @RequestParam("car_num") String car_num,Model m) {
		m.addAttribute("center", "chartSupply");
		List<MaintenanceInfo> minfo = biz.listSupply(car_num);
		m.addAttribute("splist", minfo);
		for(int i=0;i<minfo.size();i++) {
			System.out.println(minfo.get(i).getMile());
		} 
		return "main";
	}
	@RequestMapping("/appdiagnosis.do")
	public String appdiagnosis(HttpServletResponse res,@RequestParam("car_type") String car_type, @RequestParam("car_num") String car_num,Model m) {
		List<MaintenanceInfo> minfo = biz.listSupply(car_num);
		m.addAttribute("splist", minfo);

		return "appchartSupply";
	}
	
	
	@RequestMapping(value="/replaceSt.do", method=RequestMethod.GET)
	public String replaceST(MaintenanceInfo minfo,Model m) {
		System.out.println(minfo.getChange_st()+", "+minfo.getMain_seq());
		biz.modifyST(minfo);
		return "redirect:/settingsupply.do?car_num="+minfo.getCar_num();
	}
	
	@RequestMapping(value="/updateMile.do", method=RequestMethod.GET)
	public String updateMile(MaintenanceInfo minfo,Model m,@RequestParam("car_type") String car_type) {
		System.out.println(minfo.getChange_st()+", "+minfo.getMain_seq());
		biz.modifyMile(minfo);
		return "redirect:/diagnosis.do?car_num="+minfo.getCar_num()+"&car_type="+car_type;
	}
	
	@RequestMapping(value="/webreplaceSt.do", method=RequestMethod.GET)
	public String webreplaceST(MaintenanceInfo minfo,Model m) {
		System.out.println(minfo.getChange_st()+", "+minfo.getMain_seq());
		biz.modifyST(minfo);
		return "settingSupply";
	}
	
	@RequestMapping("/websettingsp.do")
	public String weblistST(HttpServletResponse res, @RequestParam("car_num") String car_num,Model m) {
		//System.out.printf("Call servlet %s \n",car_num);
		List<MaintenanceInfo> minfo = biz.listStAll(car_num);
		m.addAttribute("stlist", minfo);
		for(int i=0;i<minfo.size();i++) {
			System.out.println(minfo.get(i).getPart_name());
		} 
			return "settingSupply";
		
		
	}

	
	
}
