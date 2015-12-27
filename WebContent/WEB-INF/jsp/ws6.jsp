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
	    <h2>企业综合网站</h2>
		  <p>实现业务自动化，提升运营效率，一切尽在掌握</p>
	  </div>
	</div>

    <!-- Marketing messaging and featurettes
    ================================================== -->
	<div class="container">
	  
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
		 <h4>产品描述</h4>
		 <p>动态网站，大型WEB应用。投资回报率高，利于企业电子商务化和业务电子化，促进企业优化业务流程和运营模式，进而提高企业管理水平，降低运营成本。适用于业务流程较复杂或者自动化要求程度高的情形。</p>
	  </div>
	  
	  
	  <div class="bs-callout bs-callout-danger" id="callout-helper-context-color-specificity">
		<h4>产品规格</h4>		          
		          <ul>
		          	<li>网站概念设计，视觉和效果设计，样式和排版设计。</li>
					<li>网页内容包含首页、动态幻灯展示、产品或服务介绍、关于我们等。</li>
					<li>支持产品管理。</li>
					<li>支持客户管理。</li>
					<li>支持供应商管理。</li>
					<li>支持员工管理。</li>
					<li>支持库存管理。</li>
					<li>支持订单管理。</li>
					<li>支持账单管理。</li>
					<li>支持多种语言。</li>
					<li>内置初级SEO服务。</li>
					<li>可选支持电子商务功能。</li>
					<li>支持业务功能扩展。</li>
					<li>可按要求定制业务功能。</li>
				  </ul>

	  </div>
	  
	  <div class="bs-callout bs-callout-warning" id="callout-helper-context-color-specificity">
		<h4>产品价格</h4>
		          <ul>
		          	<li>$9999.00+tx 起 。</li>
					<li>所选配套服务需另外计费。</li>	
				  </ul>

	  </div>
	
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
	    <h4>维护服务</h4>
		   		  <ul>
		          	<li>内容调整，系统监控，数据备份，网站备份</li>
					<li>包年每月$240.00+tx 或者按小时$60.00+tx/小时</li>
					<li>首一个月免费</li>
					<li>业务信息维护需按工作量单独计算</li>
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