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
								<li class="active"><a href="#">Appointments</a></li>									
								<li role="presentation" class="small">
									<form class="navbar-form navbar-right" role="search"  action="searchMembers">
										    <div class="input-group add-on">
										      <input type="hidden" name="emailAddress" value="${email}"/>
										      <input type="hidden" name="user" value="${user}"/>
										       <input type="hidden" name="role" value="${role}"/>
										      <input type="text" class="form-control" placeholder="Search Customers By Name" name="searchNames" id="searchNames" SIZE='22'>
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
										      </div>
										    </div>
									 </form>									
						        </li>
						        <li>
						           		  
			                    </li>
			                    <li><a href="login">Log out | ${user}</a></li>	
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
									<h1>Management Page</h1>
									
									<h2>${message}</h2>
									<h2>${success} </h2>
									<h2>${error} </h2>	
									<h2>${email}</h2>				
								 </div>    
							    </c:when>    
							    <c:otherwise>
							     <div>
									<h1>User Management Panel
									<!-- <a class="btn btn-primary" href="signups">Add new user</a> -->
									</h1>
									<p>${msg} </p>
									
									<h2>${message}</h2>
									<h2>${success} </h2>
									<h2>${error} </h2>				
								</div>     
							    </c:otherwise>
							</c:choose>	
		               <div>
		               
		<c:if test="${not empty users}">
		<table class="table table-hover table-bordered">
                    <thead style="background-color:#2ee8e8;">
                    <tr > 
                        <th>Id</th>
                        <th>Date of appointment</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Telephone</th>	                         
                        <c:if test="${role == 'super'}">
                        <th>Assign Role</th> 
                        <th>Delete User</th> 
                        </c:if>
						<th>Status (Accept/Decline) </th>                    	
                    </tr>
                    </thead>
                    <tbody  >
                     <c:forEach items="${users}" var="item">
                        <tr class="text-success">
                            <th><c:out value="${item.id}"/></th>
                            <th>
                            <c:choose>
						    <c:when test="${not empty item.dateofApp}">
						       <c:out value="${item.dateofApp}"/> at <c:out value="${item.timeofApp}"/>
						    </c:when>   
						    <c:otherwise>
						     No appointment   
						    </c:otherwise>
						   </c:choose>	
                            
                    	     </th>
							<th>							
							<c:choose>
						    <c:when test="${role == 'super'}">
						      <c:out value="${item.fname}"/> <c:out value="${item.lname}"/>
						     <%--  <a title="edit User" href="editUser?id=<c:out value='${item.id}'/>"><span class="glyphicon glyphicon-edit"></span> edit</a>
							 --%></c:when>   
						    <c:otherwise>
						     <c:out value="${item.fname}"/> <c:out value="${item.lname}"/>   
						    </c:otherwise>
						   </c:choose>	
							</th>
							<th><c:out value="${item.emailAddress}"/></th> 
							<th><c:out value="${item.tel}"/></th> 
							 <c:if test="${role == 'super'}"> 
							 <th>
							  <form action="assignRole">
										    <div class="input-group add-on">
										      <input type="hidden" name="id" value="${item.id}"/>
										      <input type="hidden" name="role" id="role" value="${role}"/>
										      <input type="hidden" name="user" id="user" value="${user}"/>										      
										      <select name="roles" id="roles" class="form-control input">
										      	  <option value="super" >super</option>
                                                  <option value="admin">admin</option>
                                                  <option value="user" >user</option>                                                                                                   
                                                  <option value="" selected>${item.roles}</option>                                           
                                             </select> 
										      <div class="input-group-btn">
										         <button class="btn btn-success" type="submit"  title="assign roles">submit</button>
										      </div>
										  </div>
									 </form>				 
							 <th><a href="deleteUser?id=<c:out value='${item.id}'/>&role=<c:out value='${role}'/>&user=<c:out value='${user}'/>"><span class="glyphicon glyphicon-trash"></span> delete</a></th>                    	     
							  </c:if>  				 
							  <th>
							           <form action="acceptOrDecline">
										    <div class="input-group add-on">
										      <input type="hidden" name="id" value="${item.id}"/>
										      <input type="hidden" name="role" id="role" value="${role}"/>
										      <input type="hidden" name="user" id="user" value="${user}"/>
										      <input type="hidden" name="emailAddress" value="${item.emailAddress}"/>
										      <select name="status" id="status" class="form-control input">
										      	  <option value="Confirmed" >Confirmed</option>
                                                  <option value="Declined">Declined</option>                                                                                                                                                    
                                                  <option value="" selected>${item.status}</option>                                           
                                             </select> 
										      <div class="input-group-btn">
										         <button class="btn btn-success" type="submit"  title="Accept or Decline">submit</button>
										      </div>
										    </div>
									 </form>		
							    </th>
                    	    					                	
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
