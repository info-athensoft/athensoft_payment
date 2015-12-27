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
	    <h2>平面设计服务</h2>
		  <p>产品图册、广告设计、名片一个都不少</p>
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
          <img class="" src="content/img/design/1.jpg" alt="Generic placeholder image">
          </a>
          <h3><a href="#">产品图册设计</a></h3>
          <p>年度产品图册、新品促销品单页、展销会图册设计</p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
        <a href="#">
          <img class="" src="content/img/design/2.jpg" alt="Generic placeholder image">
        </a>
          <h3><a href="#">平面广告设计</a></h3>
          <p>网页广告，社交媒体广告，EMAIL广告，报纸广告设计</p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
         <a href="#">
          <img class="" src="content/img/design/3.jpg" alt="Generic placeholder image">
         </a>
          <h3><a href="#">商业名片设计</a></h3>
          <p>简洁型，精致型，单面，双面各种商业名片设计</p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->   
      
           
      <br/><br/>
     </div>
	




    <div class="container">

      <!-- START THE FEATURETTES -->
	<!-- Pricing 1 --> 
	<h3>产品图册设计价格表</h3>
	<table class="table table-striped">
	 		<tbody>
	 		<tr>
	 			<th width="25%">服务项目</th>
	 			<th>经济型</th>
	 			<th>精致型</th>
	 			<th>豪华型</th>
	 		</tr>
	 		<tr>
	 			<td>概念设计</td>
	 			<td>$1000/套</td>
	 			<td>$1500/套</td>
	 			<td>$2000/套</td>
	 		</tr>
	 		<tr>
	 			<td>封面</td>
	 			<td>$150/页</td>
	 			<td>$200/页</td>
	 			<td>$300/页</td>
	 		</tr>
	 		<tr>
	 			<td>封底</td>
	 			<td>$100/页</td>
	 			<td>$150/页</td>
	 			<td>$250/页</td>
	 		</tr>
	 		<tr>
	 			<td>插图设计</td>
	 			<td>$80/张</td>
	 			<td>$120/张</td>
	 			<td>$180/张</td>
	 		</tr>
	 		<tr>
	 			<td>页面布局</td>
	 			<td>$30/页</td>
	 			<td>$40/页</td>
	 			<td>$50/页</td>
	 		</tr>
	 		<tr>
	 			<td>图片处理</td>
	 			<td>$5/张</td>
	 			<td>$10/张</td>
	 			<td>$15/张</td>
	 		</tr>
	 		<tr>
	 			<td>文字处理</td>
	 			<td>$2/张</td>
	 			<td>$3/张</td>
	 			<td>$5/张</td>
	 		</tr>
	 	</tbody>	 	
	 </table>
	 
	 
	 <!-- Pricing 2 --> 
	<h3>平面广告设计价格表</h3>
	<table class="table table-striped">
	 		<tbody>
	 		<tr>
	 			<th width="25%">服务项目</th>
	 			<th>经济型</th>
	 			<th>精致型</th>
	 			<th>豪华型</th>
	 		</tr>
	 		<tr>
	 			<td>三折页</td>
	 			<td>$600/套</td>
	 			<td>$800/套</td>
	 			<td>$1000/套</td>
	 		</tr>
	 		<tr>
	 			<td>报纸广告</td>
	 			<td>$60/小时</td>
	 			<td>$75/小时</td>
	 			<td>$90/小时</td>
	 		</tr>
	 		<tr>
	 			<td>LOGO</td>
	 			<td>$60/小时</td>
	 			<td>$75/小时</td>
	 			<td>$90/小时</td>
	 		</tr>
	 		<tr>
	 			<td>网页图文广告</td>
	 			<td>$60/小时</td>
	 			<td>$75/小时</td>
	 			<td>$90/小时</td>
	 		</tr>
	 	</tbody>	 	
	 </table>
	 
	 
      <!-- Pricing 3 --> 
	<h3>商业名片设计价格表</h3>
	<table class="table table-striped">
	 		<tbody>
	 		<tr>
	 			<th width="25%">服务项目</th>
	 			<th>文字</th>
	 			<th>图文</th>
	 			<th>创意</th>
	 		</tr>
	 		<tr>
	 			<td>单页黑白</td>
	 			<td>$30/套</td>
	 			<td>$60/套</td>
	 			<td>$90/套</td>
	 		</tr>
	 		<tr>
	 			<td>双页黑白</td>
	 			<td>$45/套</td>
	 			<td>$75/套</td>
	 			<td>$105/套</td>
	 		</tr>
	 		<tr>
	 			<td>单页彩色</td>
	 			<td>$60/套</td>
	 			<td>$90/套</td>
	 			<td>$200/套</td>
	 		</tr>
	 		<tr>
	 			<td>双页彩色</td>
	 			<td>$75/套</td>
	 			<td>$120/套</td>
	 			<td>$300/套</td>
	 		</tr>
	 	</tbody>	 	
	 </table>
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