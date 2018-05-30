package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.carInfo.CarInfoBiz;
import com.frame.Biz;
import com.vo.CarInfo;
import com.vo.Member;

@Controller
public class MemberController {

	@Inject
	private CarInfoBiz carinfobiz;
	@Resource(name="memberBiz")
	Biz<Member, String> biz;
	
	@RequestMapping(value="login.do",method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String loginPost(Model m, String id, String pwd, HttpServletRequest request) {
		HttpSession session=request.getSession();
		HashMap<String, Object> map = new HashMap<>();
		try {
			map.put("id", id);
			map.put("pwd", pwd);
			Member itsMe = biz.login(map);
			System.out.printf("itsMe %s, %S\n",itsMe.getId(),itsMe.getPwd());
			session.setAttribute("signedUser", itsMe.getId());
			session.setAttribute("memseq", itsMe.getMember_seq());
			List<CarInfo> cinfolist = carinfobiz.listUserAll(itsMe.getMember_seq());
			session.setAttribute("carlist", cinfolist);
			return "redirect:/main.do";
		}catch (NullPointerException e) {
			System.out.println("회원정보가 없습니다");
			m.addAttribute("result","false");
			return "redirect:/login.do";
		} 
	}
	
	@RequestMapping(value="logout.do",method=RequestMethod.GET)
	public String logoutGet(Model m, String id, String pwd, HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:/login.do";
	}
	
	@RequestMapping("itsMe.do")
	public void selectMember(HttpServletResponse res, String id, String pwd) {
		HashMap<String, Object> map = new HashMap<>();
		PrintWriter out=null;
		try {
			out = res.getWriter();
			map.put("id", id);
			map.put("pwd", pwd);
			System.out.printf("Call servlet %s, %S\n",id,pwd);
			Member itsMe = biz.login(map);
			System.out.printf("itsMe %s, %S\n",itsMe.getId(),itsMe.getPwd());
			out.println(itsMe.getMember_seq());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NullPointerException e) {
			out.println("0");
		} finally {
			out.close();
		}
		
	}
	
	@RequestMapping("registerMember.do")
	public void registerMember(HttpServletResponse res, Member newbie) {
		PrintWriter out=null;
		try {
			out = res.getWriter();
			biz.register(newbie);
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
