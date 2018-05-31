package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carInfo.CarInfoBiz;
import com.vo.CarInfo;

@Controller
public class CarInfoController {

	@Inject
	private CarInfoBiz biz;
	
	
	@RequestMapping("allCarinfo.do")
	public void allCarinfo(HttpServletResponse res, @RequestParam("member_seq") int member_seq) {
		PrintWriter out=null;
		try {
			out = res.getWriter();
			System.out.printf("Call servlet %s \n",member_seq);
			List<CarInfo> cinfolist = biz.listUserAll(member_seq);
			
			for(int i=0;i<cinfolist.size();i++) {
				System.out.println(cinfolist.get(i).getCar_num());
				out.print(cinfolist.get(i).getCar_num()+"/"+cinfolist.get(i).getCar_type()+"/");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NullPointerException e) {
			out.println("0");
		} finally {
			out.close();
		}
	}
	
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
			out.println("0");
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
			out.println("0");
		} finally {
			out.close();
		}		
	}
	
	 
}
