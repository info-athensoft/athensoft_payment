package com.athensoft.ecomm.controller.global;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GlobalController {
	

	
	@RequestMapping("/website.do")
	public String gotoWebsite(){
		System.out.println("servlet website.do");
		return "website";
	}
	
	@RequestMapping("/website_custom.do")
	public String gotoWebsiteCustom(){
		System.out.println("servlet website_custom.do");
		return "website_custom";
	}
	
	@RequestMapping("/design.do")
	public String gotoDesign(){
		System.out.println("servlet design.do");
		return "design";
	}
	
	
	@RequestMapping("/ecomm.do")
	public String gotoEcomm(){
		System.out.println("servlet ecomm.do");
		return "ecomm";
	}
	
	@RequestMapping("/ecomm_demo.do")
	public String gotoEcommDemo(){
		System.out.println("servlet ecomm_demo.do");
		return "ecomm_demo";
	}
	
	@RequestMapping("/payment.do")
	public String gotoPayment(){
		System.out.println("servlet payment.do");
		return "payment";
	}
	
	@RequestMapping("/consulting.do")
	public String gotoConsulting(){
		System.out.println("servlet consulting.do");
		return "consulting";
	}
	
	@RequestMapping("/training.do")
	public String gotoTraining(){
		System.out.println("servlet training.do");
		return "training";
	}
	
	@RequestMapping("/affiliate.do")
	public String gotoAffiliate(){
		System.out.println("servlet affiliate.do");
		return "affiliate";
	}
	
	@RequestMapping("/contact.do")
	public String gotoContact(){
		System.out.println("servlet contact.do");
		return "contact";
	}
	
	@RequestMapping("/about.do")
	public String gotoAbout(){
		System.out.println("servlet about.do");
		return "about";
	}
}
