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
	@RequestMapping(value="/replaceSt.do", method=RequestMethod.GET)
	public String replaceST(MaintenanceInfo minfo,Model m) {
		System.out.println(minfo.getChange_st()+", "+minfo.getMain_seq());
		biz.modifyST(minfo);
		return "redirect:/settingsupply.do?car_num="+minfo.getCar_num();
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
/*	@RequestMapping("registerCarCtrl.do")
	public void registerCarCtrl(HttpServletResponse res, String cnum) {
		PrintWriter out=null;
		try {
			out = res.getWriter();
			biz.register(cnum);
			out.println("1");
		} catch (IOException ie) {
			// TODO Auto-generated catch block
			ie.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			out.println("0");
		} finally {
			out.close();
		}		
	}
	
	
	@RequestMapping("updateCarCtrl.do")
	public void updateCarCtrl(HttpServletResponse res, ControlInfo ctrl) {
		PrintWriter out=null;
		try {
			out = res.getWriter();
			//System.out.printf("Call servlet %s \n",car_num);
			biz.get(ctrl.getCar_num());
			biz.modify(ctrl);
			out.println("1");
			for(int i=0;i<10;i++) {
			biz.modify(cloc);
			out.println(cloc.getLat()+"/"+cloc.getLog());
			cloc.setLat(cloc.getLat()+0.0002);
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			out.println("0");
		} finally {
			out.close();
		}
		
	}*/
	
	
}
