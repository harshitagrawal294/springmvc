package com.dbms.dao;

import java.util.List;

import com.dbms.model.Product;
import com.dbms.model.Supplier;

public interface Productdao {
	
	public List<Product> showallproducts();
	public List<Product> showallproductsbycategory(int categoryid);
	public Product getproductbyid(int productid);
	public int getproductlikes(int productid);
	public void addnewproduct(Product product);
	public boolean checkproductexists(Product product);
	public boolean checkproductnameexists(Product product);
	public List<Supplier> getSuppliersbyProductID(int productid);
	public List<Product> getCategoryProductsbySearch(int categoryid, String searchTerm);
	public void updateproductquantity(int productid, int quantity);
	public List<Product> showallproductsbycategoryall(int categoryid);
	public boolean isalreadyliked(String username, int productid);
	public List<Product> gettopproducts();
}
