package com.athensoft.ecomm.service.payment;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.athensoft.ecomm.entity.shopping.ItemCart;

public class PaypalFunctions {
	
	//api info
	String gv_APIEndpoint;	
	String gv_APIUserName;
	String gv_APIPassword;
	String gv_APISignature;
	String gv_BNCode;
	
	String gv_Version;
	String gv_nvpHeader;
	
	//connection info	
	String gv_ProxyServer;	
	String gv_ProxyServerPort; 
	int    gv_Proxy;
	boolean gv_UseProxy;
	
	String PAYPAL_URL;
	
	
	public PaypalFunctions(){
		init();
	}
	
	public String getPaypalURL(){
		return this.PAYPAL_URL;
	}
	
	
	private void init(){
		gv_APIUserName	= "merchant01_api1.athensoft.com";
		gv_APIPassword	= "DWGQQFHCPKDC4SVA";
		gv_APISignature = "ASIJVB0Yp1sFI1Jsw9Yupm0LbwpPAXmUbOrjuemaKsFQo-8vB-darShw";
		
		gv_BNCode		= "PP-ECWizard";  //BN Code is only applicable for partners
		
		boolean bSandbox = true;

		if (bSandbox == true){
			gv_APIEndpoint = "https://api-3t.sandbox.paypal.com/nvp";
			PAYPAL_URL = "https://www.sandbox.paypal.com/webscr?cmd=_express-checkout&token=";
		}else{
			gv_APIEndpoint = "https://api-3t.paypal.com/nvp";
			PAYPAL_URL = "https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=";
		} 

		String HTTPREQUEST_PROXYSETTING_SERVER = "127.0.0.1";
		String HTTPREQUEST_PROXYSETTING_PORT = "808";
		boolean USE_PROXY = false;
		
		gv_Version	= "123";  
//		gv_Version	= "93";  
		
		//WinObjHttp Request proxy settings.
		gv_ProxyServer		= HTTPREQUEST_PROXYSETTING_SERVER;
		gv_ProxyServerPort 	= HTTPREQUEST_PROXYSETTING_PORT;
		gv_Proxy			= 2;	//'setting for proxy activation
		gv_UseProxy			= USE_PROXY;
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public HashMap CallShortcutExpressCheckout(
			String paymentAmount, 
			String currencyCodeType, 
			String paymentType, 
			String returnURL, 
			String cancelURL,
			HttpSession session)
	{
	
		session.setAttribute("paymentType", paymentType);
		session.setAttribute("currencyCodeType", currencyCodeType);
		
		/* 
		Construct the parameter string that describes the PayPal payment
		the varialbes were set in the web form, and the resulting string
		is stored in $nvpstr
		*/
		String nvpstr = "";
		try{
			   nvpstr = "&PAYMENTREQUEST_0_AMT=" + paymentAmount 
				      + "&PAYMENTREQUEST_0_PAYMENTACTION=" + paymentType 
				      + "&ReturnUrl=" + URLEncoder.encode(returnURL,"utf-8") 
				      + "&CANCELURL=" + URLEncoder.encode(cancelURL,"utf-8") 
				      + "&PAYMENTREQUEST_0_CURRENCYCODE=" + currencyCodeType;
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		
		
		/* 
		Make the call to PayPal to get the Express Checkout token
		If the API call succeded, then redirect the buyer to PayPal
		to begin to authorize payment.  If an error occured, show the
		resulting errors
		*/		
		HashMap nvp = httpcall("SetExpressCheckout", nvpstr);
		
		String strAck = nvp.get("ACK").toString();
		if(strAck !=null && strAck.equalsIgnoreCase("Success"))	{
			session.setAttribute("TOKEN", nvp.get("TOKEN").toString());
		}
		
		return nvp;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap CallMarkExpressCheckout( 
			String paymentAmount,
			String itemAmount,
			String shippingAmt,
			String taxAmount,
			String handlingAmount,
			String currencyCodeType, 
			String paymentType, 
			String returnURL,	
			String cancelURL, 
			String shipToName, 
			String shipToStreet,
			String shipToStreet2,			
			String shipToCity,
			String shipToState,
			String shipToCountryCode, 
			String shipToZip, 
			String phoneNum,			
			HttpSession session)
	{

		session.setAttribute("Payment_Amount", paymentAmount);
		session.setAttribute("paymentType", paymentType);
		session.setAttribute("currencyCodeType", currencyCodeType);
		
		/* 
		Construct the parameter string that describes the PayPal payment
		the varialbes were set in the web form, and the resulting string
		is stored in $nvpStr
		*/
	    String nvpStr = "";
	    try{
	    		nvpStr="ADDROVERRIDE=1"
	    		      + "&PAYMENTREQUEST_0_AMT=" + paymentAmount
	    		      + "&PAYMENTREQUEST_0_ITEMAMT=" + itemAmount	    		      
	    		      + "&PAYMENTREQUEST_0_SHIPPINGAMT=" + shippingAmt	 
	    		      + "&PAYMENTREQUEST_0_TAXAMT=" + taxAmount	
	    		      + "&PAYMENTREQUEST_0_HANDLINGAMT=" + handlingAmount	    		      
	    		      + "&PAYMENTREQUEST_0_PAYMENTACTION=" + paymentType
		              + "&PAYMENTREQUEST_0_CURRENCYCODE=" + currencyCodeType 
		              + "&ReturnUrl=" + URLEncoder.encode( returnURL,"utf-8")
		              + "&CANCELURL=" + URLEncoder.encode( cancelURL,"utf-8" )
//		              + "&ReturnUrl=" + URLEncoder.encode( returnURL)
//		              + "&CANCELURL=" + URLEncoder.encode( cancelURL )
		              + "&PAYMENTREQUEST_0_SHIPTONAME=" + shipToName 
		              + "&PAYMENTREQUEST_0_SHIPTOSTREET=" + shipToStreet 
		              + "&PAYMENTREQUEST_0_SHIPTOSTREET2=" + shipToStreet2
		              + "&PAYMENTREQUEST_0_SHIPTOCITY=" + shipToCity 
		              + "&PAYMENTREQUEST_0_SHIPTOSTATE=" + shipToState 
		              + "&PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE=" + shipToCountryCode
		              + "&PAYMENTREQUEST_0_SHIPTOZIP=" + shipToZip 
		              + "&PAYMENTREQUEST_0_SHIPTOPHONENUM=" + phoneNum;
		
		        //test
	    		//System.out.println("total amount="+String.valueOf((Double.valueOf(paymentAmount)+10.0)));
	    		
	    		
		              //get itemCartList in session
		              Map<String, ItemCart> itemCartList = (Map<String, ItemCart>)session.getAttribute("mapProdInCart");
		              
		              //list
		              Iterator<Map.Entry<String,ItemCart>> entries = itemCartList.entrySet().iterator();
		      		  int i=0;
		              while (entries.hasNext()) {
		              	Entry<String, ItemCart> thisEntry = (Entry<String, ItemCart>)entries.next();
//		              	String key = thisEntry.getKey();
		              	ItemCart itemCartEntry = thisEntry.getValue();
//		              	System.out.println("item cart list : "+key+" "+itemCartEntry.getItemName()+","+itemCartEntry.getItemCode()+","+itemCartEntry.getItemDesc());
		              	nvpStr  +="&L_PAYMENTREQUEST_0_NAME"	+i+"="+URLEncoder.encode(itemCartEntry.getItemName(), "utf-8")
		              			+ "&L_PAYMENTREQUEST_0_NUMBER"	+i+"="+itemCartEntry.getItemCode()
		              			+ "&L_PAYMENTREQUEST_0_DESC"	+i+"="+URLEncoder.encode(itemCartEntry.getItemDesc(), "utf-8")
		              			+ "&L_PAYMENTREQUEST_0_AMT"		+i+"="+itemCartEntry.getPrice()
		              			+ "&L_PAYMENTREQUEST_0_QTY"		+i+"="+itemCartEntry.getQty();
		              	i++; //item sequence number in paypal order view
		              }
		              
		              //transfer to queryString 
		              
		              
		              
		              
		              //order details display when checkout at Paypal.com
//					  +"&L_PAYMENTREQUEST_0_NAME0=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER0=623083&L_PAYMENTREQUEST_0_DESC0=Size: 8.0-oz&L_PAYMENTREQUEST_0_AMT0=2&L_PAYMENTREQUEST_0_QTY0=1"
//					  +"&L_PAYMENTREQUEST_0_NAME1=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER1=623083&L_PAYMENTREQUEST_0_DESC1=Size: 8.1-oz&L_PAYMENTREQUEST_0_AMT1=1&L_PAYMENTREQUEST_0_QTY1=1"
//					  +"&L_PAYMENTREQUEST_0_NAME2=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER2=623083&L_PAYMENTREQUEST_0_DESC2=Size: 8.2-oz&L_PAYMENTREQUEST_0_AMT2=1&L_PAYMENTREQUEST_0_QTY2=1"
//					  +"&L_PAYMENTREQUEST_0_NAME3=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER3=623083&L_PAYMENTREQUEST_0_DESC3=Size: 8.3-oz&L_PAYMENTREQUEST_0_AMT3=1&L_PAYMENTREQUEST_0_QTY3=1"
//					  +"&L_PAYMENTREQUEST_0_NAME4=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER4=623083&L_PAYMENTREQUEST_0_DESC4=Size: 8.4-oz&L_PAYMENTREQUEST_0_AMT4=1&L_PAYMENTREQUEST_0_QTY4=1"
//					  +"&L_PAYMENTREQUEST_0_NAME5=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER5=623083&L_PAYMENTREQUEST_0_DESC5=Size: 8.5-oz&L_PAYMENTREQUEST_0_AMT5=1&L_PAYMENTREQUEST_0_QTY5=1"
//					  +"&L_PAYMENTREQUEST_0_NAME6=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER6=623083&L_PAYMENTREQUEST_0_DESC6=Size: 8.6-oz&L_PAYMENTREQUEST_0_AMT6=1&L_PAYMENTREQUEST_0_QTY6=1"
//					  +"&L_PAYMENTREQUEST_0_NAME7=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER7=623083&L_PAYMENTREQUEST_0_DESC7=Size: 8.7-oz&L_PAYMENTREQUEST_0_AMT7=1&L_PAYMENTREQUEST_0_QTY7=1"
//					  +"&L_PAYMENTREQUEST_0_NAME8=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER8=623083&L_PAYMENTREQUEST_0_DESC8=Size: 8.8-oz&L_PAYMENTREQUEST_0_AMT8=1&L_PAYMENTREQUEST_0_QTY8=1"
//					  +"&L_PAYMENTREQUEST_0_NAME9=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER9=623083&L_PAYMENTREQUEST_0_DESC9=Size: 8.9-oz&L_PAYMENTREQUEST_0_AMT9=1&L_PAYMENTREQUEST_0_QTY9=1"
//					  +"&L_PAYMENTREQUEST_0_NAME10=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER10=623083&L_PAYMENTREQUEST_0_DESC10=Size: 8.10-oz&L_PAYMENTREQUEST_0_AMT10=1&L_PAYMENTREQUEST_0_QTY10=1"
//					  +"&L_PAYMENTREQUEST_0_NAME11=10% Decaf Kona Blend Coffee&L_PAYMENTREQUEST_0_NUMBER11=623083&L_PAYMENTREQUEST_0_DESC11=Size: 8.11-oz&L_PAYMENTREQUEST_0_AMT11=1&L_PAYMENTREQUEST_0_QTY11=1";
		
		System.out.println("nvpStr="+nvpStr);
	    }catch(UnsupportedEncodingException e){
	    	e.printStackTrace();
	    }
		/* 
		Make the call to PayPal to set the Express Checkout token
		If the API call succeeded, then redirect the buyer to PayPal
		to begin to authorize payment.  If an error occurred, show the
		resulting errors
		*/
		
	    HashMap nvp = httpcall("SetExpressCheckout", nvpStr);
	    HashUtil.printHashMap(nvp);
		
		
		String strAck = nvp.get("ACK").toString();
	    if(strAck !=null && (strAck.equalsIgnoreCase("Success") || strAck.equalsIgnoreCase("SuccessWithWarning"))){
			session.setAttribute("TOKEN", nvp.get("TOKEN").toString());
		}			
		return nvp;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap GetShippingDetails(String token, HttpSession session)
	{
		/* 
		Build a second API request to PayPal, using the token as the
		ID to get the details on the payment authorization
		*/
	    
		String nvpstr= "&TOKEN=" + token;

	   /*
	    Make the API call and store the results in an array.  If the
		call was a success, show the authorization details, and provide
		an action to complete the payment.  If failed, show the error
		*/
	    
		HashMap nvp = httpcall("GetExpressCheckoutDetails", nvpstr);
		HashUtil.printHashMap(nvp);
		
		String strAck = nvp.get("ACK").toString();
	    if(strAck !=null && (strAck.equalsIgnoreCase("Success") || strAck.equalsIgnoreCase("SuccessWithWarning"))){
			session.setAttribute("PAYERID", nvp.get("PAYERID").toString());
		}			
		return nvp;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap ConfirmPayment(/*String finalPaymentAmount,*/ HttpSession session, HttpServletRequest request)
	{

		/*
		'----------------------------------------------------------------------------
		'----	Use the values stored in the session from the previous SetEC call	
		'----------------------------------------------------------------------------
		*/
		String token 			=  session.getAttribute("TOKEN").toString();
		String currencyCodeType	=  session.getAttribute("currencyCodeType").toString();
		String paymentType 		=  session.getAttribute("paymentType").toString();
		String payerID 			=  session.getAttribute("PAYERID").toString();
		String serverName 		=  request.getServerName();
		
		// get from session
		String finalPaymentAmount = (String)session.getAttribute("Payment_Amount");
		String finalItemAmount = (String)session.getAttribute("Item_Amount");
		String finalShippingAmount = (String)session.getAttribute("Shipping_Amount");
		String finalTaxAmount = (String)session.getAttribute("Tax_Amount");
		String finalHandlingAmount = (String)session.getAttribute("Handling_Amount");
		
		String nvpstr  = "&TOKEN=" 							+ token 
				       + "&PAYERID=" 						+ payerID 
				       + "&PAYMENTREQUEST_0_PAYMENTACTION=" + paymentType 
				       + "&PAYMENTREQUEST_0_AMT=" 			+ finalPaymentAmount
				       + "&PAYMENTREQUEST_0_ITEMAMT=" 		+ finalItemAmount
				       + "&PAYMENTREQUEST_0_SHIPPINGAMT=" 	+ finalShippingAmount
				       + "&PAYMENTREQUEST_0_TAXAMT=" 		+ finalTaxAmount
				       + "&PAYMENTREQUEST_0_HANDLINGAMT="   + finalHandlingAmount
				       + "&PAYMENTREQUEST_0_CURRENCYCODE=" 	+ currencyCodeType 
				       + "&IPADDRESS=" 						+ serverName;
		
	    /* 
		Make the call to PayPal to finalize payment
		If an error occured, show the resulting errors
	    */
		HashMap nvp = httpcall("DoExpressCheckoutPayment", nvpstr);	    
	    HashUtil.printHashMap(nvp);
		
		return nvp;
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap DirectPayment (
			String paymentType, 
			String paymentAmount,
			String itemAmount,
			String shippingAmount,
			String taxAmount,
			String handlingAmount,
			String creditCardType, 
			String creditCardNumber, 
			String expDate, 
			String cvv2,
			String firstName, 
			String lastName, 
			String street, 
			String city, 
			String state, 
			String zip, 
			String countryCode,
	        String currencyCode, 
	        String IPAddress)
	{
		String nvpStr = "Amt=" 				+ paymentAmount 
					  + "&ITEMAMT=" 	    + itemAmount 
					  + "&SHIPPINGAMT=" 	+ shippingAmount	
					  + "&TAXAMT=" 	        + taxAmount	
					  + "&HANDLINGAMT=" 	+ handlingAmount
					  + "&PAYMENTACTION=" 	+ paymentType					   
					  + "&CREDITCARDTYPE=" 	+ creditCardType 
					  + "&ACCT=" 		 	+ creditCardNumber 
					  + "&EXPDATE=" 	 	+ expDate 
					  + "&CVV2="		 	+ cvv2		
					  + "&FIRSTNAME=" 		+ firstName 
					  + "&LASTNAME=" 		+ lastName 
					  + "&STREET="	 		+ street 
					  + "&CITY=" 			+ city 
					  + "&STATE=" 			+ state 
					  + "&COUNTRYCODE=" 	+ countryCode 
					  + "&ZIP=" 			+ zip 
					  + "&CURRENCYCODE=" 	+ currencyCode
					  + "&IPADDRESS=" 		+ IPAddress;
		
		return httpcall("DoDirectPayment", nvpStr);
	}
	
	@SuppressWarnings("rawtypes")
	public HashMap httpcall( String methodName, String nvpStr)
	{
		
		//String version 	= "2.3";
		String agent 	= "Mozilla/4.0";
		String respText = "";
		HashMap nvp		= null;

		//deformatNVP( nvpStr );	
		String encodedData = "METHOD=" 			+ methodName 
						   + "&VERSION=" 		+ gv_Version 
						   + "&PWD=" 			+ gv_APIPassword 
						   + "&USER=" 			+ gv_APIUserName 
						   + "&SIGNATURE=" 		+ gv_APISignature 						   
						   + "&BUTTONSOURCE=" 	+ gv_BNCode
						   + "&" 		   		+ nvpStr ;
		
		System.out.println("httpcall() - encodeData = "+encodedData);
		
		try 
		{
			URL postURL = new URL(gv_APIEndpoint);
			HttpURLConnection conn = (HttpURLConnection)postURL.openConnection();

			// Set connection parameters. We need to perform input and output, 
	        // so set both as true. 
			conn.setDoInput (true);
			conn.setDoOutput (true);

			// Set the content type we are POSTing. We impersonate it as 
			// encoded form data 
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setRequestProperty( "User-Agent", agent );

			//conn.setRequestProperty( "Content-Type", type );
			conn.setRequestProperty( "Content-Length", String.valueOf(encodedData.length()));
			conn.setRequestMethod("POST");
			
	        // get the output stream to POST to. 
			DataOutputStream output = new DataOutputStream( conn.getOutputStream());
			output.writeBytes( encodedData );
			output.flush();
	        output.close();
			
			// Read input from the input stream.
			//DataInputStream  in = new DataInputStream (conn.getInputStream()); 
	    	int rc = conn.getResponseCode();
			if ( rc != -1)
			{
				BufferedReader is = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String _line = null;
				while(((_line = is.readLine()) !=null))
				{
					respText = respText + _line;
				}			
				nvp = deformatNVP(respText);
			}
			return nvp;
		}
		catch( IOException e )
		{
			// handle the error here
			return null;
		}
	}
	
	public HashMap<String,String> deformatNVP(String pPayload)
	{
		HashMap<String,String> nvp = new HashMap<String,String>(); 
		StringTokenizer stTok = new StringTokenizer(pPayload, "&");
		
		while (stTok.hasMoreTokens()) {
			StringTokenizer stInternalTokenizer = new StringTokenizer( stTok.nextToken(), "=");
			if (stInternalTokenizer.countTokens() == 2)	{
				
				//using new API for URLDecoder.decode()
//				String key 	 = URLDecoder.decode(stInternalTokenizer.nextToken());
//				String value = URLDecoder.decode(stInternalTokenizer.nextToken());
				
				String key = "";
				String value = "";
				try {
					key = URLDecoder.decode(stInternalTokenizer.nextToken(),"utf-8");
					value = URLDecoder.decode(stInternalTokenizer.nextToken(),"utf-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				nvp.put(key.toUpperCase(), value);
			}
		}//end of while-loop
		return nvp;
	}
	
	public void RedirectURL(String token, HttpServletResponse response)
	{
		String payPalURL = PAYPAL_URL + token; 
		
		//response.sendRedirect( payPalURL );
		response.setStatus(302);
		response.setHeader( "Location", payPalURL );
		response.setHeader( "Connection", "close" );
	}
}
