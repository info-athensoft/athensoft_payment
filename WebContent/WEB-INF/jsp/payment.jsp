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
	    <h2>在线支付服务</h2>
		  <p>安全、便捷、可靠、受众广泛</p>
		  <p><a class="btn btn-primary btn-lg" href="#" role="button"><spring:message code="btn.contact"/></a></p>
	  </div>
	</div>
	
	
	 <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
      	<div class="col-lg-4">
        <a href="#">
          <img class="" src="content/img/payment/1.png" alt="Generic placeholder image">
          </a>
          <h3><a href="#">PayPal便捷支付</a></h3>
          <p>买家从商家网站用PayPal支付</p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
        <a href="#">
          <img class="" src="content/img/payment/2.png" alt="Generic placeholder image">
        </a>
          <h3><a href="#">信用卡支付</a></h3>
          <p>买家在商家网站使用信用卡直接支付</p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
         <a href="#">
          <img class="" src="content/img/payment/3.png" alt="Generic placeholder image">
         </a>
          <h3><a href="#">购物车</a></h3>
          <p>购物车功能与支付功能集成</p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->   
      
      
      <br/><br/>
     </div>
	




    <div class="container">

      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">规范、可靠、受众广泛</h2>
          <p class="lead">支持PayPal支付和信用卡支付。<br/>
			直接基于PayPal应用程序接口开发，100%符合PayPal支付流程规范。<br/>
			数以万计的个人和商家首选的支付方案。<br/>
			客户支付过程在PayPal的安全站点进行。
		  </p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" id="fpic1" data-src="" alt="500x500" src="content/img/payment/a.jpg" data-holder-rendered="true" >
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" id="fpic2" data-src="" alt="500x500" src="content/img/payment/b.jpg" data-holder-rendered="true">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">个性化、连贯的支付体验</h2>
          <p class="lead">可自由设计结算页面外观，和网站风格保持一致。<br/>
买家不用跳出商家网站就可以进行信用卡支付。<br/>
自动返回到卖家网站以完成订单支付。<br/>
          </p>
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">迅速得到付款</h2>
          <p class="lead">支付处理后，只需几分钟就可以在您的PayPal账户收到付款，而不需要像其它支付提供商那样可能需要2-3天才将款项划到您的账户。</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" id="fpic3" data-src="" alt="500x500" src="content/img/payment/c.jpg" data-holder-rendered="true">
        </div>
      </div>
      
      <hr class="featurette-divider">
      
       <div class="row featurette">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" id="fpic2" data-src="" alt="500x500" src="content/img/payment/d.jpg" data-holder-rendered="true">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">预算灵活控制</h2>
          <p class="lead">
          支持按需选择开发相关支付功能。<br/>
不采用第三方集成方案，摒弃多余功能，降低维护门槛。<br/>
降低培训门槛。
          
			</p>
        </div>
      </div>
	


     <!-- /END THE FEATURETTES -->
     
	 <hr class="athensoft-divider2">

	  <!-- Bottom -->
	  <jsp:include page="../../bottom_inc.jsp"></jsp:include>	
	  <!-- End of Bottom -->

	  <hr class="athensoft-divider">

      <!-- FOOTER -->
      <jsp:include page="../../footer_inc.jsp"></jsp:include>
	  <!-- FOOTER -->
	  
	  
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript  ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="scripts/jquery.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/docs.min.js"></script>
    
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
 	
 	 <!-- athensoft local script -->
    <script>
    	$(function(){
    		$("div#navbar li").attr("class","");
    		$("li#ecomm").attr("class","active");
    	});
    </script>
    <!-- athensoft local script -->
</body>
</html>