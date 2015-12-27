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
	    <h2><spring:message code="page.title.ecomm"/></h2>
		  <p>开店新思路，网店用租，一切变得简单</p>
		  <p><a class="btn btn-primary btn-lg" href="contact.do" role="button"><spring:message code="btn.contact"/></a></p>
	  </div>
	</div>
	
	
	 <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
      	<div class="col-lg-4">
        <a href="ecomm_starter.do">
          <img class="" src="content/img/ecomm/11.jpg" alt="Generic placeholder image">
        </a>
        <h3><a href="ecomm_starter.do">电商入门版</a></h3>
        <p>适合短期或少量商品销售</p>
          
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
        <a href="ecomm_standard.do">
          <img class="" src="content/img/ecomm/21.jpg" alt="Generic placeholder image">
        </a>
          <h3><a href="ecomm_standard.do">电商标准版</a></h3>
          <p>适合中长期或大量商品销售</p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
         <a href="#">
          <img class="" src="content/img/ecomm/31.jpg" alt="Generic placeholder image">
         </a>
          <h3><a href="#">电商企业版</a></h3>
          <p>包含专业电商数据分析，人工智能等增值服务</p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->   
     </div>

    <div class="container">
      <!-- START THE FEATURETTES -->
       <hr class="featurette-divider">
       
      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">简易五步，开始电商之旅</h2>
          <p class="lead">
          	1. 注册账户<br/>
			2. 选择计划，<a href="ecomm_term.do" target="_blank">阅读条款</a><br/>
			3. 提供域名<br/>
			4. 填写产品信息，上传产品图片<br/>
			5. 开始使用<br/>
			&nbsp;<br/>
			&nbsp;<br/>
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
          <h2 class="featurette-heading">个人都开得起的专业网店</h2>
          <p class="lead">
          	开店成本仅一天一杯普通咖啡<br/>
			网店外观精美，响应式设计支持电脑、平板、手机<br/>
			后台管理功能一应俱全<br/>
			客户支持为您解忧<br/>
			&nbsp;<br/>
			&nbsp;<br/>
          </p>
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">预算灵活控制</h2>
          <p class="lead">
         	 灵活选择计划周期，有效控制成本<br/>
			多种版本选择，进一步降低预算<br/>
			使用简单易上手，节省培训费用 <br/>
			&nbsp;<br/>
			&nbsp;<br/>       
			</p>
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
           <h2 class="featurette-heading">迅速得到回报</h2>
           <p class="lead">
           		7X24小时的销售体验，打破实体店营业时间限制<br/>
           		全境销售，突破实体店地域限制<br/>
           		更容易留住客户信息，了解客户需求和变化<br/>
           		用户行为分析服务，助您合理配置资源，精准营销<br/>
           		&nbsp;<br/>
				&nbsp;<br/>
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