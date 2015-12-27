package com.athensoft.ecomm.controller.payment;

import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.athensoft.ecomm.entity.payment.BillingForm;
import com.athensoft.ecomm.entity.payment.FreightForm;
import com.athensoft.ecomm.entity.payment.ShippingForm;
import com.athensoft.ecomm.entity.shopping.ItemCart;
import com.athensoft.ecomm.service.payment.HashUtil;

@Controller
public class CheckoutProcessController {

	@RequestMapping(value="/form_billing.do",method=RequestMethod.POST,produces="application/json")
	@ResponseBody
	public Map<String,Object> doFormBilling(@RequestParam String itemJSONString){
		
		System.out.println("form_billing.do");
		
		JSONObject jason_obj= new JSONObject(itemJSONString);		
		
		BillingForm obj = new BillingForm();
		obj.setPaymentAmount(jason_obj.getString("paymentAmount"));
		obj.setCurrencyCodeType(jason_obj.getString("currencyCodeType"));
		obj.setPaymentType(jason_obj.getString("paymentType"));
		obj.setFname(jason_obj.getString("fname"));
		obj.setLname(jason_obj.getString("lname"));
		obj.setCompany(jason_obj.getString("company"));
		obj.setEmail(jason_obj.getString("email"));
		obj.setAddr1(jason_obj.getString("addr1"));
		obj.setAddr2(jason_obj.getString("addr2"));
		obj.setCity(jason_obj.getString("city"));
		obj.setProv(jason_obj.getString("prov"));
		obj.setPostal(jason_obj.getString("postal"));
		obj.setCountry(jason_obj.getString("country"));
		obj.setPhone(jason_obj.getString("phone"));
		obj.setFax(jason_obj.getString("fax"));
		
		
		
		
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = mav.getModel();
		
		model.put("billingForm", (BillingForm)obj);	
		
		return model;
	}
	
	@RequestMapping(value="/form_shipping.do",method=RequestMethod.POST,produces="application/json")
	@ResponseBody
	public Map<String,Object> doFormShipping(@RequestParam String itemJSONString){
		
		System.out.println("form_shipping.do");
		
		System.out.println("itemJSONString"+itemJSONString);
		
		
		JSONObject jason_obj= new JSONObject(itemJSONString);		
		
		System.out.println("jason_obj.getString('paymentAmount') = "+jason_obj.getString("paymentAmount"));
		
		ShippingForm obj = new ShippingForm();
		obj.setPaymentAmount(jason_obj.getString("paymentAmount"));
		obj.setCurrencyCodeType(jason_obj.getString("currencyCodeType"));
		obj.setPaymentType(jason_obj.getString("paymentType"));
		obj.setFname(jason_obj.getString("fname"));
		obj.setLname(jason_obj.getString("lname"));
		obj.setCompany(jason_obj.getString("company"));
		obj.setEmail(jason_obj.getString("email"));
		obj.setAddr1(jason_obj.getString("addr1"));
		obj.setAddr2(jason_obj.getString("addr2"));
		obj.setCity(jason_obj.getString("city"));
		obj.setProv(jason_obj.getString("prov"));
		obj.setPostal(jason_obj.getString("postal"));
		obj.setCountry(jason_obj.getString("country"));
		obj.setPhone(jason_obj.getString("phone"));
		obj.setFax(jason_obj.getString("fax"));
		
	
		System.out.println("obj.getPaymentAmount()"+obj.getPaymentAmount());
		
		
		
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = mav.getModel();
		
		model.put("shippingForm", (ShippingForm)obj);
		 
		ShippingForm sf = (ShippingForm)model.get("shippingForm");
		System.out.println("sf.paymetnAcount = "+sf.getPaymentAmount());
		return model;
	}
	
	
	@RequestMapping(value="/form_freight.do",method=RequestMethod.POST,produces="application/json")
	@ResponseBody
	public Map<String,Object> doFormFreight(@RequestParam String itemJSONString){
		
		System.out.println("form_freight.do");		
		System.out.println("itemJSONString"+itemJSONString);
		
		
		JSONObject jason_obj= new JSONObject(itemJSONString);
		
		FreightForm obj = new FreightForm();
		obj.setShipMethod((jason_obj.getString("shipMethod")));
		obj.setFreightRule((jason_obj.getString("freightRule")));
		obj.setFreightAmount(jason_obj.getDouble("freightAmount"));
		
		
		//set model
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = mav.getModel();		
		model.put("freightForm", (FreightForm)obj);
		 
		//test
		FreightForm ff = (FreightForm)model.get("freightForm");
		System.out.println("ff.getShipMethod = "+ff.getShipMethod());
		System.out.println("ff.getFreightRule = "+ff.getFreightRule());
		System.out.println("ff.getFreightAmount = "+ff.getFreightAmount());
		return model;
	}
	
	@RequestMapping(value="/cart_detail.do",method=RequestMethod.POST,produces="application/json")
	@ResponseBody
	public Map<String,Object> doCartDetail(HttpSession session){
		
		System.out.println("cart_detail.do");
		
		Map<String, ItemCart> itemCartMap = (Map<String, ItemCart>)session.getAttribute("mapProdInCart");
		Map<String, ItemCart> itemCartMapStat = (Map<String, ItemCart>)session.getAttribute("mapProdInCartStat");
		
//		request.getSession().setAttribute("Item_Amount", itemAmount);
//	    request.getSession().setAttribute("Shipping_Amount", shippingAmount);
//	    request.getSession().setAttribute("Tax_Amount", taxAmount);
//	    request.getSession().setAttribute("Handling_Amount", handlingAmount);
//	    request.getSession().setAttribute("Payment_Amount", paymentAmount);  //
		
		
		//subtotal
		String itemAmount = (String)session.getAttribute("Item_Amount");
		//tax
		String taxAmount = (String)session.getAttribute("Tax_Amount");
		//shipping fee
		String shippingFee = (String)session.getAttribute("Shipping_Amount");
		//handling fee
		String handlingFee = (String)session.getAttribute("Handling_Amount");
		//total amount (transaction)
		String paymentAmount = (String)session.getAttribute("Payment_Amount");
		
		
		//set model
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = mav.getModel();		
		model.put("itemCartMap", itemCartMap);
		model.put("itemCartMapStat", itemCartMapStat);
		
		model.put("itemAmount", itemAmount);
		model.put("taxAmount", taxAmount);
		model.put("shippingFee", shippingFee);
		model.put("handlingFee", handlingFee);
		model.put("paymentAmount", paymentAmount);
		
			 
		//test
		Iterator iter = itemCartMap.entrySet().iterator(); 
		while (iter.hasNext()) { 
		    Map.Entry entry = (Map.Entry) iter.next(); 
		    Object key = entry.getKey(); 
		    Object val = entry.getValue();
		    System.out.println(key.toString() + " = " + val.toString());
		}
		return model;
	}
	
}
