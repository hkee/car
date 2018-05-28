package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carCtrl.CarCtrlBiz;
import com.vo.CarLocation;
import com.vo.ControlInfo;

@Controller
public class CarCtrlController {

	@Inject
	private CarCtrlBiz biz;
	
	@RequestMapping("readCarCtrl.do")
	public void selectCarctrl(HttpServletResponse res, @RequestParam("car_num") String car_num) {
		PrintWriter out=null;
		try {
			out = res.getWriter();
			//System.out.printf("Call servlet %s \n",car_num);
			ControlInfo ctrl = biz.get(car_num);
			out.println(ctrl.getCar_num()+"/"+ctrl.getStart_onoff()+"/"+
					ctrl.getDoor_onoff()+"/"+ctrl.getAir_lv()+"/"+
					ctrl.getHeat_lv()+"/"+ctrl.getElight_onoff()+
					"/"+ctrl.getTemp()+"/"+ctrl.getReg_date()
					);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NullPointerException e) {
			out.println("0");
		} finally {
			out.close();
		}
		
	}
	
	@RequestMapping("registerCarCtrl.do")
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
			/*for(int i=0;i<10;i++) {
			biz.modify(cloc);
			out.println(cloc.getLat()+"/"+cloc.getLog());
			cloc.setLat(cloc.getLat()+0.0002);
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}*/
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			out.println("0");
		} finally {
			out.close();
		}
		
	}
	
	
}
