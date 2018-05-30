package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carLocation.CarLocationBiz;
import com.vo.CarInfo;
import com.vo.CarLocation;

@Controller
public class CarLocationController {

	@Inject
	private CarLocationBiz biz;
	
	@RequestMapping("readCarloc.do")
	public void selectCarloc(HttpServletResponse res, @RequestParam("car_num") String car_num) {
		PrintWriter out=null;
		try {
			out = res.getWriter();
			//System.out.printf("Call servlet %s \n",car_num);
			CarLocation cloc = biz.get(car_num);
			out.println(cloc.getLat()+"/"+cloc.getLog());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NullPointerException e) {
			out.println("0");
		} finally {
			out.close();
		}
		
	}
	
	@RequestMapping("registerCarLoc.do")
	public void registerCarLoc(HttpServletResponse res, String cnum) {
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
	
	
	@RequestMapping("updateCarloc.do")
	public void updateCarloc(HttpServletResponse res, CarLocation cloc ) {
		PrintWriter out=null;
		try {
			out = res.getWriter();
			//System.out.printf("Call servlet %s \n",car_num);
			biz.modify(cloc);
			out.println("1");
			System.out.println("location call");
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
		} catch (NullPointerException e) {
			out.println("0");
		} finally {
			out.close();
		}
		
	}
	
	
}
