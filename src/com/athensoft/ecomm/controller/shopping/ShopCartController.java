package com.athensoft.ecomm.controller.shopping;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.athensoft.ecomm.basic.geo.ProvinceCA;
import com.athensoft.ecomm.basic.tax.TaxRate;
import com.athensoft.ecomm.basic.tax.TaxRateFactory;
import com.athensoft.util.number.FinancialNumFormat;

@Controller
public class ShopCartController {
	
	@RequestMapping("/view_cart.do")
	public String viewCart(){
		return "shop_cart";
	}
	
	@RequestMapping("/shop_checkout.do")
	public ModelAndView gotoCheckout(HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop_checkout");
		
		//cal tax rate
		Double doubleOrderTotal = (Double)session.getAttribute("orderTotal");
		double orderTotal = doubleOrderTotal.doubleValue();
		TaxRate tr = TaxRateFactory.getTaxRate("CA");
		
		double gst = tr.getGST(ProvinceCA.QUEBEC);
		double qst = tr.getQST(ProvinceCA.QUEBEC);
		double totalTaxRate = tr.getTotalTaxRate(ProvinceCA.QUEBEC);
		double orderTotalWithTax = FinancialNumFormat.formatDoubleValue(orderTotal * (1.0 + totalTaxRate));
		double GST_Amt = FinancialNumFormat.formatDoubleValue(orderTotal * (gst));
		double QST_Amt = FinancialNumFormat.formatDoubleValue(orderTotal * (qst));
//		double Tax_Amount = GST_Amt + QST_Amt;    //forbidden to do using plus
		double Tax_Amount = FinancialNumFormat.formatDoubleValue(orderTotal * totalTaxRate);
		session.setAttribute("orderTotalWithTax", orderTotalWithTax);
		session.setAttribute("GST_Amt", GST_Amt);
		session.setAttribute("QST_Amt", QST_Amt);
		session.setAttribute("Tax_Amount", Tax_Amount);
		return mav;
	}
	
	@RequestMapping(value="/set_currency.do",method=RequestMethod.POST,produces="application/json")
	@ResponseBody
	public Map<String,Object> setCurrency(@RequestParam String currencyCode, HttpSession session){
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = mav.getModel();
		String currentCurrency =  currencyCode;
		session.setAttribute("currency", currentCurrency);
		
		model.put("currency", currentCurrency);
		return model;
	}
	
}
