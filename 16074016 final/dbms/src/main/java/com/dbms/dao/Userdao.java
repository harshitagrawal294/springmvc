package com.dbms.dao;



import org.springframework.beans.factory.annotation.Autowired;

import com.dbms.model.Product;
import com.dbms.model.User;
import java.util.List;

public interface Userdao{
	@Autowired
	public void saveOrUpdate(User user, String role);
	public void delete(String username);
	public User getUserbyusername(String username);
	public User getCustomerbyusername(String username);
	public void saveOrUpdateCustomer(User user);
	public List<User> showallusers();
	public void updatedetails(User user);
	public void likeproduct(String username, int productid);
	public void dislikeproduct(String username, int productid);
	public List<Product> getfavorites(String username);
}