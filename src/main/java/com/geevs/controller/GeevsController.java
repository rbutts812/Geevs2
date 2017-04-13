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
import com.geevs.service.SendMail;
import com.geevs.service.GeevsService;


@Controller
@RequestMapping("/")
public class GeevsController {
	
		    public GeevsController() {
				System.out.println("in GeevsController servelet");
			}
		    
		     @Autowired
			private GeevsService geevsService; 
		     
		     @Autowired
			    DataSource dataSource;
		    
		   
		    SendMail sendMail =new SendMail();
		    
	       
		    @RequestMapping(value = "/logins", method = RequestMethod.GET)
		    public String login(Model model) {
		    	model.addAttribute("loginUser", new UserLogin());
		    	model.addAttribute("msg", "Please enter email address and password below.");
		        return "login";
		    }
		    
		    @RequestMapping(value = "/loginUser", method = RequestMethod.POST)
		    public String login(@ModelAttribute("loginUser") UserLogin user, ModelMap model) throws ParseException{	    	
		    	
		    	try {
		    		
		    		UserLogin userdetail= geevsService.getUserByEmailId(user.getEmailAddress());
		    		 if(geevsService.findUser(user.getEmailAddress())== true){
		    			 if(userdetail.getEmailAddress().equals(user.getEmailAddress()) && userdetail.getPassword().equals(user.getPassword()) ){
				    			if(userdetail.getRoles().equalsIgnoreCase("admin") || userdetail.getRoles().equalsIgnoreCase("super")){
				    				model.addAttribute("success", "Welcome "+ userdetail.getFname()+"! ");
				    				model.addAttribute("users", geevsService.getAllusers());
				    				model.addAttribute("role", "You are an admin with  "+userdetail.getRoles()+" role");
				    				model.addAttribute("user", userdetail.getFname());
				    				return "admin";
				    			}else{		    			
				    		        model.addAttribute("success", "Welcome "+ userdetail.getFname()+" This is a secure zone! ");		    		        
				    		        model.addAttribute("attribs", userdetail);
				    		        model.addAttribute("user", userdetail.getFname());
				    		        
				    		        model.addAttribute("email", "This is your email address " +userdetail.getEmailAddress());
				    		        
				    		        
				    		        
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
		    	
		    	return "logins";
		    }
		    
		    @RequestMapping("LookupMembers")
		    public String searchMembers(ModelMap model, @RequestParam("LookupMembers") String names, @RequestParam(value="id",required=false) long id){    	
		    	
		    	try {
		    		long membersId=id;
		    		List<UserLogin> memberList = geevsService.getUserByName(names);
		    		if(geevsService.getUserByName(names).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		               }
		    		else		    				
		    		   // model.addAttribute("users", geevsService.lookupMembers(names));
		    		    model.addAttribute("users", memberList);
		    		   
		    		    model.addAttribute("user", geevsService.getUserById(membersId));
		    		    
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "members";
		    }
		    
		    @RequestMapping("Lookupcity")
		    public String searchCity(ModelMap model, @RequestParam("Lookupcity") String cityorZip){    	
		    	
		    	try { 
		    		//List<UserLogin> memberList = geevsService.getUserByName(cityorZip);
		    		if(lookupCity(cityorZip).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		               }
		    		else		    				
		    		   // model.addAttribute("users", geevsService.lookupMembers(names));
		    		    model.addAttribute("users", lookupCity(cityorZip));
		    		   
		    		    
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();					    
				  }
		    		
		    	return "index";
		    }
		    
		    
		    
			@SuppressWarnings("rawtypes")
			public List<UserLogin> lookupCity(String cityOrZip) {
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource); 
				
		       	final String sql  = "SELECT m.* FROM users m WHERE m.city like '%"+ cityOrZip +"%'"
		       			+ " UNION "
		       			+ "SELECT m.* FROM users m WHERE m.zip like '%"+ cityOrZip +"%'";
		       	@SuppressWarnings("unchecked")
		   		List<UserLogin> memberList = jdbcTemplate.query(sql, new BeanPropertyRowMapper( UserLogin.class ));						
		   		return memberList;
		   		 
			}
   
			@RequestMapping(value = "/about", method = RequestMethod.GET)
		    public String about(Model model) {
		    	
		        return "about";
		    }
		    
		    
		    @RequestMapping(value = "/contact", method = RequestMethod.GET)
		    public String contact(Model model) {
		    	model.addAttribute("sendEmail", new UserLogin());
		    	model.addAttribute("message", "Welcome to Geev's for SweetArt, please drop us an email with any suggestions or concerns. We appreciate your feedback!"); 
		    	
		        return "contact";
		    }
		    
		    
		    
		    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
		    public String sendMail(@ModelAttribute("sendEmail") Geevs geevs, BindingResult bindingResult, Model model) { 
		    	          
		    	          String validemails = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"; 
		    	          model.addAttribute("em", geevs.getEmailAddress());
		       	          model.addAttribute("sb", geevs.getSubject());              
		                  String message="Subject: " +geevs.getSubject()+"\nMessage: " + geevs.getMsg();
		          
		                  if(!geevs.getEmailAddress().matches(validemails)) {
		                	  model.addAttribute("emailrror", "Invalid email "+ geevs.getEmailAddress()+ " use format johnsmith@scglobal.com ");		                  
		   	               }
		                  
		                  if(geevs.getSubject().isEmpty()) {
		                	  model.addAttribute("sbjrror", "Please enter Emain Subject");		                   
		   		           }  
		                  
		                  if(geevs.getMsg().length() <= 1 || geevs.getMsg().length() > 3000) {
		                	  model.addAttribute("msgerror", "Must be between 10 and 300 characters");		                   
		   		           }
		                  
		                  else
				       
				             try {     
				            	   sendMail.sendMails(geevs.getEmailAddress() , geevs.getSubject(), message.toString());					          
				                   model.addAttribute("Success", "Thank you email has been sent to "+ geevs.getEmailAddress());
				                   model.addAttribute("emailrror", "");  
				                   model.addAttribute("sbjrror", "");		                   
				       	           model.addAttribute("msgerror", "");
				       	           model.addAttribute("em", "");
				       	           model.addAttribute("sb", "");   
				       	           
						        }catch(Exception e) {
						                 model.addAttribute("sendmailfail", "Error sending email  " );
						                 e.printStackTrace();
						        }
						
						return "contact";
				    }
		    
		    
		    
		    /*@SuppressWarnings("rawtypes")
			public List<UserLogin> lookupMembers(String name) {
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);        	
		       	final String sql  = "SELECT m.* FROM users m WHERE m.lname like '%"+ name +"%'";
		       	@SuppressWarnings("unchecked")
		   		List<UserLogin> memberList = jdbcTemplate.query(sql, new BeanPropertyRowMapper( UserLogin.class ));						
		   		return memberList;
		   		 
			}*/
		    
		    
		
}


