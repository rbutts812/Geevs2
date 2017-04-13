

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
  <head>
		<meta charset="utf-8" />
	 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Home</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/assets/css/main.css" type="text/css" />
	<%-- <link rel="stylesheet" href="${contextPath}/resource/css/styles.css" type="text/css"> --%>
	
	<!-- Scripts -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
			<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${contextPath}/resources/assets/js/skel.min.js"></script>
			<script src="${contextPath}/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${contextPath}/resources/assets/js/main.js"></script>
   			<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
			<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
  </head>

	<body class="landing">

		<!-- Header -->
			<header id="header" class="alt">
				<h1><a href="index.html">Geev's</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="nav" name ="nav" >
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<!-- <li><a href="generic.html">Generic</a></li>
					<li><a href="elements.html">Elements</a></li> -->
					<li><a href="about">About Us</a></li>
					<li><a href="signups">Sign up</a></li>
					<li><a href="login">Log in</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<a href="#" class="image fit"><img src="${contextPath}/resources/assets/img/SweetArtImages/cookies.jpg" alt="" /></a>
				<!--<h2>Welcome</h2>
				<p>To Geev's for SweetArt</p>
				<!-- <ul class="actions">
					<li><a href="#" class="button big special">Learn More</a></li>
				</ul> -->
			</section>

		<!-- One -->
			<section id="one" class="wrapper style1">
				<div class="inner">
					<article class="feature left">
						<span class="image"><img src="${contextPath}/resources/assets/img/SweetArtImages/HomePage.jpg" alt="" /></span>
						<div class="content">
							<h2><i>Welcome To Geev's for SweetArt.</i> This page was designed to be helpful and responsive.</h2>
							<p>We are glad you came! Here is where you can schedule from a selection of available classes, 
							reserve space for a special occassion, brainstorm for a masterpiece, and more. Just sign up to get started!   </p>
							<ul class="actions">
								<li>
									<a href="signups" class="button alt">Sign up</a>
								</li>
							</ul>
						</div>
					</article>
					<article class="feature right">
						<span class="image"><img src="${contextPath}/resources/assets/img/SweetArtImages/ManyPies.jpg" alt="" /></span>
						<div class="content">
							<h2>We are anxious to hear from you!</h2>
							<p>Just log in and we are here to help... </p>
							<ul class="actions">
								<li>
									<a href="login" class="button alt">Log in</a>
								</li>
							</ul>
						</div>
					</article>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper special">
				<div class="inner">
					<header class="major narrow">
						<h2>You are apart of our family!</h2>
						<p> Just like grandma we are always here with delicious treats to satisfy all your hankerings!</p>
					</header>
					<div class="image-grid">
					 	
						
				 <a href="#" class="image"><img src=" ${contextPath}/resources/assets/img/SweetArtImages/PanOfBiscuits.jpg" alt="" /></a>
				 		<a href="#" class="image"><img src=" ${contextPath}/resources/assets/img/SweetArtImages/GingerBreadCupCakes.jpg" alt="" /></a> 
						<a href="#" class="image"><img src=" ${contextPath}/resources/assets/img/SweetArtImages/BrkfstTacos.jpg" alt="" /></a>												
					    <a href="#" class="image"><img src=" ${contextPath}/resources/assets/img/SweetArtImages/pizzas.jpg" alt="" /></a>						
						
						<%-- <a href="#" class="image"><img src= "${contextPath}/resources/assets/img/SweetArtImages/ChilliCheeseBurger.jpg" alt="" /></a>
						<a href="#" class="image"><img src=" ${contextPath}/resources/assets/img/SweetArtImages/cookies.jpg" alt="" /></a> 
						<a href="#" class="image"><img src=" ${contextPath}/resources/assets/img/SweetArtImages/FauxstessCake.jpg" alt="" /></a> 
						<a href="#" class="image"><img src=" ${contextPath}/resources/assets/img/SweetArtImages/weddingCake.jpg" alt="" /></a>--%> 
					</div>
					<!-- <ul class="actions">
						<li><a href="#" class="button big alt">Tempus Aliquam</a></li>
					</ul> -->
				</div>
			</section>

		<!-- Three -->
		<!-- 	<section id="three" class="wrapper style3 special">
				<div class="inner">
					<header class="major narrow	">
						<h2>Magna sed consequat tempus</h2>
						<p>Ipsum dolor tempus commodo turpis adipiscing Tempor placerat sed amet accumsan</p>
					</header>
					<ul class="actions">
						<li><a href="#" class="button big alt">Magna feugiat</a></li>
					</ul>
				</div>
			</section> -->

		<!-- Four -->
			<section id="four" class="wrapper style2 special">
				<div class="inner">
					<header class="major narrow">
						<h2>Get in touch with us!</h2>
						<p>SweetArt Bakery<br><i class="fa fa-home fa"></i> 2203 South 39th Street,<br> St. Louis, MO 63110<br><i class="fa fa-phone fa"></i> (314) 771-4278	
					</header>
					<form action="#" method="POST">
						<div class="container 75%">
							<div class="row uniform 50%">
								<div class="6u 12u$(xsmall)">
									<input name="name" placeholder="Name" type="text" />
								</div>
								<div class="6u$ 12u$(xsmall)">
									<input name="email" placeholder="Email" type="email" />
								</div>
								<div class="12u$">
									<textarea name="message" placeholder="Message" rows="4"></textarea>
								</div>
							</div>
						</div>
						<ul class="actions">
							<li><input type="submit" class="special" value="Submit" /></li>
							<li><input type="reset" class="alt" value="Reset" /></li>
						</ul>
					</form>
				</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<ul class="icons">
						<li><a href= "https://www.facebook.com/SweetArt-Bakeshop-Cafe-528516367323486/"  class="icon fa-facebook">
							<span class="label">Facebook</span></a>
						<!-- </li>
						<li><a href="#" class="icon fa-twitter">
							<span class="label">Twitter</span>
						</a></li> -->
						<li><a href= "https://www.instagram.com/sweetartstlouis/" class="icon fa-instagram">
							<span class="label">Instagram</span>
						</a></li>
						<!-- <li><a href="#" class="icon fa-linkedin">
							<span class="label">LinkedIn</span>
						</a></li> -->
					</ul>
					<ul class="copyright">
						<li>&copy; Geev's.</li>
						<!-- <li>Images: <a href="http://unsplash.com">Unsplash</a>.</li> -->						
						<li>Website: <a href="http://sweetartstl.com">sweetartstl.com</a></li> 
					</ul>
				</div>
			</footer>

		
	</body>
		
   
  </body>
    
  	<script>
 	 
$("#submit").on("click",function(){
		
        var numeric =/^-{0,1}\d*\.{0,1}\d+$/;
        var msg ='Enter Numbers only';
        
        if ($.trim($("#system").val())=="Select Units") {
			$("#sy").html('Please Select Units'); 
			$('#sy').css('color', '#FF0000');	
	        return false;	       
	    }
		
		if ($.trim($("#w").val())==0 || !($.trim($("#w").val().match(numeric))) ) {
			$("#wt").html(msg); 
			$('#wt').css('color', '#FF0000');       
	        $("#w").focus();
	        return false;	       
	    }
		
		if ($.trim($("#h").val())==0 || !($.trim($("#h").val().match(numeric)))) {
			$("#ht").html(msg); 
			$('#ht').css('color', '#FF0000');	        
	        $("#h").focus();
	        return false;	       
	    }
		
		
		
	}); 
	
 	 </script>
 	 
 	 <script>
$("#system").on("click",function(){
		
        
		if ($.trim($("#system").val())=="imperial" ) {
			$("#wt").html('lb'); 
			$("#ht").html('in'); 
	        return false;	       
	        }else{
	     if ($.trim($("#system").val())=="metric" ) {
			$("#wt").html('kg');
			$("#ht").html('cm'); 
	        return false;	       
	        }
	      }
		
	}); 
	
 	 </script>
 	 
</html>



