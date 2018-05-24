package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carInfo.CarInfoBiz;
import com.carLocation.CarLocationBiz;
import com.vo.CarInfo;

@Controller
public class CarInfoController {

	@Inject
	private CarInfoBiz biz;
	
	@RequestMapping("readCarinfo.do")
	public void selectCarinfo(HttpServletResponse res, @RequestParam("car_num") String car_num) {
		PrintWriter out=null;
		try {
			out = res.getWriter();
			System.out.printf("Call servlet %s \n",car_num);
			CarInfo cinfo = biz.get(car_num);
			System.out.println("carInfo"+cinfo.getCar_num()+","+cinfo.getCar_type()+","+cinfo.getMember_seq());
			out.println(cinfo.getCar_num()+"/"+cinfo.getMember_seq()+"/"+cinfo.getCar_type()+"/"+cinfo.getInsurance()+"/"+cinfo.getYear()+"/"+cinfo.getIns_register());
			
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NullPointerException e) {
			out.println("2");
		} finally {
			out.close();
		}
		
	}
	
	@RequestMapping("registerCarInfo.do")
	public void registerCarinfo(HttpServletResponse res, CarInfo cinfo) {
		PrintWriter out=null;
		try {
			out = res.getWriter();
			biz.register(cinfo);
			out.println("1");
		} catch (IOException ie) {
			// TODO Auto-generated catch block
			ie.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			out.println("2");
		} finally {
			out.close();
		}		
	}
	
}
