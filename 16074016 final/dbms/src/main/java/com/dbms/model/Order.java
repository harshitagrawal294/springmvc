package com.dbms.model;

import java.sql.Time;
import java.util.Date;

import com.dbms.model.Cart;

public class Order {

	private int orderid;
	private String username;
	private Cart cart;
	private Date orderdate;
	private String status;
	private Time ordertime;
	private double amount;
	private int employeeid;
	private String employeename;
	private String deliveryaddress;
	
	public String getDeliveryaddress() {
		return deliveryaddress;
	}

	public void setDeliveryaddress(String deliveryaddress) {
		this.deliveryaddress = deliveryaddress;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getEmployeename() {
		return employeename;
	}

	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}

	public int getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(int employeeid) {
		this.employeeid = employeeid;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	
	public String getUsername() {
		return username;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Time getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Time ordertime) {
		this.ordertime = ordertime;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
}
