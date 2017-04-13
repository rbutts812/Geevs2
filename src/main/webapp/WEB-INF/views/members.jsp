<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script>
    window.history.forward();
    </script>
    
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
							    <li >
						        <a href="profile?id=<c:out value='${user.id}'/>"> My Profile</a>    		  
			                    </li>
								<li class="active"><a href="">Members</a></li>									
								<li role="presentation" class="small">
									<form class="navbar-form navbar-right" role="search"  action="LookupMembers">
										    <div class="input-group add-on">
										      <input type="hidden" name="id" value="${user.id}"/>
										      <input type="text" class="form-control" placeholder="Search Members" name="LookupMembers" id="LookupMembers" SIZE='13'>
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
										      </div>
										    </div>
									 </form>									
						        </li>
						        
			                    <li><a href="login">Logout | ${user.fname}</a></li>	
							</ul>
						</div>
					</div>						
				</div>
			</div>				
	</header>
	
	<div class="container">
		                   <c:choose>
							    <c:when test="${empty users}">
							     <div>
									
									<h2>${message}</h2>
									<h2>${success} ${role}</h2>
									<h2>${error} </h2>				
								 </div>    
							    </c:when>    
							    <c:otherwise>
							     <div>
									
									<p>${msg} </p>
									
									<h2>${message}</h2>
									<h2>${success}</h2>
									<h2>${error} </h2>				
								</div>     
							    </c:otherwise>
							</c:choose>	
		               <div>
		               
		<c:if test="${not empty users}">
		<table class="table table-hover table-bordered">
                    <thead style="background-color: #ff6600;">
                    <tr > 
                        <th>Id</th>                        
                        <th>Name</th>
                        <th>Email</th>
                        <th>Telephone</th>	
                        <th>Address</th> 			
						                  	
                    </tr>
                    </thead>
                    <tbody  >
                     <c:forEach items="${users}" var="item">
                        <tr class="text-success">
                            <th><c:out value="${item.id}"/></th>                           
							<th><c:out value="${item.fname}"/> <c:out value="${item.lname}"/>
							</th>
							<th><c:out value="${item.emailAddress}"/></th> 
							<th><c:out value="${item.tel}"/></th> 
							<th><c:out value="${item.address}"/>, <c:out value="${item.city}"/>
						    <c:out value="${item.state}"/> <c:out value="${item.zip}"/></th>
							 					                	
                           </tr>
                           </c:forEach>
                    </tbody>
                </table>
		</c:if>
		</div>
	</div>
   
	<div class="container">	
		
		</div>		
	
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>
