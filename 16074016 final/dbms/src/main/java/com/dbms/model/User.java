package com.dbms.model;

import java.util.List;

//import org.hibernate.validator.constraints.Email;
//import org.hibernate.validator.constraints.NotEmpty;

public class User{
	
	//@NotEmpty(message="required")
	private String username;
	//@NotEmpty(message="required")
	private String password;
	//@NotEmpty(message="required")
	private String mpassword;
	//@NotEmpty(message="required")
	private String name;
	
	//@NotEmpty(message="required")
	private Long pin;
	//@NotEmpty(message="required")
	private String city;
	
	//@NotEmpty(message="required")
	private String address;
	private String phone;
	
	private List<Product> likedproducts;
	
	public List<Product> getLikedproducts() {
		return likedproducts;
	}

	public void setLikedproducts(List<Product> likedproducts) {
		this.likedproducts = likedproducts;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	/*@NotEmpty(message="required")
	@Email(message="Invalid mail")*/
	private String mail;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getPin() {
		return pin;
	}

	public void setPin(Long pin) {
		this.pin = pin;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMpassword() {
		return mpassword;
	}

	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	
	
}