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
	    <h2>IT职业培训</h2>
		  <p>面向高薪职位，助您完成职业梦想</p>
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
          <img class="" src="content/img/training/1.jpg" alt="Generic placeholder image">
          </a>
          <h3><a href="#">大数据分析师</a></h3>
          <p></p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
        <a href="#">
          <img class="" src="content/img/training/3.jpg" alt="Generic placeholder image">
        </a>
          <h3><a href="#">移动Web开发员</a></h3>
          <p></p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
         <a href="#">
          <img class="" src="content/img/training/6.png" alt="Generic placeholder image">
         </a>
          <h3><a href="#">PHP/Web工程师</a></h3>
          <p></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->   
      
      <div class="row">
      	<div class="col-lg-4">
         <a href="#">
          <img class="" src="content/img/training/2.gif" alt="Generic placeholder image" width="300" height="190">
         </a>
          <h3><a href="#">Java工程师</a></h3>
          <p></p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
        <a href="#">
          <img class="" src="content/img/training/12.png" alt="Generic placeholder image">
        </a>
          <h3><a href="#">测试工程师</a></h3>
          <p></p>
        </div><!-- /.col-lg-4 -->
        
        <div class="col-lg-4">
          <a href="#">
          <img class="" src="content/img/training/13.jpg" alt="Generic placeholder image">
          </a>
          <h3><a href="#">平面设计师</a></h3>
          <p></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
      
      <br/><br/>
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