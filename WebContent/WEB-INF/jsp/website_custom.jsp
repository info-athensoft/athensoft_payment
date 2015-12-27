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
		text-align:justify;
      text-justify:distribute-all-lines;/*ie6-8*/
      text-align-last:justify;/* ie9*/
      -moz-text-align-last:justify;/*ff*/
      -webkit-text-align-last:justify;/*chrome 20+*/
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
	    <h2>网站开发•定制</h2>
		  <p>网站定制或者选择一个套餐</p>
		  <p>
		    <a class="btn btn-primary btn-lg" href="website.do" role="button"><spring:message code="btn.website_plan"/></a>
		  	<a class="btn btn-primary btn-lg" href="contact.do" role="button"><spring:message code="btn.contact"/></a>
		  </p>
	  </div>
	</div>
	
	
	 <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

	<!-- global module -->
    <div class="container">    	
    	<h2><span class="label label-info">网站通用功能</span></h2>
    	<br/>        
		<div class="bs-glyphicons">
    		<ul class="bs-glyphicons-list">
      		<li>
	          <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">网站内容管理</span>
	        </li>
      		
      		<li>
	          <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">会员注册</span>
	        </li>
      		
	        <li>
	          <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">多语言支持</span>
	        </li>        
	      
	        <li>
	          <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">图片展示/画廊</span>
	        </li>        
	        
	        <li>
	          <span class="glyphicon glyphicon-circle-arrow-up" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">文件上传</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">搜索引擎优化</span>
	        </li>
	      
        </ul>
      </div>
   </div><!-- global module -->


	<!-- ecomm module -->
    <div class="container">    	
    	<h2><span class="label label-info">电子商务功能</span></h2>
    	<br/>        
		<div class="bs-glyphicons">
    		<ul class="bs-glyphicons-list">
	        <li>
	          <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">购物车</span>
	        </li>
	      
	         <li>
	          <span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">在线支付</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">用户管理</span>
	        </li>	        
	        <li>
	          <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">在线客服</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">留言系统</span>
	        </li>
	      	 <li>
	          <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">电子邮件营销</span>
	        </li>
        </ul>
      </div>
   </div><!-- ecomm module -->

   <!-- ecomm module -->
    <div class="container">    	
    	<h2><span class="label label-info">社交媒体功能</span></h2>
    	<br/>        
		<div class="bs-glyphicons">
    		<ul class="bs-glyphicons-list">
	        <li>
	          <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">Facebook集成</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">YouTube集成</span>
	        </li>
	      
	         <li>
	          <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">Printerest集成</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">Instragram集成</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-share" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">Twitter集成</span>
	        </li>
	        
	         <li>
	          <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">论坛</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">博客</span>
	        </li>
	        
	       	      
        </ul>
      </div>
   </div><!-- ecomm module -->


	<!-- business module -->
	<div class="container">
    	<h2><span class="label label-info">企业应用功能</span></h2>
    	<br/>        
		<div class="bs-glyphicons">
    		<ul class="bs-glyphicons-list">
      		
      		 <li>
	          <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">报价管理</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">订单管理</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">账单管理</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">库存管理</span>
	        </li>
      		
	        <li>
	          <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">客户管理</span>
	        </li>
	      
	        <li>
	          <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">供应商管理</span>
	        </li>
	      
	        <li>
	          <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">员工管理</span>
	        </li>	       
     
        </ul>
      </div>
   </div><!-- business module -->
   
	<hr class="featurette-divider">
	
	
	<!-- business module -->
	<div class="container">
    	<h2><span class="label label-warning">网站维护服务</span></h2>
    	<br/>        
		<div class="bs-glyphicons">
    		<ul class="bs-glyphicons-list">
    		     		
      		 <li>
	          <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">网站基本维护</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">数据备份</span>
	        </li>	        
	        <li>
	          <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">产品数据维护代理</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">产品图片处理代理</span>
	        </li>	       
        </ul>
      </div>
   </div><!-- business module -->
	
	
	<!-- business module -->
	<div class="container">
    	<h2><span class="label label-warning">网站配套服务</span></h2>
    	<br/>        
		<div class="bs-glyphicons">
    		<ul class="bs-glyphicons-list">
      		
      		<li>
	          <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">域名选购代理</span>
	        </li>	        
	        <li>
	          <span class="glyphicon glyphicon-hdd" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">网站空间服务代理</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-transfer" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">网站迁移代理</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">文案/翻译</span>
	        </li>
	       
        </ul>
      </div>
   </div><!-- business module -->
	
	
	<!-- business module -->
	<div class="container">
    	<h2><span class="label label-warning">大数据分析服务</span></h2>
    	<br/>        
		<div class="bs-glyphicons">
    		<ul class="bs-glyphicons-list">
      		
      		 <li>
	          <span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">网站用户行为分析</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">电子商务数据分析</span>
	        </li>
	        
	        <li>
	          <span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">企业数据挖掘</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
	          <p></p>
	          <span class="glyphicon-class">数据可视化</span>
	        </li>
	       
        </ul>
      </div>
   </div><!-- business module -->
	
	
    <div class="container marketing">

      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          

		 <h2 class="featurette-heading">定制网站相对模板网站的优势</h2>
		  <p class="lead">尽管模板网站的建设非常简单，只需要更改图片，文字，LOGO等，制作成本也不高，但是越到中后期越显露出其劣势：网站的功能基本不能更改和增加；由于模块网站相似度高，不利于搜索排名；网站的安全性相对较低等。<br/>
		相比之下，定制网站有其独有优势：支持制作个性化网页，利于品牌形象的提升；功能可以根据需要进行调整；利于搜索引擎优化（SEO）；安全性较高；网站维护非常方便；利于后期的发展。
		</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" id="fpic1" data-src="" alt="500x500" src="content/img/faq/1.jpg" data-holder-rendered="true" >
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" id="fpic2" data-src="" alt="500x500" src="content/img/faq/2.jpg" data-holder-rendered="true">
        </div>
        <div class="col-md-7">
         <h2 class="featurette-heading">如何定制网站？</h2>
		          <p class="lead">第一步：选择一个网站套餐，套餐里含有网页设计。<br/>
第二步：在此基础上选择增加或升级功能。如果有特殊业务功能，另外开发。<br/>
第三步：选择适合您的维护服务项目。<br/>
第四部：选择您需要的配套服务项目。

		</p>
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">做网站的基本流程是怎样的？</h2>
          <p class="lead">一个专业和规范的网站设计团队会严格遵循软件设计流程和技术行业商业流程的规则，与客户一道共同完成网站项目的各个阶段，依次包含：</p>
          <ul>
            <li>业务意向达成</li>
          	<li>了解业务需求和设计要求</li>
          	<li>签立服务合同或协议</li>
          	<li>设计方案确定</li>
          	<li>实施和构建</li>
          	<li>验收和发布</li>
          	<li>移交和维护</li>
          </ul>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" id="fpic3" data-src="" alt="500x500" src="content/img/faq/3.jpg" data-holder-rendered="true">
        </div>
      </div>
      
      <hr class="featurette-divider">
      
       <div class="row featurette">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" id="fpic2" data-src="" alt="500x500" src="content/img/faq/4.jpg" data-holder-rendered="true">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">如何估算定制网站的价格</h2>
          <p class="lead">定制网站的价格一般根据所选的内容进行累加。<br/>
          	计算公式为：<br/>
			定制价格 = 套餐价格 + 自选功能价格 + 维护价格 + 配套服务价格<br/>
			注册会员并随时留意我们的活动获取折扣！
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
    		$("li#service").attr("class","active");
    	});
    </script>
    <!-- athensoft local script -->
</body>
</html>