package com.dbms.dao;

import java.util.List;

import com.dbms.model.Cart;
import com.dbms.model.Order;

public interface Orderdao {

	public int getordercount();
	public int getmaxorderid();
	public void placeorder(Order order);
	public List<Order> getOrdersbyusername(String username);
	public Cart getCartbyorderid(int orderid, String username);
	public void cancelorder(int orderid);
	public Order getOrderbyorderid(int orderid);
	public List<Order> getallorders();
	//public List<Order> getallordersuser();
	public List<Order> getallordersFiltered(String status);
	public List<Order> getallordersFilteredbyusername(String username, String status);
	public List<Order> getOrdersbyemployeeid(int employeeid);
	
}
