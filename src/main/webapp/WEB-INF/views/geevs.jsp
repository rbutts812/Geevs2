<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>




<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
   <!--  bootstrap css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<!--  bootstrap js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>    
    
    
       --%>
       
       
       <%-- Start of New Code --%>
      
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ page import="java.text.NumberFormat" %>
       <%@ page import="java.io.*,java.util.*" %>
       
       <%java.text.DateFormat date = new java.text.SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a "); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE HTML>

<html>
	<head>
		<title>Appointments</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
    	
    	<link rel="stylesheet" href="assets/css/main.css" />
    	<link rel="stylesheet" href="${contextPath}/resources/assets/css/main.css" type="text/css" />
    	
    	<!-- Scripts -->
			<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${contextPath}/resources/assets/js/skel.min.js"></script>
			<script src="${contextPath}/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${contextPath}/resources/assets/js/main.js"></script>
			<!--  JQuery  js-ui-->       
    <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
						
  </head>
  <body>

		<!-- Header -->
			<header id="header">
				<h1><a href="index.html">Geev's for SweetArt</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="nav">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<!-- <li><a href="generic.html">Generic</a></li>
					<li><a href="elements.html">Elements</a></li> -->
					<li class="active"><a href="about">About Us</a></li>	
					<!-- <li><a href="contact">Contact Us</a></li>	 -->
					<li><a href="signups">Sign up</a></li>
					<li><a href="login">Log in</a></li>		
				</ul>
			</nav>
			
			
      <script>
         $(function() {
            $( "#dates" ).datepicker({
                  changeMonth: true,
                  changeYear: true,
                  dateFormat: 'mm/dd/yy',
                  minDate: new Date(),
                // maxDate: new Date(), // todays datechangeYear: true,
                //minDate: '-3M',  // 3 month
                 maxDate: '+28D',  // 1 month
                });
                 //$( "#date" ).datepicker("show");
         });
      </script>
      
      
      
<%--
    <script>
    window.history.forward();
    </script> 
    
  </head>
  <body>
			
			<div class="navigation">
				<div class="container">					
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>						
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu">
															
								<li class="active"><a href="#">My Profile</a></li>
								
								 <li role="presentation" class="small">
									<form class="navbar-form navbar-right" role="search"  action="LookupDates">
										    <div class="input-group add-on">										     	
										      
										      <input type="hidden" name="emailAddress" value="${email}"/>
										      <input type="text" class="form-control" placeholder="Lookup Dates" name=dateofApp id="dates" required SIZE='13'>
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
										      </div>
										    </div>
									 </form>									
						        </li> --%>
						        <ul class="nav nav-tabs" role="tablist">
						        <c:if test="${attribs.roles =='admin' || attribs.roles == 'super'}"> 			                 
			       		         <li><a href="admin?id=<c:out value='${attribs.id}'/>">Appointments</a></li>     
			       		        </c:if>
						        <li><a href="updateprofile?id=<c:out value='${attribs.id}'/>"> Update Profile</a> </li>						         						       
						        <li><a href="login">${user} | Logout</a></li>
						        
																			  						
							</ul>
						
			
	
	
	<div class="container">
		
			<div>
			
			<c:if test="${not empty error}"> 
				<h2 style="color: #FF0000">${error} </h2>
				</c:if>
				
				<h1 style="color: #008000">Make your Appointment here. </h1>
				<p style="color: #008000">${msg} </p>
				<h2 style="color: #008000">${message}</h2>
				<h2 style="color: #008000">${success} </h2>
				<c:if test="${not empty availabe}">
				<h2 style="color: #008000">${availabe}  <i class="glyphicon glyphicon-ok"></i> </h2>
				</c:if>
				<h2 style="color: #008000">${appointment} </h2>	
				  <%--      <c:choose>
						    <c:when  test="${attribs.status == 'pending'}">
				            <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#show">Make Appointment</button> 
						    </c:when> 
						    <c:when  test="${attribs.status == 'Declined'}">
				            <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#show">Re-request Appointment</button> 
						    </c:when>   
						    <c:otherwise>
						     <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#show">Re-schedule Appointment</button>
						    </c:otherwise>
						 </c:choose>
				<c:if test="${empty users}">						 	
				  <a class="btn btn-primary" title="Refresh Page" href="profile?id=<c:out value='${attribs.id}'/>">See Taken Dates</a>
				</c:if>	 --%>
				
				
			</div><br>
			
			
		<div>
		<div>
		 <div id="show" class="collapse">
		             <form method="post" action="makeAppointment" >			
							<div class="contact-form">													
								<div class="col-md-3">
									<div class="form-group">
									          <label for="app" id='app' style="color: #008000"> </label>
									          <input type="hidden" name="status" value="Pending" />
										      <input type="hidden" name="emailAddress" value="${email}"/>	
										      <input type="text" class="form-control" placeholder="Enter Date" name=dateofApp id="dates" required  SIZE='8'><br>										      										      	
										      <select name="timeofApp" id="timeofApp" class="form-control input">
										      	  <option value="9 AM" >09 AM</option>
                                                  <option value="10 AM">10 AM</option>
                                                  <option value="11 AM" >11 AM</option>
                                                  <option value="12 AM">12 PM</option>                                                  
                                                  <option value="1 PM" >01 PM</option>
                                                  <option value="2 PM">02 PM</option>
                                                  <option value="3 PM" >03 PM</option>
                                                  <option value="4 PM">04 PM</option>                                                                                                                                                       
                                                  <option value="" selected>Select Time</option>                                           
                                             </select> <br>
                                              <select name="msg" id="msg" class="form-control input">
										      	  <option value="Wedding Consults" >Wedding Consults (free)</option>
										      	   <option value="Cake Tasting">Cake Tasting ($30)</option>
                                                  <option value="Event Space">Request Event Space ($70 an hour)</option>
                                                  <option value="Art Commissions" >Art Commissions ($300 and up)</option>
                                                  <option value="Interviews">Articles/Interviews</option>
                                                  <option value="3 PM" >Speaking Engagements</option>                                                  
                                                  <option value="Painting" >SweetArt Painting Classes ($45 for 2 hours)</option>
                                                  <option value="Cooking">Love and Magic Cooking Class ($80)</option>  
                                                   <option value="Cooking">Miscellaneous</option>                                                                                                                                                                                            
                                                  <option value="" selected>Select An Event</option>                                           
                                             </select><br>
                                             <textarea class="form-control" id="comment" name="comment"  rows="5" placeholder="Brief Description" required></textarea>
				                             <br>								      									        
										      <button type="submit" name="submit" id="submit" class="btn btn-primary" >Submit </button>  
							 				  <button type="reset" name="reset" id="reset" class="btn btn-primary" >Reset </button>  
										 </div>
									</div>
							    </div>
					      </form>
				           </div>
					
		</div>
		
		
		
		<table class="table table-hover table-bordered">
				                <tr class="text-success" style="background-color: #bce8f1;">
				                <td><%= date.format(new java.util.Date()) %> </td>
				                <c:if test="${not empty attribs.dateofApp}">
				                <td>Appointment Time/Date</td>
				                <td>Status</td>
				                <td>Reason </td>
				                </c:if>
				                <td>Contact Info </td>
				                </tr>
				                <tr class="text-success">
				                <td><c:out value="${attribs.fname}"/>
	                    	     <c:out value="${attribs.lname}"/>
	                    	    </td>
	                    	    <c:if test="${not empty attribs.dateofApp}">
	                    	    <td>
	                     	    <c:out value="${attribs.dateofApp}"/> at <c:out value="${attribs.timeofApp}"/>	                     	    
                    	        </td>
                    	        <td><c:out value="${attribs.status}"/></td>
                    	        <td><c:out value="${attribs.msg}"/></td>
                    	        </c:if>
                    	        <td>
                    	          <%--  <i class="fa fa-home fa"></i>
	                    	     <c:out value="${attribs.address}"/>,
	                    	      <c:out value="${attribs.city}"/>
	                    	      <c:out value="${attribs.state}"/>
	                    	      <c:out value="${attribs.zip}"/> --%>
                    	          <i class="fa fa-phone fa"></i> ${attribs.tel}
                    	          <i class="fa fa-envelope fa"></i> ${attribs.emailAddress}
                    	        </td>	 
				                </tr>
				           </table>
				           
    		          </div>
	             </div>
	
<%-- 	<div class="container">	
	<c:if test="${not empty users}">
		<table class="table table-hover table-bordered">
                    <thead style="background-color: #ff6600;">
                    <tr >                         
                        <th>Booked Dates</th>                        
						<th>Status</th>                    	
                    </tr>
                    </thead>
                    <tbody  >
                     <c:forEach items="${users}" var="item">
                        <tr class="text-success">                            
                            <th> 
						       <c:out value="${item.dateofApp}"/> at <c:out value="${item.timeofApp}"/>
						    </th>
							<th>
							  ${item.status} - 
							<c:if test="${not empty item.dateofApp}">
							
							<c:choose>
						    <c:when test="${item.status =='Confirmed' || item.status == 'Pending'}"> 						       
						       Unavailable <i class="glyphicon glyphicon-ban-circle"></i>
						    </c:when>   
						    <c:otherwise>
						       Available  <i class="glyphicon glyphicon-ok"></i>  
						    </c:otherwise>
						   </c:choose>
							 
						    </c:if> 
							</th>						  	                	
                           </tr>
                           </c:forEach> 
                           
                    </tbody>
                </table>
                </c:if>
		</div>		
	 --%>
	 
	 <!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<ul class="icons">
						<li><a href= "https://www.facebook.com/SweetArt-Bakeshop-Cafe-528516367323486/"  class="icon fa-facebook">
						<span class="facebook">Facebook</span></a></li>
						<li><a href= "https://www.instagram.com/sweetartstlouis/"  class="icon fa-instagram">
							<span class="instagram">Instagram</span>
						</a></li>
						</ul>
						
					<ul class="copyright">
						<li>&copy; Geev's.</li>
						<!-- <li>Images: <a href="http://unsplash.com">Unsplash</a>.</li>-->
						<li>Website: <a href="http://sweetartstl.com">sweetartstl.com</a></li> 
					</ul>
				</div>
			</footer>
	 
  </body>
  
	
</html>
