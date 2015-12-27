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
	    <h2><spring:message code="page.title.ecomm.starter"/></h2>
		  <p>一站式电商网站出租，开网店就是简单</p>
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
          <img class="" src="content/img/ecomm/1.jpg" alt="Generic placeholder image">
          <h3>$0.95/天  起租</h3>
        </div><!-- /.col-lg-4 -->
        	
        
        <div class="col-lg-4">
        	<div>
           		<h3><a href="#">电商入门版</a></h3>
          		<p>适合短期或少量商品销售</p>
          		<p>适合个人和小批量卖家</p>
          		<p>适合临时或兼职卖家</p>
          	</div>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
        	<div>
        		<h3><a href="#">最新消息</a></h3>
          		<p>2015-08-06 夏季大促销活动，截止到2015-08-15</p>
          	</div>
        </div><!-- /.col-lg-4 -->
        
      </div><!-- /.row -->   
     </div>

	<!-- product details -->
	<div class="container">
		<h3><a href="#">价格</a></h3>

		<div class="col-lg-6">
			<div class="panel panel-primary">
			  <!-- Default panel contents -->
			  <div class="panel-heading"><b>Promotion</b> &nbsp;&nbsp;(to 2015-08-15) &nbsp;&nbsp;UP TO <b>29% OFF</b></div>
			
			  <!-- Table -->
			  <table class="table">
			   	<c:forEach var="item" items="${itemProductList}">						  	
						<tr>
							<!--  <td>${item.itemId}</td> -->
							<!--  <td>${item.itemCode}</td> -->
							<td>${item.itemName}</td>
							<!--  <td>${item.itemDesc}</td> -->
							<td>${item.price}</td>
							<td>
					   			<a class="btn btn-sm btn-success" href="#" role="button" onclick="addToCart(${item.itemId});dispIfProdExist(${mapProdInCartStat['${item.itemId}']});"><spring:message code="btn.add_to_cart"/></a>
							</td>
						</tr>
						
				</c:forEach>
					
			  </table>
			</div>
		</div>
		
		<div class="col-lg-6">
			<div class="panel panel-primary">
			  <!-- Default panel contents -->
			  <div class="panel-heading"><b>Regular</b></div>
			
			  <!-- Table -->
			  <table class="table">
			  	<tr>
			   		<td>3 months plan</td>
			   		<td>CAD $119.00 + tx</td>
			   		<td>
			   			<a class="btn btn-sm btn-success" href="add_to_cart.do" role="button"><spring:message code="btn.add_to_cart"/></a>
					</td>
			   	</tr>
			   	<tr>
			   		<td>6 months plan</td>
			   		<td>CAD $225.00 + tx</td>
			   		<td>
			   			<a class="btn btn-sm btn-success" href="add_to_cart.do" role="button"><spring:message code="btn.add_to_cart"/></a>
					</td>
			   	</tr>
			   	<tr>
			   		<td>12 months plan</td>
			   		<td>CAD $450.00 + tx</td>
			   		<td>
			   			<a class="btn btn-sm btn-success" href="add_to_cart.do" role="button"><spring:message code="btn.add_to_cart"/></a>
					</td>
			   	</tr>
			  </table>
			</div>
		</div>
		
	</div>
	
	<!-- product details -->
	<div class="container">
	  <h3><a href="#">版本功能</a></h3>
	  
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
		 <h4>网店前端</h4>
		 <ul>
          	<li>精美网店主题</li>
          	<li>会员注册</li>
          	<li>产品快速模糊查询</li>
          	<li>内嵌Google地图，标识网店地理位置</li>
          	<li>链接Facebook, Twitter等知名社交媒体</li>
		  </ul>
	  </div>
	  
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
		 <h4>后台管理</h4>
		 <ul>
          	<li>产品类别管理</li>
          	<li>产品条目管理</li>
          	<li>产品动态属性管理</li>
			<li>产品销售价格管理</li>
		  </ul>
	  </div>
	  
	  <h3><a href="#">用户须知</a></h3>
	  <div class="bs-callout bs-callout-info" id="callout-helper-context-color-specificity">
		 <h4>免责声明</h4>
		 <ul>
          	<li>禁止利用该电商网站功能宣传或者销售任何有关武器、毒品、管制刀具、淫秽出版物、盗版图书及音像制品、处方药品、走私商品、受保护或管制的野生动植物及其它任何加拿大联邦、联邦各省和当地法律禁止或限制的一切有关物品。若有违反，则用户自身承受一切不良责任和全部后果；本公司和网站不对此负任何责任。</li>
          	<li>电商用户需自行保证商品的质量，禁止出售任何假冒伪劣商品，如有纠纷，需自行承担一切后果；本公司和网站不对此负任何责任。</li>
		  </ul>
	  </div>
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
			5. 开始使用
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
          </p>
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">迅速得到回报</h2>
          <p class="lead">支付处理后，只需几分钟就可以在您的PayPal账户收到付款，而不需要像其它支付提供商那样可能需要2-3天才将款项划到您的账户。</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" id="fpic3" data-src="" alt="500x500" src="content/img/payment/c.jpg" data-holder-rendered="true">
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
    <script>
    function addToCart(itemId){
		//alert("add to cart, prodId = "+prodId);		
		window.location = "addtocart.do?itemId="+itemId;
		
	}
	
	function dispIfProdExist(isProdInCart){
		//alert("isProdInCart= "+isProdInCart);	
		if(isProdInCart){
			alert("prod exists.");
		}
	}

	function viewCart(){
		//alert("view cart");
		window.location = "add_to_cart.do";
	}
    </script>
    <!-- athensoft local script -->
 
</body>
</html>