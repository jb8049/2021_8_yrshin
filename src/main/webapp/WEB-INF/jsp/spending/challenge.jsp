<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>	
 	<jsp:include page="/WEB-INF/jsp/include/head.jsp"></jsp:include>

	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> 
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/bootstrap.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/template/css/style.css">

<style>
	body {
   		font-family: 'hana' , verdana, san-serif;
    }
    
	 #main-layout {
		width : 90%;
		margin: 0 auto;
	}
	
	.main {
		width : 90%;
		display : flex;
		justify-content : center;
		margin-right: 30px;
	}
	
	#title {
    	color : black;
    	font-size : 28px;
    	font-weight : bold;
/*     	border-bottom: 2px solid #a0a0a0; */
    	padding-top : 55px;
    	margin-bottom : 20px;
    	padding-bottom : 16px;
    }
    
    #menu-title {
    	font-size : 24px;
    	font-weight : bold;
    	margin-bottom : 20px;
    	
    }
	
	section {
    	width : 1200px;
    }
    .nav-tabs>li {
	    border: 2px solid lightgray;
	    border-radius: 7px 7px 0 0;
    }
    
    .widget-tabs-list .nav.nav-tabs>li>a {
    font-size: 25px;
     padding: 8px 45px;
}
		.border-box {
		padding : 30px;
		border : 2px solid #dddddd; 
		border-radius : 5px;
		margin-bottom : 30px;
		margin-top : 30px;
	}

	.title {
		padding-bottom : 0px;
	}	
	.title h2{
	    font-size: 30px;
	}
	
	.title h2:after {
	    height: 0;
	   	font-size: 30px;
	}
/* 	ul.nav.nav-tabs::after {
	
		background-color :#00c292;

} */

	
div.challengeList {
		margin : 80px 0;
	}
	
	#btn-read-more {
		margin : 30px 50px 0px 50px auto;
	}
	
	.account-box {
		margin : 20px;
	
	}
	
	.account-box:hover {
		border : 3px solid #e2e2e2; 
		opacity :0.9;
	}
	
	.account-add-box {
		margin : 40px 20px;
	}
	
	#nickname {
		color : black;
		/* text-align : left; */
		font-size : 24px;
		font-weight : bold;
		/* color : #ffc221; */
		margin-left:10px;
	}	
	#accountNo {
	/* 	text-align : left; */
		font-size : 18px;
	}
	
	#balance {
		font-size : 26px;
	}
	
	.progress {
		width : 380px;
		margin-left : 40px;
		margin-top : 20px;
	}
	
	.progress-bar {
	    background-color: rgb(46 204 113);
	}	
	
	.service {
		padding-top : 0;
	}
	
	.service-box {
		background-color: rgb(222 238 249);
    	border-radius: 20px;
	}
	
	#add-box {
		background-color: rgb(255 255 255);
		height: 220px;
   		margin: 30px 20px 30px;
	}
	
	#penalty-box {
		background-color: rgb(255, 6, 6, 0.85);
    	border-radius: 40px;
    	color: white;
    	height: 35px;
    	padding-top: 5px;
    	margin-bottom: 20px;
	}
	   .modals-default-cl {
		margin-top : 30px;
    } 
     .modal-dialog.modal-large .modal-content {
    	padding: 70px 100px;
    }
    
    .modal-content {
    	padding : 40px 40px;
    	margin-top: 220px;
    	width: 850px;
   		height: 630px;
    }
    .modal-dialog.modal-large {
    width: 910px;
    margin-top: 110px;
    margin-left: 650px;
}
    #btn-close {
	    width: 40px;
    	height: 40px;
    	font-size: 32px;
    	padding : 0 0 10px 0;
    }
    div.nice-select{
		display : none;
	}
    .modal-large .modal-body h2 {
    	font-size : 28px;
    	color : black;
    } 
    .modals-default-cl {
    	margin-top : 0px;
    }
    
    .modal-footer {
		
		display : block;
		margin: 0 auto;
    }
    
    .modal-footer > .btn-default {
    	height : 50px;
    	font-size : 25px;
    }
    
    
   .modal-input, #penaltyRate {
		height : 67px;
		font-size : 23px;
	}
	
</style>
<script>

</script>
</head>
 <!-- body -->
<body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="${ pageContext.request.contextPath }/resources/images/loading.gif" alt="#" /></div>
      </div>
      <!-- end loader --> 
      <!-- header -->
      <header>
 			<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>      
      </header>
      <!-- end header -->
      
	   <div class="row main">
		   <aside id="side-menu">
				<div id="diyLnb" class="on">
				<h2 class="tit">???????????????</h2>
				<ul class="depth1">	
					<li class="on"><a href="#//HanaBank" >????????????</a></li>
					
					<li><a href="#//HanaBank">My???????????????</a></li>
					
					<li><a href="#//HanaBank">????????????</a></li>
				</ul>
				</div>
			</aside>
   
      <section>
		<div id="title" class="titlepage">??? ??????</div>
			
			
			
		<div class="widget-tabs-list">
			<ul class="nav nav-tabs">
				<li class=""><a href="${pageContext.request.contextPath}/spending/myCalendar">????????????</a></li>
				<li class=""><a href="${pageContext.request.contextPath}/spending/spendingAnalysis" >??????????????? ??????</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/spending/challenge">????????????</a></li>
			</ul>
			
			<div class="content">
			
			<div class="border-box">
				<div class="title col">	
					<h2 id="title-h2">??? ?????? <strong class="black">??????</strong></h2>	
				</div>
			
      
      	<!-- service --> 
      <div class="service"> 

         
        
            <div class="container challengeList">
            <div class="row">
				
				
			<c:forEach items="${ challengeList }" var="challenge" varStatus="loop">	
              	       <div class="col-md-6">
                  <div class="service-box account-box">
                  <div class="row">
                  <div id="nickname" class="col-md-9"> 
                  		  ${challenge.title}
                  </div>
                  <div class="col-md-2" id="penalty-box">
                     <h4 id="accountNo">
                     <fmt:formatNumber value="${challenge.penaltyRate}" type="percent"/>
                     </h4>
                  </div>
                  </div>
                  <div class="row">
                  	<div class="col-md-6">?????? ?????????</div>
                  	<div class="col-md-6">????????????</div>
                  </div>
                  <div class="row">
                     <h1 id="balance" class="col-md-6">
                     <fmt:formatNumber value="${ challenge.nowSpending }" type="number"/>???
                     </h1>
                     <h1 id="balance" class="col-md-6">
                      <fmt:formatNumber value="${ challenge.savingGoal }" type="number"/>???
                      </h1>
                  </div>
             
                  <div class="progress">
                  <c:choose>
                  <c:when test="${ (challenge.savingGoal - challenge.nowSpending) lt 0 }">
	  					<div class="progress-bar" role="progressbar" style="width: ${ challenge.nowSpending / challenge.savingGoal *100 }%; background-color : red;" 
	  					aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
	  					<fmt:formatNumber value="${challenge.nowSpending / challenge.savingGoal}" type="percent"/>
  					</div>
  				  </c:when>
  					<c:when test="${ challenge.nowSpending / challenge.savingGoal *100  gt 80 }">
  					<div class="progress-bar" role="progressbar" style="width: ${ challenge.nowSpending / challenge.savingGoal *100 }%; background-color : orange;" 
	  					aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
	  					<fmt:formatNumber value="${challenge.nowSpending / challenge.savingGoal}" type="percent"/>
  					</div>
  					</c:when>
  					<c:otherwise>
  					<div class="progress-bar" role="progressbar" style="width: ${ challenge.nowSpending / challenge.savingGoal *100 }%;" 
	  					aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
	  					<fmt:formatNumber value="${challenge.nowSpending / challenge.savingGoal}" type="percent"/>
  					</div>
  					</c:otherwise>
                  </c:choose>
                 
                  </div>
                  </div>
               </div>
              
              
              
             <%--   <div class="col-md-6">
                  <div class="service-box account-box" onclick="goAccountDetail('${account.accountNo}')">
                  <div id="nickname"> 
                     ${ account.accountNickName }
                  </div>
                     <h4 id="accountNo">${ account.accountNo }</h4>
                     <h1 id="balance"> ${ account.balance }???</h1>
                    <div class="row">
                  	<button id="btn-read-more" class="col-md-5 read-more" onclick="goAccountDetail('${account.accountNo}')">??????</button>
                  	<button id="btn-read-more" class="col-md-5 read-more" onclick="goAccountDetail('${account.accountNo}')">????????????</button>
                  	</div>
                  </div>
               </div> --%>
               </c:forEach>
            
               
               <div class="col-md-6">
      
                  <div class="service-box account-add-box" id="add-box">
                  <div class="modals-default-cl">
                  <div>
                  <img src="${pageContext.request.contextPath}/resources/icon/service5.png">
                  </div>
                  	<div>
                  	<div class="col-md-3"></div>
                     <button id="btn-read-more btn-add" class="col-md-6 read-more" data-toggle="modal" data-target="#myModalthree">?????? ????????????</button>
                  	</div>
                  	
                  	     <!-- --------------------------------------------?????? ------------------- -->
				 <div class="modal fade" id="myModalthree" role="dialog">
	             <div class="modal-dialog modal-large">
	                       <form action="${pageContext.request.contextPath}/insert" method="post">
	                     	<input id="title" type="hidden" name="title" value="">
	                     	<input id="category" type="hidden" name="category" value="">
	                     
	                     <div class="modal-content">
	                          <div class="modal-header">
	                              <button id="btn-close" type="button" class="close" data-dismiss="modal">&times;</button>
	                          </div>
	                          <div class="modal-body">
	                             <h2 style="font-size : 35px; text-align: center; color : #009b9d; margin-bottom : 45px"></h2>
	                             
	    
	                            
	                             
	                             <div class="row" style="text-align:center">
	                             <h2 class="col-md-6" style="padding-top:17px;">?????? ?????? : </h2>
	                             <div class="col-md-6">
	                             <select class="form-control modal-input" name="categoryChallenge" id="challengeCatefory">
										<option value="??????">??????</option>	
										<option value="??????/??????">?????????</option>
										<option value="??????">??????</option>
										<option value="??????">??????</option>
										<option value="?????????">?????????</option>
										<option value="??????">??????</option>
										<option value="????????????">????????????</option>
										<option value="?????????">?????????</option>
										<option value="??????">??????</option>
										<option value="??????">??????</option>
										<option value="??????">??????</option>
									</select>
	                             </div>
	                             </div>
	                             <div class="row" style="text-align:center">
	                             <h2 class="col-md-6" style="padding-top:17px;">?????? ?????? : </h2>
	                             <div class="col-md-6">
	                             <input class="form-control modal-input" type="text" placeholder="(???)" name="savingGoal"/>
	                             </div>
	                             </div>
	                             
	                             
	                               <div class="row" style="text-align:center">
	                               <h2 class="col-md-6" style="padding-top:17px">????????? : </h2>
	                               <div class="col-md-6">
	                             	<select class="form-control modal-input" name="penaltyRate" id="penaltyRate">
										<option value="0.1">10%</option>	
										<option value="0.2">20%</option>
										<option value="0.3">30%</option>
									</select>
	                               </div>
									</div>
									<h4 style="color : red; font-size : 23px; margin-bottom :20px"> *?????? ?????? ?????? ???!<br>
									??????????????? ???????????? ???????????? [??????????????? ???????????????] ???????????????.</h4>
	                          </div>
	                          <div class="modal-footer">
	                             <button type="submit" class="btn btn-default" >??????</button>
	                        	   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                          </div>
	                     </div>
	                       </form>
	                  </div>
	              </div>
				
			<!-- --------------------------------???-------?????? ??? ------->	
                  	
                  	
                  	
                  	
                  	
                  	
                  	</div>

                  	</div> 
                  </div>
               </div>
            
              
            </div>
         </div>
    
			</div>
			
			
			</div>
			
			
			
		</div>
		
			
      	<script src="${ pageContext.request.contextPath }/resources/template/js/vendor/jquery-1.12.4.min.js"></script>
   			 <!-- bootstrap JS
		============================================ -->
  			  <script src="${ pageContext.request.contextPath }/resources/template/js/bootstrap.min.js"></script>	
      </section> 
      </div>
      <%-- footer --%>
      <footer>
         <jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
      </footer>
      <%-- end footer --%>
      
      <!-- Javascript files--> 
  		<jsp:include page="/WEB-INF/jsp/include/javascriptFiles.jsp"></jsp:include>
</body>
</html>