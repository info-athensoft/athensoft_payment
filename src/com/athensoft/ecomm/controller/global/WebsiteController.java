package com.athensoft.ecomm.controller.global;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebsiteController {
	@RequestMapping("/website_ws1.do")
	public String gotoWs1(){
		return "ws1";
	}
	
	@RequestMapping("/website_ws2.do")
	public String gotoWs2(){
		return "ws2";
	}
	
	@RequestMapping("/website_ws3.do")
	public String gotoWs3(){
		return "ws3";
	}
	
	@RequestMapping("/website_ws4.do")
	public String gotoWs4(){
		return "ws4";
	}
	
	@RequestMapping("/website_ws5.do")
	public String gotoWs5(){
		return "ws5";
	}
	
	@RequestMapping("/website_ws6.do")
	public String gotoWs6(){
		return "ws6";
	}
}
