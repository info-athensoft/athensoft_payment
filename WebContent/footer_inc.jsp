<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- i18n -->
<c:set var="loc" value="zh_CN"/>
<c:if test="${!(empty param.locale)}">
  <c:set var="loc" value="${param.locale}"/>
</c:if>
<fmt:setLocale value="${loc}" />
<!-- ENDS i18n -->

<!-- FOOTER -->
   <footer>
     <p class="pull-right"><a href="#"><spring:message code="footer.gotop"/></a></p>
     <p>© 2015 INFORMATIQUE ATHENSOFT · <a href="#"><spring:message code="footer.privacy"/></a> · <a href="#"><spring:message code="footer.terms"/></a></p>
   </footer>
<!-- FOOTER -->