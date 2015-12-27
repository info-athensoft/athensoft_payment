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
	.marketing p{
		text-align:left;
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
	    <h2>电子商务网站</h2>
		  <p>24小时在线营业，在线支付，让您的业务飞起来</p>
	  </div>
	</div>

    <!-- Marketing messaging and featurettes
    ================================================== -->
	<div class="container">
	  
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
		 <h4>产品描述</h4>
		          <p>动态网站。电子商务站提供产品展示站的全部功能，此外还提供购物车、在线支付和用户管理功能。适用于实物产品交易、线上下单线下消费的服务等商业领域。</p>
	  </div>
	  
	  
	  <div class="bs-callout bs-callout-danger" id="callout-helper-context-color-specificity">
		<h4>产品规格</h4>		          
		          <ul>
		          	<li>网站概念设计，视觉和效果设计，样式和排版设计。</li>
					<li>网页内容包含首页、动态幻灯展示、产品或服务介绍、关于我们等。</li>
					<li>产品分类展示和产品详细信息展示。</li>
					<li>购物车和在线支付功能。</li>	
					<li>可以选择包含后台自助管理系统：产品管理、类别管理、用户管理。</li>
					<li>支持任意两种语言。</li>		
					<li>内置初级SEO服务。</li>
					<li>支持业务功能扩展。</li>
				  </ul>

	  </div>
	  
	  <div class="bs-callout bs-callout-warning" id="callout-helper-context-color-specificity">
		<h4>产品价格</h4>
          <ul>
          	<li>$2999.00+tx 起。</li>
			<li>额外内容按每页$100+tx计算。</li>
			<li>产品或服务缩略图页面每8个图算一页。</li>
			<li>所选其它功能需另外计算。</li>
			<li>所选配套服务需另外计费。</li>	
		  </ul>

	  </div>
	
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
	    <h4>维护服务</h4>
		   		  <ul>
		          	<li>内容调整，系统监控，产品信息维护，数据备份</li>
					<li>包年每月$90.00+tx 或者按小时$60.00/小时</li>
					<li>首免两个月维护费</li>
					<li>产品信息维护需按工作量单独计算</li>
				  </ul>
	  </div>
	  
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-accessibility">
	    <h4>配套服务</h4>
		<p>域名空间，图片处理，文案翻译，网站升级，功能扩展，网站推广，数据分析</p>
	  </div>
    </div>


    <div class="container marketing">
      
     


      <!-- START THE FEATURETTES -->


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
    

</body>
</html>