<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

<html>

<!-- i18n -->
<c:set var="loc" value="zh_CN"/>
<c:if test="${!(empty param.locale)}">
  <c:set var="loc" value="${param.locale}"/>
</c:if>
<fmt:setLocale value="${loc}" />
<!-- ENDS i18n -->

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
  	<!-- NAVBAR ================================================== -->
 	 <!-- Nav -->
	  <jsp:include page="../../nav_inc.jsp"></jsp:include>	
	  <!-- End of Nav -->

    <!-- Carousel ================================================== -->
	<div class="jumbotron">
	  <div class="container">
	    <h2><spring:message code="page.title.ecomm.myshopcart"/></h2>
		  <p>确认付款</p>
		  <p><a class="btn btn-primary btn-lg" href="contact.do" role="button"><spring:message code="btn.contact"/></a></p>
	  </div>
	</div>
	
	


	<!-- product details -->
	<div class="container">
	<div class="row">
	
		<div class="col-lg-8">
			<!-- message alert -->
			  
			  <div class="alert alert-success" role="alert" id="alert-success">
		        <strong>Congratulations!</strong> You successfully paid this order.
		      </div>
		      <div class="alert alert-danger" role="alert" id="alert-danger">
		        <strong>Sorry!</strong> Your order got failed.
		      </div>
		      <!-- 
		      <div class="alert alert-info" role="alert">
		        <strong>Heads up!</strong> This alert needs your attention, but it's not super important.
		      </div>
		      <div class="alert alert-warning" role="alert">
		        <strong>Warning!</strong> Best check yo self, you're not looking too good.
		      </div>
		       -->
		
		
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
			
			<div id="post_payment">
				<button class="btn btn-success btn-lg" onclick="doConfirmPayment();" >Confirm payment</button>
			</div>
			
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
		


		
		</div><!-- end of row -->
	</div><!-- end of container -->

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
    
    <!-- athensoft import -->
    <script type="text/javascript" src="scripts/json/json2.js"></script>
   	<script type="text/javascript" src="scripts/local/payment/pay_checkout.js"></script>
    
    <!-- athensoft local script -->
    <script>
    	$(function(){
    		$("div#navbar li").attr("class","");
    		$("li#ecomm").attr("class","active");
    		
    		//close up all alert message
    		initAlertMessage();
    	});
    </script>
    <!-- athensoft local script -->
    
    
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="scripts/ie10-viewport-bug-workaround.js"></script>
  
  	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
     <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  	
  	  ga('create', 'UA-61828003-1', 'auto');
  	  ga('send', 'pageview');
 	</script>
</body>
</html>