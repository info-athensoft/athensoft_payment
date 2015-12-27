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
		  <p>安全、便捷、可靠、受众广泛</p>
		  <p><a class="btn btn-primary btn-lg" href="contact.jsp" role="button"><spring:message code="btn.contact"/></a></p>
	  </div>
	</div>
	
	
	<!-- product details -->
	<div class="container">
	  <h3><a href="#">用户协议及使用条款</a></h3>
	  
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
		 <h4>主机使用条款</h4>
		 <ul>
          	<li>电商网站租赁服务包含我们提供和配置的主机服务</li>
          	<li>用户若指定其它任何主机服务，则不享受本租赁服务的价格和相关服务，其价格按独立电子商务网站服务项目计算。</li>
		  </ul>
	  </div>
	  
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
		 <h4>域名相关条款</h4>
		 <ul>
          	<li>域名获取。用户可自行向正规机构购买合法域名。</li>
          	<li>域名代购。用户可委托我们代理购置域名，需加收15%的服务费。</li>
			<li>域名代理。用户需同意在网站使用合同期间授权我们域名管理配置权限。</li>
			<li>域名续约。用户需自行向域名机构续约合同以保证域名持续有效。</li>
		  </ul>
	  </div>
	  
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
		 <h4>免责声明</h4>
		 <ul>
          	<li>禁止利用该电商网站功能宣传或者销售任何有关武器、毒品、管制刀具、淫秽出版物、盗版图书及音像制品、处方药品、走私商品、受保护或管制的野生动植物及其它任何加拿大联邦、联邦各省和当地法律禁止或限制的一切有关物品。若有违反，则用户自身承受一切不良责任和全部后果；本公司和网站不对此负任何责任。</li>
          	<li>电商用户需自行保证商品的质量，禁止出售任何假冒伪劣商品，如有纠纷，需自行承担一切后果；本公司和网站不对此负任何责任。</li>
		  </ul>
	  </div>
    </div>

	<br/><br/>
	
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
          <h3><a href="#">电商入门版</a></h3>
          <p>适合短期或少量商品销售</p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
        <a href="#">
          <img class="" src="content/img/payment/2.png" alt="Generic placeholder image">
        </a>
          <h3><a href="#">电商标准版</a></h3>
          <p>适合中长期或大量商品销售</p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
         <a href="#">
          <img class="" src="content/img/payment/3.png" alt="Generic placeholder image">
         </a>
          <h3><a href="#">电商企业版</a></h3>
          <p>包含专业电商数据分析，人工智能等增值服务</p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->   

     </div>
	
	

	<div class="container">     
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