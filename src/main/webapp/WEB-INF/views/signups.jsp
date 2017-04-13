<%-- 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

 <!-- Scripts -->
			<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${contextPath}/resources/assets/js/skel.min.js"></script>
			<script src="${contextPath}/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${contextPath}/resources/assets/js/main.js"></script>
	
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Sign up</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/main.css" type="text/css" />
    
  </head>
  
   <body>
	<header>		
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
							<ul class="nav nav-tabs" role="tablist">
								<li ><a href="index">Home</a></li>
								<li><a href="about">About Us</a></li>																
							<li><a href="contact">Contact Us</a></li>	
								<li class="active"><a href="signups">Sign up</a></li>
								<li><a href="login">Log in</a></li>						
							</ul> 
						</div>
					</div>						
				</div>
			</div> --%>	
			
			<%-- start of new code --%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
	<head>
		<title>Sign up</title>
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
						
  </head>
  <body>

		<!-- Header -->
			<header id="header">
				<h1><a href="index.html">Geev's Registration</a></h1>
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
					<!-- <div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li ><a href="index">Home</a></li>
																							
							
								
							</ul>
						</div>
					</div>						
				</div>
			</div>	 
		
	</header>	-->
	
	<a href="#" class="image fit"><img src="${contextPath}/resources/assets/img/SweetArtImages/CarmelCake.jpg" alt="" /></a>
	<div class="container">
		<div class="col-lg-8 col-lg-offset-3">
			<div>
			<br>
			<h1 style="color: #008000">Enter Information Below</h1>
			    <c:if test="${empty error}">
			    
				<c:if test="${empty message}">
				
				</c:if>
				<h2>				
				<c:if test="${not empty message}">
				<h1 style="color: #008000">Registration Successful</h1>
				<div class="text-success">
				<h2 style="color: #008000">${message} <a href="login">Login</a></h2>
				</div>						
				</c:if>				
				</h2>	
				<h2 style="color: #FF0000">${error} </h2>
				</c:if>			
			</div>
		</div>

		<div>
		     
		</div>
	</div>
	
	<form id="signupForm" method="post"  action="signupMember">                    
      <div class="contact-form">
              <div class="container">
                                  
                     <div class="col-md-4" >
                           <div class="form-group">
                              <label for="fn" id='efn' >First Name</label>
                              <input type=text id="fname" name="fname" class="form-control input-sm" placeholder="First Name" > 
                           </div>
                           
                     </div>
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="ln" id='eln' >Last Name</label>
                              <input type=text id="lname" name="lname" class="form-control input-sm" placeholder="Last Name" > 
                           </div>
                           
                     </div>
                     
                    <!--  <div class="col-md-4">
                           <div class="form-group">
                              <label for="ad" id='ead'>Address*</label>
                              <input type=text id="address" name="address" class="form-control input-sm" placeholder="Address" > 
                           </div>
                           
                     </div>
                     
                     <div class="col-md-2">
                           <div class="form-group">
                              <label for="tl" id='etl'> City</label>
                              <input type=text id="city" name="city" class="form-control input-sm" placeholder="City" > 
                           </div>
                           <div id='etl'>
                           
                           </div>
                     </div>
                     
                     <div class="col-md-2">
                           <div class="form-group">
                              <label for="tl" id='etl'> State</label>
                              <input type=text id="state" name="state" class="form-control input-sm" placeholder="State" > 
                           </div>
                           <div id='etl'>
                           
                           </div>
                     </div>
                     
                     <div class="col-md-2">
                           <div class="form-group">
                              <label for="tl" id='etl'> Zip</label>
                              <input type=text id="zip" name="zip" class="form-control input-sm" placeholder="Zip" > 
                           </div>
                           <div id='etl'>
                           
                           </div>
                     </div>
    
                      -->
                     <div class="col-md-2">
                           <div class="form-group">
                              <label for="tel" id='etel'>Telephone</label>
                              <input type=text id="tel" name="tel" class="form-control input-sm" placeholder="Telephone" > 
                           </div>
                           
                     </div>
                     
                     <div class="col-md-4">
                           <div class="form-group">
                                <label for="emailAddressInput" >Email</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="text" class="form-control" name="emailAddress" id="emailAddressInput" placeholder="Email Address" />
							    </div>                           
                     </div>
                     
                     <div class="col-md-2">
                           <div class="form-group">
                              <label for="ag" id='eag' >Age</label>
                              <input type='number' id="age" name="age" class="form-control input-sm" placeholder="Age"  min="21"> 
                           </div>
                           
                     </div>
            
                     
                    
                     
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="ag" id='eag' >Password</label>                               
                              <input type="password" class="form-control" name="password" id="password" placeholder="Password" />
                           </div>                           
                     </div>
                     
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="ag" id='eag' >Reenter password</label>                               
                              <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" placeholder="Re-enter password" />
                           </div>                           
                     </div>
                     
                     
                     
                     <div class="col-md-12" >
		                           <div class="form-group">
		                           <br>
					                   <button type="submit" name="submit" id="submit" class="btn btn-primary" >Submit</button>
					                    <button type="cancel" name="cancel" id="cancel" class="btn btn-primary" >Cancel</button>
					                  <!--  <a href="index" class="btn btn-primary" role="button">Cancel</a> -->		 									                						               
		                              </div>
                                  </div>                                                                                                
                             </div>
                        </div>                  
                  </form>
   
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
						<!-- <li>Images: <a href="http://unsplash.com">Unsplash</a>.</li> -->
						<li>Website: <a href="http://sweetartstl.com">sweetartstl.com</a></li> 
					</ul>
				</div>
			</footer>
	



	<script>
		$(function() {
			$('#dateOfBirthInput').datepicker();
		});
	</script>

	<script type="text/javascript">
		$(function() {
			var yesButton = $("#yesbutton");
			var progress = $("#doitprogress");

			yesButton.click(function() {
				yesButton.button("loading");

				var counter = 0;
				var countDown = function() {
					counter++;
					if (counter == 11) {
						yesButton.button("complete");
					} else {
						progress.width(counter * 10 + "%");
						setTimeout(countDown, 100);
					}
				};

				setTimeout(countDown, 100);
			});

		});
	</script>

   
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		
</html>
