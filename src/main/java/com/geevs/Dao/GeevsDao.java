package com.geevs.Dao;

import java.util.List;

import com.geevs.model.UserLogin;

public interface GeevsDao {
	    //users
		public boolean findUser(String email);
		public long createUser(UserLogin userLogin);
		public UserLogin updateUser(UserLogin userLogin);	
		public void deleteUserById(long id);
	    public List<UserLogin> getAllusers();
	    public UserLogin getUserByEmailId(String email);
	    public UserLogin getUserById(long id);
	    public void updaterole(UserLogin userLogin, String role, long id);	    
	    public void passReset(UserLogin userLogin, String pass, String email);  
	   
	    public List<UserLogin> lookupMembers(String name);
	    public void updateUserById(UserLogin userLogin, long id);
		public List<UserLogin> getUserByName(String user);
		public List<UserLogin> lookupCity(String cityOrZip);
		
}
