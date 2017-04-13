package com.geevs.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class UserLogin implements Serializable {
	
	private static final long serialVersionUID = -7988799579036200037L;	
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
	private String roles;		     
    private String lname;
    private String fname;
    private int age;     
    private String address; 
    private String city;
    private String state;  
    private long zip;
    private long tel;
    private String dateofApp;
    private String timeofApp;
    private String status;
    @Column(updatable=false)
	private String emailAddress;
	private String password;
	private String msg;
    

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		//this.status = status;
		this.status = status != null ? status : "pending";
	}

	public String getDateofApp() {
		return dateofApp;
	}

	public void setDateofApp(String dateofApp) {
		this.dateofApp = dateofApp;
	}

	public String getTimeofApp() {
		return timeofApp;
	}

	public void setTimeofApp(String timeofApp) {
		this.timeofApp = timeofApp;
	}

	private String passwordConfirm;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public long getZip() {
		return zip;
	}

	public void setZip(long zip) {
		this.zip = zip;
	}

	public long getTel() {
		return tel;
	}

	public void setTel(long tel) {
		this.tel = tel;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	
	
	
}
