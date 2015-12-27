package com.athensoft.ecomm.controller.global;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	@RequestMapping("/signin.do")
	public String gotoSignIn(){
		return "user_signin";
	}
	
	@RequestMapping("/signup.do")
	public String gotoSignUp(){
		return "user_signup";
	}
	
	@RequestMapping("/user_home.do")
	public String gotoUserHome(){
		return "user_home";
	}
}
