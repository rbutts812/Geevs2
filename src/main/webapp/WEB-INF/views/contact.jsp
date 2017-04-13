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
								<li class="active"><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="login">Log in</a></li>		
							</ul>
						</div>
					</div>						
				</div>
			</div>	
				
	</header>
   
	<div class="container">	
			<div class="container">
		     <div class="col-lg-12">
				<div class="form-group"><br>
				<span class="text-success">${success}</span>
				<div class="text-center">
				<div class="text-primary">${message}</div>
				</div>
				
				</div>
			</div>
			</div>
			</div>
<form id="emails" method="post" action="sendEmail">			
		<div class="contact-form">
		<div class="container">	
								
			<div class="col-md-4">
				<div class="form-group">
					<input type="email" class="form-control"  value="${em}" id="emailAddress" name="emailAddress" placeholder="email Address">
					<span class="text-danger">${emailrror}</span>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<input type="text" class="form-control" value="${sb}" id="subject" name="subject" placeholder="subject">
			    	<span class="text-danger">${sbjrror}</span>
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="col-lg-12">				
				<textarea class="form-control" id="msg" name="msg"  rows="5" placeholder="message"></textarea>
				<p class="text-danger">${msgerror}</p>
				
				<div class="form-group">
					<button type="submit" name="submit" class="btn btn-primary" >Submit Message</button>
					<a href="contact" class="btn btn-primary" role="button">Reset</a>
					<br>
					<p>SweetArt<br><i class="fa fa-home fa"></i>2203 South 39th Street,<br> St. Louis, MO 63110<br><i class="fa fa-phone fa"></i>(314) 771-4278	
  				</p> 
				</div>
			</div>
		</div>		
	</div>
</form>	

  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>


