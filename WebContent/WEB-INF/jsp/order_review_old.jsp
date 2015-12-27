<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>

<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
 
<html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Informatique Athensoft</title>
    
    <!-- Company Logo Icon -->
    <link rel="icon" href="content/ico/favicon.ico">    

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="content/css/bootstrap.min.css">
    <link rel="stylesheet" href="content/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="content/css/docs.min.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="content/css/custom/carousel.css">
    <link rel="stylesheet" href="content/css/custom/athensoft.css">
    
    <!-- Font -->
     
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
    
    <!--
    <link href="content/font/opensans-light-webfront.woff" rel='stylesheet' type='text/css'>
    <link href="content/font/opensans-light-webfront.ttf" rel='stylesheet' type='text/css'>
    <link href="content/font/opensans-light-webfront.svg" rel='stylesheet' type='text/css'>
     -->
     
    <!-- local css in page scope -->
    <style>    		
	.marketing > p{
		text-align:center;
	}
    </style>
  </head>


<body>

	<!-- 01. Navigation bar -->
	<jsp:include page="../../nav_inc.jsp"></jsp:include>
	<!-- 01. End of Navigation bar -->

	<!-- Carousel ================================================== -->
	<div class="jumbotron">
	  <div class="container">
	    <h2><spring:message code="page.title.ecomm.myshopcart"/></h2>
		  <p>一站式电商网站出租，开网店就是简单</p>
		  <p><a class="btn btn-primary btn-lg" href="contact.do" role="button"><spring:message code="btn.contact"/></a></p>
	  </div>
	</div>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- product details -->
	<div class="container">
	
	<form action="" method="post" id="form_checkout">
	
		<div class="col-lg-8">
		
			<div class="panel panel-primary">
			  
			  <div class="panel-heading"><b>Transaction Info</b></div>
			
			  
			  <table class="table">
			   	<tr><td>Payment_Amount : ${Payment_Amount}</td></tr>
				<tr><td>TOKEN :${TOKEN}</td></tr>
				<tr><td>currencyCodeType : ${currencyCodeType}</td></tr>
				<tr><td>paymentType : ${paymentType}</td></tr>
				<tr><td>PAYERID : ${PAYERID}</td></tr>
				<tr><td>requestScope.serverName : ${requestScope.serverName}</td></tr>
			  </table>
			</div>
<!-- 						
			<div class="panel panel-primary">
			  
			  <div class="panel-heading"><b>Billing Information</b></div>
			
			  
			  <table class="table">
			   	<tr>
			   		<td>First Name</td>
			   		<td><input type="text" name="bill_fname" id="bill_fname" value="BuyerOne" /></td>
			   		<td>Address</td>
			   		<td><input type="text" name="bill_addr1" id="bill_addr1" value="1 Maire-Victorin" /></td>
			   	</tr>
			   	<tr>
			   		<td>Last Name</td>
			   		<td><input type="text" name="bill_lname" id="bill_lname" value="Athens" /></td>
			   		<td></td>
			   		<td><input type="text" name="bill_addr2" id="bill_addr2" value="" /></td>
			   	</tr>
			   	<tr>
			   		<td>City</td>
			   		<td><input type="text" name="bill_city" id="bill_city" value="Toronto" /></td>
			   		<td>Province/State</td>
			   		<td><input type="text" name="bill_prov" id="bill_prov" value="Ontario" /></td>
			   	</tr>
			   	<tr>
			   		<td>Country</td>
			   		<td><input type="text" name="bill_country" id="bill_country" value="CA" /></td>
			   		<td>Postal Code/Zip Code</td>
			   		<td><input type="text" name="bill_postal" id="bill_postal" value="M5A 1E1" /></td>
			   	</tr>
			  </table>
			</div>
			
			<div class="panel panel-primary">
				
			  <div class="panel-heading"><b>Contact Information</b></div>
			  
				
			  <table class="table">
			   	<tr>
			   		<td>Email Address</td>
			   		<td><input type="text" name="bill_email" id="bill_email" value="a@b.com" /></td>
			   		<td>Tel. number</td>
			   		<td><input type="text" name="bill_phone" id="bill_phone" value="5148234567" /></td>
			   	</tr>
			   	<tr>
			   		<td>Company</td>
			   		<td><input type="text" name="bill_company" id="bill_company" value="athensoft" /></td>
			   		<td>Fax</td>
			   		<td><input type="text" name="bill_fax" id="bill_fax" value="5148234568" /></td>
			   	</tr>
			  </table>
			</div>
			
	
			<div class="panel panel-primary">
			  
			  <div class="panel-heading"><b>Payment Method</b></div>
			
			  
			  <table class="table">
			  	
			  	<tr id="paypalTitle" >
			   		<td><label name="paymentOption" id="pay_method_1">&nbsp;&nbsp;Pay by Paypal</label></td>
			   		<td><a href="javascript:void(0);" class="btn btn-primary" onclick="paypalClick(); ">Select</a></td>
			   	</tr>
			   	
			   	
			   	<tr  id="paypalContent"  style="display: none;">
			   		<td><input type="radio" value="PayPal" name="paymentOption" id="PayPal" checked="checked"/>&nbsp;&nbsp;&nbsp;paypal content</td>
			   	</tr>
			   	
			   	
			   	<tr id="creditTitle">
			   		<td>
			   			<label name="paymentOption" id="pay_method_2">&nbsp;&nbsp;Pay by Credit Card</label>
			   		</td>
			   		<td><a href="javascript:void(0);" class="btn btn-primary"  onclick="creditCardClick();">Select</a></td>
			   	</tr>
			   	
			   	
			   	<tr id="creditContent" style="display: none;">
			   		<td>	
			   			<table>
			   				<tr>
			   					<td  colspan="2">
			   						<p>
			   						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   			<input type="radio" value="Visa" name="paymentOption" id="visa" />&nbsp;&nbsp;Visa
						   			<input type="radio" value="MasterCard" name="paymentOption"/>&nbsp;&nbsp;Master Card
						   			<input type="radio" value="Discover" name="paymentOption"/>&nbsp;&nbsp;Discover
						   			<input type="radio" value="AmEx" name="paymentOption"/>&nbsp;&nbsp;American Express
						   			</p>
			   					</td>
			   				</tr>
			   				<tr>
			   					<td>
			   						<p>
			   						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Credit Card Number:
			   						</p>
			   					</td>
			   					<td>
			   						<input type="text" id="creditCardNumber" name="creditCardNumber" value="4214026703724426"/>
			   					</td>
			   				</tr>
			   				<tr>
			   					<td>
			   						<p>
			   						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Expire Date:
			   						</p>
			   					</td>
			   					<td>
			   						<input type="text" id="expDate" name="expDate" value="012020"/> (MMYYYY)
			   					</td>
			   				</tr>
			   				<tr>
			   					<td>
			   						<p>
			   						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CVV2:
			   						</p>
			   					</td>
			   					<td>
			   						<input type="text" id="cvv2" name="cvv2"  value="123"/>
			   					</td>
			   				</tr>
			   				</table>
			   		</td>
			   		
			   	</tr>
			   	<tr id="changePaymentMethodSection" style="display: none;">
			   		<td colspan="2"><a href="javascript:void(0);" class="btn btn-primary" onclick="changePaymentMethodClick(); ">Change Payment Method</a></td>
			   		<td><input type="button" class="btn btn-lg btn-success" name="btn_pay_method_cont" id="btn_pay_method_cont" value="Place your order" onclick="placeOrder();"/></td>
			   	</tr>
			   	
			  </table>
			</div>
 -->						
		</div>
		
		<div class="col-lg-4">
			<div class="panel panel-primary">
				<!-- Default panel contents -->
			  <div class="panel-heading"><b>Order Summary</b></div>
			  
				<!-- Table -->
			  <table class="table">
			  	<tr>
			   		<td><b>Cart Subtotal</b></td>
			   		<td>CDN $<c:out value="${cartSubTotal}"/></td>
			   	</tr>
			   	<tr>
			   		<td>Shipping Fee/Freight</td>
			   		<td>Free</td>
			   	</tr>
			   	<tr>
			   		<td>Handling Fee</td>
			   		<td>CDN $0</td>
			   	</tr>
			   	<tr>
			   		<td>Discount</td>
			   		<td>CDN $<c:out value="${discountAmt}"/></td>
			   	</tr>
			   	<tr>
			   		<td><b>Total before tax</b></td>
			   		<td><b>CDN $<c:out value="${orderTotal}"/></b></td>
			   	</tr>
			   	<tr>
			   		<td>Estimated GST/HST</td>
			   		<td>CDN $<c:out value="${GST_Amt}"/></td>
			   	</tr>
			   	<tr>
			   		<td>Estimated PST/RST/QST</td>
			   		<td>CDN $<c:out value="${QST_Amt}"/></td>
			   	</tr>			   	
			   	<tr>
			   		<td><b><font color="red">Order Total</font></b></td>
			   		<td><b><font color="red">CDN $<c:out value="${orderTotalWithTax}"/></font></b></td>
			   	</tr>
			  </table>
			</div>
		</div>
		
		<div>
			<!-- &nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-lg btn-success" href="#" role="button">Place your order</a> -->
			<!-- &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-lg btn-success" name="btn_pay_method_cont" id="btn_pay_method_cont" value="Place your order" onclick="placeOrder();"/> -->
		
<!-- 		
		<br/>
		itemAmount<input type="text" name="itemAmount" id="itemAmount" value='<c:out value="${orderTotal}"/>' />
		Tax_amount<input type="text" name="Tax_Amount" id="Tax_Amount" value='<c:out value="${Tax_Amount}"/>' />
		paymentAmount<input type="text" name="paymentAmount" id="paymentAmount" value='<c:out value="${orderTotalWithTax}"/>' />
		<input type="text" name="currencyCodeType" id="currencyCodeType" value="${currency}" />
		<input type="text" name="ship_method" id="ship_method" value="free_shipping" />
		<input type="text" name="paymentType" id="paymentType" value="Sale" />
 -->		
		</div>
		</form> <!-- end of form -->
		
	</div>



<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->








	<!-- content -->
	<div class="container-fluid">
		<div class="row-fluid">		
			
			<!-- view section
			<div class="span12">
			<label>Payment_Amount : ${Payment_Amount} </label><br/>
			<label>TOKEN :${TOKEN} </label><br/>
			<label>currencyCodeType : ${currencyCodeType} </label><br/>
			<label>paymentType : ${paymentType} </label><br/>
			<label>PAYERID : ${PAYERID} </label><br/>
			<label>requestScope.serverName : ${requestScope.serverName} <br/>


			<a href="do_confirm.do" class="primary btn">Confirm</a>				
				
			</div> -->
			<!-- end of view section -->		
			
					
			</div>
		</div>
	<!-- end of content -->

	
	
	<div class="container">
	<hr class="athensoft-divider2">

	  <!-- Bottom -->
	  <jsp:include page="../../bottom_inc.jsp"></jsp:include>	
	  <!-- End of Bottom -->

	  <hr class="athensoft-divider">

      <!-- FOOTER -->
      <jsp:include page="../../footer_inc.jsp"></jsp:include>
	  <!-- FOOTER -->
	</div>



    <!-- Bootstrap core JavaScript  ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="scripts/jquery.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/docs.min.js"></script>
	  	
   	<!-- End of Scripts -->
   	
   	
</body>
</html>