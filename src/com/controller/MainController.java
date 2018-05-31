package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
		
	@RequestMapping("/main.do")
	public String main(Model m) {
		m.addAttribute("center", "dash");
		return "main";
	}
	@RequestMapping("/test4.do")
	public String test4(Model m) {
		m.addAttribute("center", "test4");
		return "main";
	}
	
	@RequestMapping("/test.do")
	public String test() {
		return "test3";
	}
	
	
	@RequestMapping("/chart2.do")
	public String chart2(Model m) {
		m.addAttribute("center", "chart2");
		return "main";
	}
	@RequestMapping("/chart3.do")
	public String chart3(Model m) {
		m.addAttribute("center", "chart3");
		return "main";
	}
	/*
	@RequestMapping("/chart1impl.do")
	@ResponseBody//data를 outputstream으로 쏘겟다라는 의미
	public void chart1impl(HttpServletResponse res) throws Exception{
	      
	      Statement stmt = conn.createStatement();
	      ResultSet rs = stmt.executeQuery("select year,month,count(*) " + "from airline_delay " + "where delayyear=2006 "
	            + "and arrdelay>0 " + "group by year, month");   
	      JSONArray ja =new JSONArray();
	      JSONArray data;
	      while (rs.next()) {
	    	  data = new JSONArray();
	         data.add(rs.getInt(2)+"월");
	         data.add(rs.getInt(3));
	         // ["1월",20000]이게 또 만들어짐
	         ja.add(data);
	      }
	      res.setCharacterEncoding("EUC-KR");   
	      res.setContentType("application/json");
	      PrintWriter out =res.getWriter();
	      
	      out.print(ja.toJSONString());
	}
	@RequestMapping("/chart2impl.do")
	@ResponseBody//data를 outputstream으로 쏘겟다라는 의미
	public void chart2impl(HttpServletResponse res) throws Exception{
	      
	      Statement stmt = conn.createStatement();
	      ResultSet rs = stmt.executeQuery("select year,month,count(*) " + "from airline_delay " + "where delayyear=2006 "
	            + "and arrdelay>0 " + "group by year, month");   
	      JSONArray ja =new JSONArray();
	    
	      while (rs.next()) {
	    	  JSONObject data=new JSONObject();
	    	  data.put("name",rs.getInt(2)+"월" );
	    	  data.put("y",rs.getInt(3) );
	    	 ja.add(data);
	         // ["1월",20000]이게 또 만들어짐
	      
	      }
	      res.setCharacterEncoding("EUC-KR");   
	      res.setContentType("application/json");
	      PrintWriter out =res.getWriter();
	      
	      
	      out.print(ja.toJSONString());
	      out.close();
	}
	
	@RequestMapping("/chart3impl.do")
	   @ResponseBody
	   public void chrt3impl(HttpServletResponse res) throws Exception {
	      res.setCharacterEncoding("UTF-8");
	      res.setContentType("application/json");
	      PrintWriter out = res.getWriter();
	      JSONArray ja = new JSONArray();
	      JSONArray men_data = new JSONArray();
	      JSONArray women_data = new JSONArray();
	   
	      Statement stmt = conn.createStatement();
	      ResultSet rs = stmt.executeQuery("SELECT sex, age, SUM(rate) AS avg_rate FROM movie GROUP BY sex, age");
	      for(int i = 0; i<6; i++) {
	         rs.next();
	         men_data.add(-rs.getDouble(3));
	      }
	      for(int i = 0; i<6; i++) {
	         rs.next();
	         women_data.add(rs.getDouble(3));
	      }
	      JSONObject data = new JSONObject();
	      data.put("name", "men");
	      data.put("data", men_data);
	      ja.add(data);
	      data = new JSONObject();
	      data.put("name", "women");
	      data.put("data", women_data);
	      ja.add(data);
	      out.write(ja.toJSONString());
	      out.close();
	      stmt.close();
	      rs.close();
	   }*/
}



