package com.athensoft.ecomm.controller.global;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.athensoft.ecomm.entity.shopping.ItemCart;

@Controller
public class EcommController {
	
	@RequestMapping("/ecomm_starter.do")
	public ModelAndView gotoEcommStarter(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ecomm_starter");
		
		List<ItemCart> itemProductList = new ArrayList<ItemCart>();
		ItemCart itemCart1 = new ItemCart();
		itemCart1.setItemId(1);
		itemCart1.setItemCode("code1");
		itemCart1.setItemName("3 months plan");
		itemCart1.setPrice(99);
		itemProductList.add(itemCart1);
		
		ItemCart itemCart2 = new ItemCart();
		itemCart2.setItemId(2);
		itemCart2.setItemCode("code2");
		itemCart2.setItemName("6 months plan");
		itemCart2.setPrice(171);
		itemProductList.add(itemCart2);
		
		ItemCart itemCart3 = new ItemCart();
		itemCart3.setItemId(3);
		itemCart3.setItemCode("code3");
		itemCart3.setItemName("12 months plan");
		itemCart3.setPrice(342);
		itemProductList.add(itemCart3);
		
		Map<String, Object> model = mav.getModel();
		model.put("itemProductList", itemProductList);
		
		return mav;
	}
	
	@RequestMapping("/ecomm_standard.do")
	public String gotoEcommStandard(){
		return "ecomm_standard";
	}
	
	@RequestMapping("/ecomm_term.do")
	public String gotoEcommTerm(){
		return "ecomm_term";
	}
	
}
