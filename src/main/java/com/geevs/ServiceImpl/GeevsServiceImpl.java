package com.geevs.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geevs.Dao.GeevsDao;
import com.geevs.model.UserLogin;
import com.geevs.service.GeevsService;


@Service
@Transactional
public class GeevsServiceImpl implements GeevsService {

	@Autowired
	GeevsDao geevsDao;
	
	@Override
	public boolean findUser(String email) {
		return geevsDao.findUser(email);
	}

	@Override
	public long createUser(UserLogin userLogin) {
		return geevsDao.createUser(userLogin);
	}

	@Override
	public UserLogin updateUser(UserLogin userLogin) {
		return geevsDao.updateUser(userLogin);
	}

	@Override
	public void deleteUserById(long id) {
		geevsDao.deleteUserById(id);
		
	}

	@Override
	public List<UserLogin> getAllusers() {
		return geevsDao.getAllusers();
	}

	@Override
	public UserLogin getUserByEmailId(String email) {
		return geevsDao.getUserByEmailId(email);
	}

	@Override
	public UserLogin getUserById(long id) {
		return geevsDao.getUserById(id);
	}

	@Override
	public void updaterole(UserLogin userLogin, String role, long id) {
		geevsDao.updaterole(userLogin, role, id);
		
	}

	
	@Override
	public void passReset(UserLogin userLogin, String pass, String email) {
		geevsDao.passReset(userLogin, pass, email);
		
	}

	@Override
	public List<UserLogin> lookupMembers(String name) {		
		return geevsDao.lookupMembers(name);
	}

	@Override
	public void updateUserById(UserLogin userLogin, long id) {
		geevsDao.updateUserById(userLogin, id);
		
	}

	@Override
	public List<UserLogin> getUserByName(String user) {
		return geevsDao.getUserByName(user);
	}

	@Override
	public List<UserLogin> lookupCity(String cityOrZip) {		
		return geevsDao.lookupCity(cityOrZip);
	}

}
