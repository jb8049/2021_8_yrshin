<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
   <script src="${ pageContext.request.contextPath }/resources/js/jquery.min.js"></script> 
      <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.min.js"></script> 
      <script src="${ pageContext.request.contextPath }/resources/js/popper.min.js"></script> 
      <script src="${ pageContext.request.contextPath }/resources/js/jquery-3.0.0.min.js"></script> 
   <script src="${ pageContext.request.contextPath }/resources/js/plugin.js"></script> 
 <%--     <script src="${ pageContext.request.contextPath }/resources/template/js/plugins.js"></script> --%>
      <!-- sidebar --> 
      <script src="${ pageContext.request.contextPath }/resources/js/jquery.mCustomScrollbar.concat.min.js"></script> 
      <script src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
      <script>
         $(document).ready(function(){
         $(".fancybox").fancybox({
         openEffect: "none",
         closeEffect: "none"
         });
         
         $(".zoom").hover(function(){
         
         $(this).addClass('transition');
         }, function(){
         
         $(this).removeClass('transition');
         });
         });
         
      </script> 