<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<%java.text.DateFormat dft = new java.text.SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a "); %>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    
  </head>
  <body>
    <!-- <script>
    window.history.forward();
    </script> -->
    
   

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
								<!-- <li><a href="contact">Contact Us</a></li>	 -->
								<li><a href="signups">Sign up</a></li>
								<li class="active"><a href="login">Log in</a></li>				
							</ul>
						</div>
					</div>						
				</div>
			</div>				
	</header>
	
	<div class="container"> --%>
	
	<%-- start of new code --%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML>
<html>
	<head>
		<title>Log in</title>
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
				<h1><a href="index.html">Geev's Log in</a></h1>
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
		 <a href="#" class="image fit"><img src="${contextPath}/resources/assets/img/SweetArtImages/PieceOPie.jpg" alt="" /></a>
			<div>
				<h1 style="color: #008000">Geev's for SweetArt</h1>
				<p style="color: #008000">${msg} </p>
				<h2 style="color: #008000">${message}</h2>
				<h2 style="color: #008000">${success} </h2>
				<h2 style="color: #FF0000">${error} </h2>
				
			</div>
		<div></div>
	</div>
   
	<div class="container">	
		
		<div class="well">
			 <div class="row">
					<div class="col-lg-6">
						<form id="myForm" action="loginMember" method="post" class="bs-example form-horizontal">
							<fieldset>
								<br>								
								
								<div class="form-group">
									<label for="userNameInput" class="col-lg-3 control-label">Email</label>
									<div class="col-lg-9">
										<input type="text" class="form-control" name="emailAddress" id="emailAddress" placeholder="User Name" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="passwordInput" class="col-lg-3 control-label">Password</label>
									<div class="col-lg-9">
										<input type="password" class="form-control" name="password" id="password" placeholder="Password" />
									</div>
								</div>
								
								<br>
							<div class="col-lg-9 col-lg-offset-3">									
									<button class="btn btn-primary">Login</button>
									<button class="btn btn-primary">Cancel</button>
								<!-- 	<a href="index" class="btn btn-primary" role="button">Cancel</a> -->
									<a href="forgotpassword" class="btn btn-primary" role="button">Forgot Password</a>
								</div>	
							</fieldset>
						</form>
					</div>
				</div>
				
					
			</div>
			
		</div>		
	
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
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>
