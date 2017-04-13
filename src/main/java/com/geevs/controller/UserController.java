package com.geevs.controller;

import java.text.ParseException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.geevs.model.Geevs;
import com.geevs.model.UserLogin;
import com.geevs.service.MailService;
import com.geevs.service.SendMail;
import com.geevs.service.GeevsService;


@Controller
@RequestMapping("/")
public class UserController {
	
		    public UserController() {
				System.out.println("in UserController servelet");
			}
		    
		    @Autowired
	     	private MailService mailServices; 
	       
		    
		    @Autowired
		    DataSource dataSource;
		    
		    SendMail sendMail= new SendMail();
		    
		    SendMail mailService =new SendMail();
		    
		   @Autowired
		   private GeevsService geevsService; 
	    
		   @RequestMapping(value = {"index", "/"}, method = RequestMethod.GET)
		    public String index(Model model){ 
		    
		    	return "index";				 
			}
	    
	       @RequestMapping(value = "/signups", method = RequestMethod.GET)
		    public String signups(Model model) {
		              model.addAttribute("signupMember", new UserLogin());
		              
		        return "signups";
		    }
	    
		    @RequestMapping("signupMember")
		    public String signupMember(@ModelAttribute("signupMember") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	 String msg="Welcome to Geev's, you are a valued customer and we appreciate you using this time saving tool to assist us in continuing to give the best customer service. We look forward to serving you in the future! This is your confirmation email, you are now a member. You can login now to make appointments here: <a href='http://localhost:8082/geevs2/login'></a>";     	
		    	try {
		    		    if(geevsService.findUser(userLogin.getEmailAddress())== false){
		    		    	if(userLogin.getPassword().equals(userLogin.getPasswordConfirm())){
		    		    		geevsService.createUser(userLogin);	
		    		    		model.addAttribute("message", " "+userLogin.getFname()+" Login now <a href='login'>Login </a>");
				    			
		    		    		try{
		    		    			sendMail.sendMails(userLogin.getEmailAddress(), " to geevs ", msg);
		    		    			model.addAttribute("success", "Confirmation email has been sent to "+ userLogin.getEmailAddress()+ " thanks");				                  
					    			
		    		    		}catch(Exception e){
		    		    			model.addAttribute("error", "Error sending confirmation email to "+ userLogin.getEmailAddress());	
		    		    		}
		    		    		  
		    		    		return "login";
		    		    	}
		    		    	else {		    		    		
				    			model.addAttribute("error", "Password not matching ");			    		
		    		    	}
				    			
		                } else {		                	
		                	model.addAttribute("error", "A user exists with the supplied email "+userLogin.getEmailAddress()+" <a href='login'>Login </a>");	
		                	
		               }
		    		
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					    
				  }
		    		
		         return "signups";
		    	
		    }
		    
		    
		    
		    @RequestMapping(value = "/login", method = RequestMethod.GET)
		    public String login(Model model) {
		    	model.addAttribute("loginMember", new UserLogin());
		    	model.addAttribute("msg", "Please enter email address and password below.");
		        return "login";
		    }
		    
		    @RequestMapping(value = "/loginMember", method = RequestMethod.POST)
		    public String login(@ModelAttribute("loginMember") UserLogin user, ModelMap model) throws ParseException{	    	
		    	
		    	try {
		    		
		    		UserLogin userdetail= geevsService.getUserByEmailId(user.getEmailAddress());
		    		 if(geevsService.findUser(user.getEmailAddress())== true){
		    			 if(userdetail.getEmailAddress().equals(user.getEmailAddress()) && userdetail.getPassword().equals(user.getPassword()) ){
				    			if(userdetail.getRoles().equalsIgnoreCase("admin") || userdetail.getRoles().equalsIgnoreCase("super")){
				    				model.addAttribute("success", "Welcome "+ userdetail.getFname()+"! ");
				    				model.addAttribute("users", geevsService.getAllusers());
				    				model.addAttribute("role", userdetail.getRoles());
				    				model.addAttribute("user", userdetail.getFname());
				    				return "admin";
				    			}else{		    			
				    		        model.addAttribute("success", "Welcome "+ userdetail.getFname()+" This is a secure zone! ");		    		        
				    		        model.addAttribute("attribs", userdetail);
				    		        model.addAttribute("user", userdetail.getFname());
				    		        model.addAttribute("role", userdetail.getRoles());
				    		        model.addAttribute("email", userdetail.getEmailAddress());
				    		        model.addAttribute("users", geevsService.getAllusers());
				    		        return "geevs";
				    			}
				    		}else{
				    			model.addAttribute("error", "Invalid credentials try again ");	
				    		}	
		    		  }
				    }
					catch(EmptyResultDataAccessException e){
						model.addAttribute("error", "User "+user.getEmailAddress()+" does not exists <a href='signups'>Sign up </a>");					    
					  }catch(RuntimeException e) {						
							model.addAttribute("error", "Unexpected error occured");
							e.printStackTrace();
						    
					  }
		    	
		    	return "login";
		    }
		    
		    @RequestMapping("deleteUser")
		    public String searchStudents(@RequestParam long id, @RequestParam("user") String user, @RequestParam("role") String role, ModelMap model){    	
		    			
		    	try { 
		    		UserLogin userdetail= geevsService.getUserById(id);
		    		if(userdetail.getRoles().equalsIgnoreCase("super")){
		    			model.addAttribute("error", "cannot delete user with administrator role");
		    			model.addAttribute("users", geevsService.getAllusers());
		    			model.addAttribute("role", role);
	    				model.addAttribute("user", user);
	    				
			    		}else{
			    		geevsService.deleteUserById(id);
			            model.addAttribute("success", "User deleted successfully");
			            model.addAttribute("users", geevsService.getAllusers());
			            model.addAttribute("role", role);
	    				model.addAttribute("user", user);
	    				
			    		}
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					    
				  }
		    		
		    	return "admin";
		    }
		    
		    
		    @RequestMapping("editUser")
		    public String editUser(@RequestParam long id, @ModelAttribute UserLogin userLogin, ModelMap model){    	
		    	
		    	try {
		    		if(geevsService.getUserById(id).getRoles().equalsIgnoreCase("super")){
		    			model.addAttribute("error", "cannot edit a user with super role");
		    			model.addAttribute("users", geevsService.getAllusers());
		    			return "admin";
			    		}else{
		    		    model.addAttribute("attribs", geevsService.getUserById(id));			    		    
				        }
		    		}
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					   
				    }		    		
		    	return "dataEdit";
		    }
		    
		    @RequestMapping("updateprofile")
		    public String userEdits(@RequestParam long id, @ModelAttribute UserLogin userLogin, ModelMap model){    	
		    	
		    	try {
		    		userLogin = geevsService.getUserById(id);
		    		model.addAttribute("attribs", geevsService.getUserById(id));
		    		model.addAttribute("user", userLogin.getFname());
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }
		    		
		    	return "UserUpdateForm";
		    }
		    
		    @RequestMapping("userEdit")
		    public String userEdit(@ModelAttribute("userEdit") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try {
				    System.out.println(userLogin.getId());		
		    		        geevsService.updateUserById(userLogin, userLogin.getId());
				    		model.addAttribute("message", "Update Success");
				    		model.addAttribute("attribs", geevsService.getUserById(userLogin.getId()));
				    		model.addAttribute("user", geevsService.getUserById(userLogin.getId()).getFname());				    		
				    		model.addAttribute("email", userLogin.getEmailAddress());						       
				    		return "geevs";
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "UserUpdateForm";
		    }
		    
		    @RequestMapping("saveUser")
		    public String adminEdit(@ModelAttribute("saveUser") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try { 
		       		        geevsService.updateUserById(userLogin, userLogin.getId());
				    		model.addAttribute("message", "User "+userLogin.getFname()+ " "+ userLogin.getLname()+" Updated");
				    		model.addAttribute("users", geevsService.getAllusers());
				    		return "admin";
		    					    		
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "dataEdit";
		    }
		    
		    @RequestMapping(value = "/admin", method = RequestMethod.GET)
		    public String admin(@RequestParam long id, @ModelAttribute UserLogin user, Model model) {
		    	UserLogin userdetail= geevsService.getUserById(id);
	    		
		    	model.addAttribute("users", geevsService.getAllusers());				
				model.addAttribute("role", userdetail.getRoles());
				model.addAttribute("user", userdetail.getFname());
				model.addAttribute("id", userdetail.getId());
				    	              
		        return "admin";
		    }
		    
		    @RequestMapping(value = "/profile", method = RequestMethod.GET)
		    public String profile(@RequestParam long id, @ModelAttribute UserLogin user, Model model) {
		    	UserLogin userdetail= geevsService.getUserById(id);	    		
		    	model.addAttribute("success", " "+ userdetail.getFname()+" This is a secure zone! ");		    		        
		        model.addAttribute("attribs", userdetail);
		        model.addAttribute("user", userdetail.getFname());
		        model.addAttribute("role", userdetail.getRoles());
		        model.addAttribute("users", geevsService.getAllusers()); 
		        model.addAttribute("email", userdetail.getEmailAddress()); 

		        
		        return "geevs";
		    }
		    
		    @RequestMapping("acceptOrDecline")
		    public String acceptstatus(@ModelAttribute("acceptOrDecline") UserLogin userLogin, @RequestParam("user") String user, @RequestParam("role") String role, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try {
		    		UserLogin userdetail= geevsService.getUserById(userLogin.getId());
		    		accept(userLogin, userLogin.getStatus(), userLogin.getId());
		    		try{
		    			String msg="Thank you for your request. Your appointment was "+userLogin.getStatus();
		    			model.addAttribute("role", role);
						model.addAttribute("user", user);
		    			model.addAttribute("success", "User "+userdetail.getFname()+" has been "+userLogin.getStatus());
		    			model.addAttribute("users", geevsService.getAllusers());	
			    		sendMail.sendMails(userLogin.getEmailAddress() , userLogin.getStatus(), msg);					          
			    		model.addAttribute("email", userLogin.getStatus()+ " email has been sent to "+ userLogin.getEmailAddress());   
		    		}catch(Exception e){model.addAttribute("error", "send email fail");}
		    		}
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					   
				  }	
		    	 return "admin";
		    }
		    
		    public void accept(UserLogin userLogin, String status, long id) {    	
		    	String UpdateSql = "UPDATE users SET status=? where id=? ";    	
		  	     JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
				  	  jdbcTemplate.update(
				  			UpdateSql,
				  			new Object[] { 		   
				  					    userLogin.getStatus(), 
				  					    userLogin.getId()
				  					  
				  						});  
				  	
				  	
		  	  }

		    
		    @RequestMapping("assignRole")
		    public String assignrole(@ModelAttribute("assignRole") UserLogin userLogin, @RequestParam("user") String user, @RequestParam("role") String role, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try {
		    		String roles= geevsService.getUserById(userLogin.getId()).getRoles();
		    		if(roles.equalsIgnoreCase("super")){
		    			model.addAttribute("role", role);
						model.addAttribute("user", user);
		    			model.addAttribute("error", "cannot re-assign new roles to a user with a super role");
		    			model.addAttribute("users", geevsService.getAllusers());
			    		}else{
		    		geevsService.updaterole(userLogin, userLogin.getRoles(), userLogin.getId());
		    		model.addAttribute("role", role);
					model.addAttribute("user", user);
		    		model.addAttribute("users", geevsService.getAllusers());
		    		model.addAttribute("success", "User "+geevsService.getUserById(userLogin.getId()).getFname()+" assigned role "+userLogin.getRoles());
			    		}
		    		}
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					   
				  }	
		    	 return "admin";
		    }
		    
		    
		    @RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
		    public String forgotpass(Model model) {
		    	 return "forgotpassword";
		    }
		    
		    @RequestMapping(value = "/resetpassword", method = RequestMethod.GET)
		    public String resetpass(Model model) {
		    	model.addAttribute("message", "Reset your password"); 
		    	
		        return "resetpassword";
		    }
		    
		    
		    @RequestMapping(value = "/forgotpass", method = RequestMethod.POST)
		    public String forgotpass(@ModelAttribute("forgotpass") Geevs geevs, BindingResult bindingResult, Model model) { 
		    	          
		    	          String validemails = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"; 
		    	          model.addAttribute("em", geevs.getEmailAddress());		       	                     
		                  
		                  if(!geevs.getEmailAddress().matches(validemails)) {
		                	  model.addAttribute("emailrror", "Invalid email "+ geevs.getEmailAddress()+ " use format johnsmith@scglobal.com ");		                  
		   	               }
		                  else
				       
				             try {     
				            	 if(geevsService.findUser(geevs.getEmailAddress())== true){
				            		 try{
				            			   mailServices.sendpasswordemail(geevs.getEmailAddress());
						                   model.addAttribute("success", "Password reset instuction has been sent to "+ geevs.getEmailAddress());
						                   model.addAttribute("emailrror", "");
						       	           model.addAttribute("em", "");
						       	           
				    		    		}catch(Exception e){
				    		    			model.addAttribute("error", "Error sending email to "+ geevs.getEmailAddress());	
				    		    		}
				            	   
				            	 }else{
				            		 model.addAttribute("success", "user not found "+ geevs.getEmailAddress()); 
				            	 }
						        }catch(Exception e) {
						                 model.addAttribute("sendmailfail", "Error sending email  " );
						                 e.printStackTrace();
						        }
						
						return "login";
				    }
		    
		    
		    @RequestMapping(value = "/getnewpass", method = RequestMethod.POST)
		    public String setpass(@ModelAttribute("getnewpass") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try {
		    		UserLogin userdetail= geevsService.getUserByEmailId(userLogin.getEmailAddress());
		    		if(geevsService.findUser(userLogin.getEmailAddress())== true){
			    		if(userLogin.getPassword().equals(userLogin.getPasswordConfirm())){
			    			if(userdetail.getRoles().equalsIgnoreCase("admin") || userdetail.getRoles().equalsIgnoreCase("super")){
			    				
			    				try{
			    					model.addAttribute("users", geevsService.getAllusers());
				    				model.addAttribute("role", "You are an admin with  "+userdetail.getRoles()+" role");
				    				model.addAttribute("success", "password reset success, please keep your password safely.");
						    		
			    					geevsService.passReset(userLogin, userLogin.getPassword(), userLogin.getEmailAddress());
						    		mailService.sendMails(userLogin.getEmailAddress() , "Geevs Password", "Your password was reset contact admin if you did not do it");
					    		
						    		   
			    		    		}catch(Exception e){
			    		    			model.addAttribute("error", "Error sending email to "+ userdetail.getEmailAddress()+ " Please check your network");	
			    		    		}
			    				
			    				return "admin";
			    			}else{
			    				try{
			    					geevsService.passReset(userLogin, userLogin.getPassword(), userLogin.getEmailAddress());
						    		model.addAttribute("success", "password reset success, please keep your password safely.");
						    		model.addAttribute("attribs", userdetail); 
						    		mailService.sendMails(userLogin.getEmailAddress() , "Geevs Password", "Your password was reset contact admin if you did not make this request.");
					    		
				    		          
			    		    		}catch(Exception e){
			    		    			model.addAttribute("error", "Error sending email to "+ userdetail.getEmailAddress()+ " Please check your network");	
			    		    		}
			    				
			    		        return "geevs";
			    			}
			    			
			    		}else{
			    			model.addAttribute("error", "Password not matching ");	
			    			return "resetpassword";
			    		}	
			    		}
		    		    else{
		    		    	model.addAttribute("error", "No user found, <a href='signups'>Sign up </a>");
		    		    }

		    		}
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "login";
		    }
		    
		    		    
		    @RequestMapping("makeAppointment")
		    public String makeAppointment(@ModelAttribute("makeAppointment") UserLogin user, ModelMap model) throws ParseException{    	
		    	
		    		try {
		    		
		    		
				    		saveApntDate(user, user.getDateofApp(), user.getTimeofApp(), user.getStatus(), user.getMsg(), user.getAddress());			    				    		        
					        model.addAttribute("attribs", geevsService.getUserByEmailId(user.getEmailAddress()));
					        model.addAttribute("appointment", "Your appointment has been submitted, a confirmation email will be sent to you. Please check your email. " +user.getDateofApp());
					        model.addAttribute("email", user.getEmailAddress());
					        model.addAttribute("user", user.getFname());
					        sendMail.sendMails(user.getEmailAddress() , user.getStatus(), user.getMsg());
						    }
							catch(RuntimeException e) {
								model.addAttribute("error", "Unexpected error occured");
							    e.printStackTrace();
							    
						  }
				    		
				    	return "geevs";
				    }
		    
		    @RequestMapping("searchMembers")
		    public String searchMembers(ModelMap model, @RequestParam("searchNames") String names, @RequestParam("emailAddress") String email,
		    		@RequestParam("role") String role, @RequestParam("user") String user){    	
		    	
		    	try { 
		    		//List<UserLogin> memberList = geevsService.lookupMembers(email);
		    		if(geevsService.lookupMembers(names).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		                model.addAttribute("email", email);
				        model.addAttribute("user", user);
				        model.addAttribute("role", user);
				        model.addAttribute("users", geevsService.lookupMembers(names));
		               }
		    		else		    				
		    			model.addAttribute("users", geevsService.lookupMembers(names));
		    		    model.addAttribute("email",email);
			            model.addAttribute("user", user);
			            model.addAttribute("role", role);
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					    
				  }
		    		
		    	return "admin";
		    }
		    
		    @RequestMapping("LookupDates")
		    public String searchdates(ModelMap model, @RequestParam("dateofApp") String dateofApp, @RequestParam("emailAddress") String email) throws ParseException{    	
		    	
		    	/*if (new SimpleDateFormat("mm/dd/yyyy").parse(dateofApp).before(new Date())) {
		    		System.out.println(new Date());
					model.addAttribute("error", "Date must be future date try again");
					model.addAttribute("attribs", geevsService.getUserByEmailId(email));
				    model.addAttribute("email", email);
				    model.addAttribute("user", geevsService.getUserByEmailId(email).getFname());
				    
				}else*/
		    	try { 
		    		
		    		List<UserLogin> DateList = lookupDates(dateofApp);
		    		UserLogin userdetail= geevsService.getUserByEmailId(email);	    
		    		if(lookupDates(dateofApp).isEmpty()){          
		                model.addAttribute("availabe",  "Date "+dateofApp+ " Available");
		                model.addAttribute("dates", geevsService.getUserByEmailId(email));
	    		        model.addAttribute("looksuccess", "Lookup Success");
	    		        model.addAttribute("email", email);
	    		        model.addAttribute("user", userdetail.getFname());
	    		        model.addAttribute("attribs", geevsService.getUserByEmailId(email));
		               }
		    		else		    				
		    		    {
		    			model.addAttribute("user", userdetail.getFname());
	    		        model.addAttribute("role", userdetail.getRoles());
	    		        model.addAttribute("users", DateList);
	    		        model.addAttribute("email", email);
	    		        model.addAttribute("dates", geevsService.getUserByEmailId(email));
	    		        model.addAttribute("looksuccess", "Lookup Success");
	    		        model.addAttribute("attribs", geevsService.getUserByEmailId(email));
	    		       
		    		    }
		    		    
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "geevs";
		    }
		    
		    @SuppressWarnings("rawtypes")
			public List<UserLogin> lookupDates(String dateofApp) {
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);        	
		       	final String sql  = "SELECT m.dateofApp, m.timeofApp, m.status, m.emailAddress  FROM users m WHERE m.dateofApp like '%"+ dateofApp +"%'";
		       	@SuppressWarnings("unchecked")
		   		List<UserLogin> memberList = jdbcTemplate.query(sql, new BeanPropertyRowMapper( UserLogin.class ));						
		   		return memberList;
		   		 
			}
		    
		    public void saveApntDate(UserLogin userLogin,	String day,String time, String status, String email, String msg) {    	
		    	String UpdateSql = "UPDATE users SET dateofApp=?,  timeofApp=?, status=?, msg=? where emailAddress=? ";    	
		  	     JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
				  	  jdbcTemplate.update(
				  			UpdateSql,
				  			new Object[] { 		   
				  					    userLogin.getDateofApp(),
				  					    userLogin.getTimeofApp(),
				  					    userLogin.getStatus(),
				  					    userLogin.getMsg(),
				  					    userLogin.getEmailAddress()
				  						});  
				  	
				  	
		  	  }
		    
		    @SuppressWarnings("rawtypes")
			public List<UserLogin> lookupMembers(String name) {
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);        	
		       	final String sql  = "SELECT m.* FROM users m WHERE m.lname like '%"+ name +"%'";
		       	@SuppressWarnings("unchecked")
		   		List<UserLogin> memberList = jdbcTemplate.query(sql, new BeanPropertyRowMapper( UserLogin.class ));						
		   		return memberList;
		   		 
			}
		    
		    

		    
		    
		    
}


