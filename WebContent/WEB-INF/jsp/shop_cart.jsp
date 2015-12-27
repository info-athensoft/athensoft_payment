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
		  <p>一站式电商网站出租，开网店就是简单</p>
		  <p><a class="btn btn-primary btn-lg" href="contact.do" role="button"><spring:message code="btn.contact"/></a></p>
	  </div>
	</div>
	
	


	<!-- product in cart -->
	<div class="container">

		<div class="col-lg-8">
			<div class="panel panel-primary">
			  <!-- Default panel contents -->
			  <div class="panel-heading"><b>Product List</b></div>
			
			  <!-- Table -->
			  <table class="table">
			   <tr>
			   		<th>Code</td>
			   		<th>Product Name</td>
			   		<th>Price</th>
			   		<th>Quantity</th>
			   		<th>Amount</th>
			   		<th></th>
			   	</tr>
			   	
			   	<c:forEach var="item" items="${mapProdInCart}">						  	
					<c:set var="amount" value="${item.value.price * item.value.qty}"></c:set>
					<tr>
						<!-- <td>${item.value.itemId}</td> -->
						<td>${item.value.itemCode}</td>
						<td>${item.value.itemName}</td>
						<!-- <td>${item.value.itemDesc}</td>  -->
						
						
						<c:if test="${item.value.itemId!=-1}">
						<td>${item.value.price}</td>
				        	<td><input type="text" class="myqty" value="${item.value.qty}" onkeyup="updateCart(${item.value.itemId}, this)" /></td>
						</c:if>
						<c:if test="${item.value.itemId==-1}">
				        	<td colspan="2"><c:out value="${couponDescription}"/></td>
						</c:if>
						
						<td>$<c:out value="${amount}"></c:out></td>
						<td><a href="javascript:void(0);" onclick="removeProd(${item.value.itemId})" class="btn btn-sm btn-default">Remove</a></td>
					</tr>
				</c:forEach>
			   	
			   	
			   	
			   	<tr>
			   		<td colspan="2">
			   			<a class="btn btn-sm btn-warning" href="#" onclick="clearCart();">Clear Cart</a>
					</td>
			   		<td></td>
			   		<td></td>
			   		<td></td>
		   		<td>
		   			<!-- 
			   			<a class="btn btn-sm btn-warning" href="#" onclick="updateCart(${item.value.itemId})">Update Cart</a>
					-->
					</td> 
			   	</tr>
			  </table>
			</div>
			
			
			<!-- discount -->
			<div class="panel panel-primary">
			  <!-- Default panel contents -->
			  <div class="panel-heading"><b>Discount/Coupon</b></div>
			
			  <!-- Table -->
			  <table class="table">
			   	<tr>
			   		<td>Coupon Code</td>
			   		<td><input type="text" name="couponCode" id="couponCode"/></td>
			   		<td id="couponDiscount"></td>
			   		<!--  <td><c:out value="${couponDescription}"/></td> -->
			   		<td><a class="btn btn-sm btn-warning" href="#" onclick="applyCoupon();">Apply Coupon</a></td>
			   		<!--  <td><a class="btn btn-sm btn-warning" href="#" onclick="cancelCoupon();" style="">Cancel</a></td> -->
			   	</tr>
			  </table>
			</div>
			
			<div class="col-lg-4">
			<a class="btn btn-lg btn-success" href="javascript:goBackShopping();" role="button">Continue shopping</a>
			</div>
		</div>
		
		<div class="col-lg-4">
			<div class="panel panel-primary">
				<!-- Default panel contents -->
			  <div class="panel-heading"><b>Summary</b></div>
			  
				<!-- Table -->
			  <table class="table">
			  	<tr>
			   		<td><b>Cart Subtotal</b></td>
			   		<td><b>CDN $<c:out value="${cartSubTotal}"/></b></td>
			   	</tr>
			   	<tr>
			   		<td><b>Shipping Fee/Freight</b></td>
			   		<td>Free</td>
			   	</tr>
			   	<tr>
			   		<td><b>Handling Fee</b></td>
			   		<td><b>$0</b></td>
			   	</tr>
			   	<tr>
			   		<td><b>Discount</b></td>
			   		<td>CDN $<span id="discountAmt"><c:out value="${discountAmt}"/></span></td>
			   	</tr>
			   	<tr>
			   		<td><b>Order Total</b></td>
			   		<!-- order total before tax -->
			   		<td><b>CDN $<span id="orderTotal"><c:out value="${orderTotal}"/></span></b></td>
			   	</tr>
			   	<!-- 
			   	<tr>
			   		<td></td>
			   		<td>
			   			<a class="btn btn-sm btn-success" href="#" role="button">Proceed to Checkout</a>
					</td>
			   	</tr>
			   	 -->
			  </table>
			</div>
			
			<div class="col-lg-8">
			<a class="btn btn-lg btn-success" href="shop_checkout.do" role="button">Proceed to Checkout</a>
			</div>
		</div>
		
		
	</div>

	
	




    <!-- Bootstrap core JavaScript  ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="scripts/jquery.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/docs.min.js"></script>
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="scripts/temp/ie10-viewport-bug-workaround.js"></script>
  
  	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- athensoft local script -->
    <script src="scripts/local/payment/shopping_cart.js"></script>
    <script>
    	$(function(){
    		$("div#navbar li").attr("class","");
    		$("li#ecomm").attr("class","active");
    	});
   	 </script>

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