package com.athensoft.ecomm.controller.payment;



import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.athensoft.ecomm.entity.shopping.ItemCart;
import com.athensoft.ecomm.service.payment.HashUtil;
import com.athensoft.ecomm.service.payment.PaypalFunctions;
import com.athensoft.util.number.FinancialNumFormat;


@Controller
public class CheckoutContorller {
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/do_billing.do")	
	public ModelAndView doBilling(HttpServletRequest request, HttpServletResponse response){
		System.out.println("entering do_billing.do");
		
		ModelAndView mav = new ModelAndView();
		String viewName = "";
		
		
		String PaymentOption = "";
		PaypalFunctions payFunc = new PaypalFunctions();
		
		PaymentOption = (String)request.getParameter("paymentOption").trim();  //"PayPal";
//		PaymentOption = "PayPal";
		System.out.println("PaymentOption="+PaymentOption);
		//String PaymentProcessorSelected = "";

//	    String paymentAmount = (String)request.getParameter("paymentAmount");
	    String itemAmount = (String)request.getParameter("itemAmount");  //item amount , subtotal
	    
	    //by athens
	    String shipMethod = (String)request.getParameter("ship_method");
	    String shippingAmount  = "0.00";
	    
	    // Regular shipping Shipping - $9.95 CAD
	    if (shipMethod.equals("regular_shipping")) {
	    	shippingAmount  = "9.95";
	    }
	    if (shipMethod.equals("free_shipping") || shipMethod.equals("pick_up")) {
	    	shippingAmount  = "0.00";
	    }
	    
        String taxAmount  = (String)request.getParameter("Tax_Amount");
        taxAmount  = FinancialNumFormat.formatDoubleString(taxAmount);
//	    String taxAmount  = "40.43";
	    
	    String handlingAmount  = "0.00";
	    System.out.println("itemAmount = "+itemAmount);
	    System.out.println("taxAmount = "+taxAmount);
	    
	    double paymentAmountDoubleValue = Double.valueOf(itemAmount)+Double.valueOf(shippingAmount)+Double.valueOf(taxAmount)+Double.valueOf(handlingAmount);	    
	    String paymentAmount = FinancialNumFormat.formatDoubleString(paymentAmountDoubleValue);
	    
//	    String paymentAmount = (String)request.getParameter("paymentAmount");
	    
	    System.out.println("paymentAmount = "+paymentAmount);
	    
	    
	    request.getSession().setAttribute("Item_Amount", itemAmount);
	    request.getSession().setAttribute("Shipping_Amount", shippingAmount);
	    request.getSession().setAttribute("Tax_Amount", taxAmount);
	    request.getSession().setAttribute("Handling_Amount", handlingAmount);
	    request.getSession().setAttribute("Payment_Amount", paymentAmount);  //
	    
	    
		
		
		if (PaymentOption.equals("PayPal")){
			
			//goto paypal payment page
			viewName = "shop_checkout";	//attention, could be error handling page
			
			
			System.out.println("inside : PaymentOption="+PaymentOption);		    

			String currencyCodeType = (String)request.getParameter("currencyCodeType");
			String paymentType = (String)request.getParameter("paymentType");
			
			//!!!!!!!!!  to refine
			String returnURL = "http://localhost:8080/athensoft/order_review.do";
			String cancelURL = "http://localhost:8080/athensoft/index.jsp";
			
			String shipToName 			= "";
			String shipToStreet 		= "";
			String shipToStreet2 		= ""; 
			String shipToCity 			= "";
			String shipToState 			= "";
			String shipToCountryCode 	= ""; 
			String shipToZip 			= "";
			String phoneNum 			= "";
			
			if((String)request.getParameter("bill_select_ship_addr") == "v1"){
				//use billing address as shipping address
				shipToName 			= (String)request.getParameter("bill_fname")+" "+(String)request.getParameter("bill_lname");
				shipToStreet 		= (String)request.getParameter("bill_addr1");
				shipToStreet2 		= (String)request.getParameter("bill_addr2"); 
				shipToCity 			= (String)request.getParameter("bill_city");
				shipToState 		= (String)request.getParameter("bill_prov");
				shipToCountryCode 	= (String)request.getParameter("bill_country"); 
				shipToZip 			= (String)request.getParameter("bill_postal");
				phoneNum 			= (String)request.getParameter("bill_phone");
				
			}else if((String)request.getParameter("bill_select_ship_addr") == "v2"){
				//use shipping address
				shipToName 		= (String)request.getParameter("ship_fname")+" "+(String)request.getParameter("ship_lname");
				shipToStreet 		= (String)request.getParameter("ship_addr1");
				shipToStreet2 		= (String)request.getParameter("ship_addr2"); 
				shipToCity 			= (String)request.getParameter("ship_city");
				shipToState 		= (String)request.getParameter("ship_prov");
				shipToCountryCode 	= (String)request.getParameter("ship_country"); 
				shipToZip 			= (String)request.getParameter("ship_postal");
				phoneNum 			= (String)request.getParameter("ship_phone");
			}else{}

			/*
			'------------------------------------
			' Calls the SetExpressCheckout API call
			'--------------------------------------
			*/

			System.out.println("Begin to call CallMarkExpressCheckout");
			HttpSession session = request.getSession();	
			
			HashMap nvp = payFunc.CallMarkExpressCheckout(
					paymentAmount,
					itemAmount,
					shippingAmount,
					taxAmount,
					handlingAmount,
					currencyCodeType, 
					paymentType, 
					returnURL, 
					cancelURL,
					shipToName, 
					shipToStreet, 
					shipToStreet2, 
					shipToCity, 
					shipToState,
					shipToCountryCode, 
					shipToZip, 
					phoneNum,
					session);			
			
			String strAck = nvp.get("ACK").toString();
			if(strAck !=null && (strAck.equalsIgnoreCase("Success") || strAck.equalsIgnoreCase("SuccessWithWarning")))
			{
				//Redirect to paypal.com
				payFunc.RedirectURL(nvp.get("TOKEN").toString(), response);
//				String path = payFunc.getPaypalURL() + nvp.get("TOKEN").toString();
//				response.sendRedirect(path);
//				response.setHeader("Connection", "close");
				
				Map<String,ItemCart> mapProdInCart = (HashMap<String,ItemCart>)(session.getAttribute("mapProdInCart"));
				Map<String,Boolean> mapProdInCartStat = (HashMap<String,Boolean>)(session.getAttribute("mapProdInCartStat"));
				if(mapProdInCart!=null){
					mapProdInCart.clear();
					mapProdInCartStat.clear();
					session.setAttribute("mapProdInCart", mapProdInCart);
					session.setAttribute("mapProdInCartStat", mapProdInCartStat);
				}
				
			}else{  
				String ErrorCode = nvp.get("L_ERRORCODE0").toString();
				String ErrorShortMsg = nvp.get("L_SHORTMESSAGE0").toString();
				String ErrorLongMsg = nvp.get("L_LONGMESSAGE0").toString();
				String ErrorSeverityCode = nvp.get("L_SEVERITYCODE0").toString();
				
				System.out.println("ErrorCode = "+ErrorCode);
				System.out.println("ErrorShortMsg = "+ErrorShortMsg);
				System.out.println("ErrorLongMsg = "+ErrorLongMsg);
				System.out.println("ErrorSeverityCode = "+ErrorSeverityCode);
			}
			
			System.out.println("End to call CallMarkExpressCheckout");
			
		}//end of if paymentOption="paypal"
		
		/* credit card payment method */
		else{				
			
			System.out.println("Credit Card Process");
			
			/* return URL */
//			viewName = "redirect:/ecomm.do"; 
//			viewName = "order_review_creditcard";	//by Athens 2015-10-25
			viewName = "redirect:/order_review_creditcard.do";	//by Athens 2015-11-01
			
			
			
			final String PaymentProcessorSelected = "PayPal Direct Payment";
			
			System.out.println("PaymentOption = "+PaymentOption);
			PaymentOption = PaymentOption.trim();
			boolean flag = PaymentOption.equals("Visa");
			System.out.println("flag="+flag);
			
			if (((PaymentOption.equals("Visa"))||
				(PaymentOption.equals("MasterCard"))||
				(PaymentOption.equals("Discover"))||
				(PaymentOption.equals("AmEx"))) 
				&&(PaymentProcessorSelected.equals("PayPal Direct Payment")))
			 {
				
				System.out.println("Credit Card Process - if()");
				/*		
				'------------------------------------
				' The paymentAmount is the total value of 
				' the shopping cart, that was set 
				' earlier in a session variable 
				' by the shopping cart page
				'------------------------------------
				*/
//				String paymentAmount = (String)request.getParameter("paymentAmount");
//				request.getSession().setAttribute("Payment_Amount", paymentAmount);  //

				/*
				'------------------------------------
				' The paymentType that was selected earlier 
				'------------------------------------
				*/
				String paymentType = "Sale";
				
				/*
				' Set these values based on what was selected by the user on the Billing page Html form
				*/
			/*	
				String creditCardType 		= "<<Visa/MasterCard/Amex/Discover>>"; //' Set this to one of the acceptable values (Visa/MasterCard/Amex/Discover) match it to what was selected on your Billing page
				String creditCardNumber 	= "<<CC number>>"; // ' Set this to the string entered as the credit card number on the Billing page
				String expDate 				= "<<Expiry Date>>"; // ' Set this to the credit card expiry date entered on the Billing page
				String cvv2 				= "<<cvv2>>"; // ' Set this to the CVV2 string entered on the Billing page 
				String firstName 			= "<<firstName>>"; // ' Set this to the customer's first name that was entered on the Billing page 
				String lastName 			= "<<lastName>>"; // ' Set this to the customer's last name that was entered on the Billing page 
				String street 				= "<<street>>"; // ' Set this to the customer's street address that was entered on the Billing page 
				String city 				= "<<city>>"; // ' Set this to the customer's city that was entered on the Billing page 
				String state 				= "<<state>>"; // ' Set this to the customer's state that was entered on the Billing page 
				String zip 					= "<<zip>>"; // ' Set this to the zip code of the customer's address that was entered on the Billing page 
				String countryCode 			= "<<PayPal Country Code>>"; // ' Set this to the PayPal code for the Country of the customer's address that was entered on the Billing page 
				String currencyCode 		= "<<PayPal Currency Code>>"; // ' Set this to the PayPal code for the Currency used by the customer 
				String IPAddress 			= request.getRemoteAddr(); // Clients IP Address. Required parameter for this API call
			*/	
				
				String creditCardType 		= (String)request.getParameter("paymentOption"); //' Set this to one of the acceptable values (Visa/MasterCard/Amex/Discover) match it to what was selected on your Billing page
				String creditCardNumber 	= (String)request.getParameter("creditCardNumber"); // ' Set this to the string entered as the credit card number on the Billing page
				String expDate 				= (String)request.getParameter("expDate"); // ' Set this to the credit card expiry date entered on the Billing page
				String cvv2 				= (String)request.getParameter("cvv2"); // ' Set this to the CVV2 string entered on the Billing page 
				
				String firstName 			= (String)request.getParameter("bill_fname"); // ' Set this to the customer's first name that was entered on the Billing page 
				String lastName 			= (String)request.getParameter("bill_lname"); // ' Set this to the customer's last name that was entered on the Billing page 
				String street 				= (String)request.getParameter("bill_addr1") + " " + (String)request.getParameter("bill_addr2"); // ' Set this to the customer's street address that was entered on the Billing page 
				String city 				= (String)request.getParameter("bill_city"); // ' Set this to the customer's city that was entered on the Billing page 
				String state 				= (String)request.getParameter("bill_prov"); // ' Set this to the customer's state that was entered on the Billing page 
				String zip 					= (String)request.getParameter("bill_postal"); // ' Set this to the zip code of the customer's address that was entered on the Billing page 
				String countryCode 			= (String)request.getParameter("bill_country"); // ' Set this to the PayPal code for the Country of the customer's address that was entered on the Billing page 
				String currencyCode 		= (String)request.getParameter("currencyCodeType"); // ' Set this to the PayPal code for the Currency used by the customer
				String IPAddress 			= request.getRemoteAddr(); // Clients IP Address. Required parameter for this API call
				
				/*	
				'------------------------------------------------
				' Calls the DoDirectPayment API call
				'
				' The DirectPayment function is defined in PayPalFunctions.jsp 
				' included at the top of this file.
				'-------------------------------------------------
				*/
				
				/**
				 * test params
				 * 
				 */
				
				System.out.println("paymentType:"+paymentType);
				System.out.println("paymentAmount:"+paymentAmount);
				System.out.println("itemAmount:"+itemAmount);
				System.out.println("shippingAmount:"+shippingAmount);
				System.out.println("taxAmount:"+taxAmount);
				System.out.println("handlingAmount:"+handlingAmount);
				System.out.println("creditCardType:"+creditCardType);
				System.out.println("creditCardNumber:"+creditCardNumber);
				System.out.println("expDate:"+expDate);
				System.out.println("cvv2:"+cvv2);
				System.out.println("firstName:"+firstName);
				System.out.println("lastName:"+lastName);
				System.out.println("street:"+street);
				System.out.println("city:"+city);
				System.out.println("state:"+state);
				System.out.println("zip:"+zip);
				System.out.println("countryCode:"+countryCode);
				System.out.println("currencyCode:"+currencyCode);
				System.out.println("IPAddress:"+IPAddress);
				
				HashMap nvp = payFunc.DirectPayment ( paymentType, paymentAmount, itemAmount, shippingAmount, taxAmount, handlingAmount,
											creditCardType, creditCardNumber, expDate, cvv2, 
											firstName, lastName, street, city, state, zip, countryCode, 
											currencyCode, IPAddress ); 

				String strAck = nvp.get("ACK").toString();
				
				System.out.println("nvp returned from DirectPayment");
				HashUtil.printHashMap(nvp);
				System.out.println("strAck="+strAck);
				
				if(strAck!=null && ( strAck.equalsIgnoreCase("Success") || strAck.equalsIgnoreCase("SuccessWithWarning")) )
				{
					
					System.out.println("Success!");
					//response.sendRedirect("index.jsp");
					//try {						
						//response.sendRedirect("do_review.do");
						//response.setHeader("Connection", "close");	
						//HashUtil.printHashMap(nvp);
					//} catch (IOException e) {
					//	e.printStackTrace();
					//}	
					
					HttpSession session = request.getSession();
					Map<String,ItemCart> mapProdInCart = (HashMap<String,ItemCart>)(session.getAttribute("mapProdInCart"));
					Map<String,Boolean> mapProdInCartStat = (HashMap<String,Boolean>)(session.getAttribute("mapProdInCartStat"));
					if(mapProdInCart!=null){
						mapProdInCart.clear();
						mapProdInCartStat.clear();
//						session.setAttribute("mapProdInCart", mapProdInCart);
//						session.setAttribute("mapProdInCartStat", mapProdInCartStat);
						
					
						
						session.removeAttribute("mapProdInCart");      //clear out shopping cart in session
				    	session.removeAttribute("mapProdInCartStat");  //clear out shopping cart in session
					}
					
				}else{
					// Display a user friendly Error on the page using any of the following error information returned by PayPal
					String ErrorCode = nvp.get("L_ERRORCODE0").toString();
					String ErrorShortMsg = nvp.get("L_SHORTMESSAGE0").toString();
					String ErrorLongMsg = nvp.get("L_LONGMESSAGE0").toString();
					String ErrorSeverityCode = nvp.get("L_SEVERITYCODE0").toString();
					
					System.out.println("ErrorCode = "+ErrorCode);
					System.out.println("ErrorShortMsg = "+ErrorShortMsg);
					System.out.println("ErrorLongMsg = "+ErrorLongMsg);
					System.out.println("ErrorSeverityCode = "+ErrorSeverityCode);
				}
			  }
			
		}		
		mav.setViewName(viewName);		
		return mav;
	}

	

	@SuppressWarnings("rawtypes")
	@RequestMapping("/order_review.do")	
	public ModelAndView orderReview(HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("do_review.do");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order_review");
		
		PaypalFunctions payFunc = new PaypalFunctions();
		HttpSession session = request.getSession();	
		
		System.out.println(session.getAttributeNames().toString());
		
		HashMap nvp = payFunc.GetShippingDetails((String)session.getAttribute("TOKEN"), session);
		
		//for debug
		HashUtil.printHashMap(nvp);		 
		
		return mav;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/order_review_creditcard.do")	
	public ModelAndView orderReviewCC(HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("order_review_creditcard.do");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order_review_creditcard");
		
		PaypalFunctions payFunc = new PaypalFunctions();
		HttpSession session = request.getSession();	
		
		System.out.println(session.getAttributeNames().toString());
		
		HashMap nvp = payFunc.GetShippingDetails((String)session.getAttribute("TOKEN"), session);
		
		//put to session for front-end
		Map<String,Object> model = mav.getModel();
		model.put("shipping_details_hashmap",nvp);
		
		//for debug
		HashUtil.printHashMap(nvp);
		
		
		
		return mav;
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/do_confirm.do", method=RequestMethod.POST, produces="application/json")	
	@ResponseBody
	public Map<String,Object> doConfirm(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
//		mav.setViewName("shopping_products");
		
		/*
		 * return url modified on 2015-10-04 by Sun.  
		 */
//		mav.setViewName("redirect:/ecomm.do");
		
		//mav.setViewName("redirect:/");
		
		PaypalFunctions payFunc = new PaypalFunctions();
		HttpSession session = request.getSession();
		
		//test
		System.out.println("session="+session);
		System.out.println("request="+request);
		System.out.println("Payment_Amount="+(String)session.getAttribute("Payment_Amount"));
		
		
		
		HashMap res = payFunc.ConfirmPayment(/*(String)session.getAttribute("Payment_Amount"),*/session,request);
	    String strAck = (String)res.get("ACK");
	    System.out.println("aaaaaaaaaaaaa  "+strAck);
	    
	    //put to model
	    Map<String, Object> model = mav.getModel();
	    model.put("Payment_Ack",strAck);
	    
	    
	    /*
	    PrintWriter out = response.getWriter();
	     */
	    
	    /*clear out shoppoing cart when paid successfully*/
	    if(strAck.equalsIgnoreCase("Success") || strAck.equalsIgnoreCase("SuccessWithWarning")){
	    	System.out.println("paid");
	    	
	    	//before test
	    	System.out.println("before confirm ");
	    	 Map<String, ItemCart> itemCartList = (Map<String, ItemCart>)session.getAttribute("mapProdInCart");
             
             //list
             Iterator<Map.Entry<String,ItemCart>> entries = itemCartList.entrySet().iterator();
             while (entries.hasNext()) {
             	Entry<String, ItemCart> thisEntry = (Entry<String, ItemCart>)entries.next();
             	String key = thisEntry.getKey();
             	ItemCart itemCartEntry = thisEntry.getValue();
             	System.out.println("item cart list : "+key+" "+itemCartEntry.getItemName()+","+itemCartEntry.getItemCode()+","+itemCartEntry.getItemDesc());
	    	
             }
             	       	
             
	    	session.removeAttribute("mapProdInCart");      //clear out shopping cart in session
	    	session.removeAttribute("mapProdInCartStat");  //clear out shopping cart in session
	    	
	    	//after test
	    	/*
	    	System.out.println("after confirm ");
	    	itemCartList = (Map<String, ItemCart>)session.getAttribute("mapProdInCart");
            
            //list
            entries = itemCartList.entrySet().iterator();
            while (entries.hasNext()) {
            	Entry<String, ItemCart> thisEntry = (Entry<String, ItemCart>)entries.next();
            	String key = thisEntry.getKey();
            	ItemCart itemCartEntry = thisEntry.getValue();
            	System.out.println("item cart list : "+key+" "+itemCartEntry.getItemName()+","+itemCartEntry.getItemCode()+","+itemCartEntry.getItemDesc());
	    	
            }*/
	    	
	    	
	    	
	    }else{
	    	System.out.print(strAck);
	    }
	   	    
	   // response.sendRedirect("index.jsp");	 
		
	    
	    
		return model;
	}
	
}
