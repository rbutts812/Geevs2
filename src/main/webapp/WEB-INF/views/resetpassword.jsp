

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
								<li class="active"><a href="">Password Reset</a></li>
								<li><a href="login">login</a></li>						
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		
	</header>
	
	<div class="container">
		<div class="col-lg-8 col-lg-offset-3">
			<div>
			
			    <h1 style="color: #008000">Reset Password</h1>
				
				<h2 class="text-success" >${message} </h2>				
				<h2 class="text-danger" >${error} </h2>
							
			</div>
		</div>

		<div>
		     
		</div>
	</div>
	
	<form id="getnewpass" method="post"  action="getnewpass">
                    
      <div class="contact-form">
              <div class="container">
              
                     <div class="col-md-4">
                           <div class="form-group">
                                <label for="emailAddressInput" >Email*</label>									
									    <input type="hidden" class="form-control" name="roles" value="user"/>
										<input type="text" class="form-control" name="emailAddress" id="emailAddressInput" placeholder="Email Address" />
							    </div>                           
                     </div>
              
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="ag" id='eag' >Password*</label>                               
                              <input type="password" class="form-control" name="password" id="password" placeholder="Password" />
                           </div>                           
                     </div>
                     
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="ag" id='eag' >Reenter password*</label>                               
                              <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" placeholder="Re-enter password" />
                           </div>                           
                     </div>                     
                     <div class="col-md-12" >
		                           <div class="form-group">		                           
					                   <button type="submit" name="submit" id="submit" class="btn btn-primary" >Submit</button>
					                   <a href="index" class="btn btn-primary" role="button">Cancel</a>
								 		
		                              </div>
                                  </div> 
                                  
                                  
                                  
              </div>
       </div>         
           
        </form>
   

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
