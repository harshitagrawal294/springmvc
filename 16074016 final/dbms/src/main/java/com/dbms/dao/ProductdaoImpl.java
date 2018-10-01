package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.Product;
import com.dbms.model.Supplier;

public class ProductdaoImpl implements Productdao{

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Product> showallproducts() {
		String sql="select * from PRODUCTS";
		List<Product> allproducts= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
		return allproducts;
	}

	@Override
	public List<Product> showallproductsbycategory(int categoryid) {
		String sql = "select * from PRODUCTS where availablequantity>0 and categoryid="+Integer.toString(categoryid);
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Product>>() {

			@Override
			public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
				
				List<Product> products = new ArrayList<Product>();
				if(!rs.isBeforeFirst()) return products;
				
				while(rs.next()) {
					Product product = new Product();
					int productid=rs.getInt("productid");
					product.setProductid(productid);
					product.setProductname(rs.getString("productname"));
					product.setProductprice(rs.getDouble("productprice"));
					product.setCategoryid(rs.getInt("categoryid"));
					product.setAvailablequantity(rs.getInt("availablequantity"));
					product.setDescription(rs.getString("description"));
					product.setProductlikes(getproductlikes(productid));
					products.add(product);
				}
				return products;
			}
			
		});
	}
	@Override
	public List<Product> showallproductsbycategoryall(int categoryid) {
		String sql = "select * from PRODUCTS where categoryid="+Integer.toString(categoryid);
		List<Product> categoryproducts= jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
		return categoryproducts;
	}

	@Override
	public Product getproductbyid(int productid) {
		String sql = "select * from PRODUCTS where productid="+Integer.toString(productid);
		return jdbcTemplate.query(sql,new ResultSetExtractor<Product>() {
			
			public Product extractData(ResultSet rs) throws SQLException,DataAccessException{
				if(rs.next()) {
					Product product = new Product();
					product.setProductid(rs.getInt("productid"));
					product.setProductname(rs.getString("productname"));
					product.setProductprice(rs.getDouble("productprice"));
					product.setCategoryid(rs.getInt("categoryid"));
					product.setAvailablequantity(rs.getInt("availablequantity"));
					product.setDescription(rs.getString("description"));
					return product;
				}
				return null;
			}
			
		});
	}

	@Override
	public void addnewproduct(Product product) {

		String sql = "insert into PRODUCTS(productname,productprice,categoryid,availablequantity,description) values(?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {product.getProductname(), product.getProductprice(), product.getCategoryid(), product.getAvailablequantity(), product.getDescription()});

	}

	@Override
	public boolean checkproductexists(Product product) {
		String sql = "select count(*) from PRODUCTS where productid=?";
		int count = jdbcTemplate.queryForObject(sql, new Object [] {product.getProductid()}, Integer.class);
		if(count>0) return true;
		return false;
	}
	@Override
	public boolean checkproductnameexists(Product product) {
		String sql = "select count(*) from PRODUCTS where productname=?";
		int count = jdbcTemplate.queryForObject(sql, new Object [] {product.getProductname()}, Integer.class);
		if(count>0) return true;
		return false;
	}

	@Override
	public List<Product> getCategoryProductsbySearch(int categoryid, String searchTerm) {
		String searchterm = searchTerm.toLowerCase();
		String sql = "select * from PRODUCTS where categoryid=? and productname like '%"+searchterm+"%'";
		return jdbcTemplate.query(sql, new Object[] {categoryid}, new ResultSetExtractor<List<Product>>() {

			@Override
			public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
				
				List<Product> products = new ArrayList<Product>();
				if(!rs.isBeforeFirst()) return products;
				
				while(rs.next()) {
					Product product = new Product();
					int productid=rs.getInt("productid");
					product.setProductid(productid);
					product.setProductname(rs.getString("productname"));
					product.setProductprice(rs.getDouble("productprice"));
					product.setCategoryid(rs.getInt("categoryid"));
					product.setAvailablequantity(rs.getInt("availablequantity"));
					product.setDescription(rs.getString("description"));
					product.setProductlikes(getproductlikes(productid));
					products.add(product);
				}
				return products;
			}
			
		});
	}

	@Override
	public List<Supplier> getSuppliersbyProductID(int productid) {
		String sql = "select * from SUPPLIERS, SUPPLIERPRODUCTS where SUPPLIERS.supplierid = SUPPLIERPRODUCTS.supplierid and productid="+Integer.toString(productid);
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Supplier>>() {

			@Override
			public List<Supplier> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<Supplier> suppliers = new ArrayList<Supplier>();
				if(!rs.isBeforeFirst()) return suppliers;
				
				while(rs.next()) {
					Supplier supplier = new Supplier();
					supplier.setSupplierid(rs.getInt("supplierid"));
					supplier.setSuppliername(rs.getString("suppliername"));
					supplier.setSupplierphone(rs.getString("supplierphone"));
					supplier.setSupplieraddress(rs.getString("supplieraddress"));
					suppliers.add(supplier);
				}
				return suppliers;
			}
			
		});
	}

	@Override
	public void updateproductquantity(int productid, int quantity) {
		String sql = "update PRODUCTS set availablequantity = availablequantity+? where productid=?";
		jdbcTemplate.update(sql, new Object[] {quantity, productid});
		
	}

	@Override
	public int getproductlikes(int productid) {
		String sql = "select count(*) from LIKES where productid="+Integer.toString(productid);
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		if(count==0) return 0;
		return count;
	}

	@Override
	public boolean isalreadyliked(String username, int productid) {
		String sql = "select count(*) from LIKES where username=? and productid=?";
		int count = jdbcTemplate.queryForObject(sql, new Object[] {username, productid}, Integer.class);
		if(count>0) return true;
		return false;
	}

	@Override
	public List<Product> gettopproducts() {
		String sql="select * from PRODUCTS natural join (select productid from LIKES group by productid order by count(productid) desc limit 3) as p";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Product>>() {

			@Override
			public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<Product> products = new ArrayList<Product>();
				if(!rs.isBeforeFirst()) return products;
				while(rs.next()) {
					Product product = new Product();
					int productid=rs.getInt("productid");
					product.setProductid(productid);
					product.setProductname(rs.getString("productname"));
					product.setProductprice(rs.getDouble("productprice"));
					product.setCategoryid(rs.getInt("categoryid"));
					product.setAvailablequantity(rs.getInt("availablequantity"));
					product.setDescription(rs.getString("description"));
					product.setProductlikes(getproductlikes(productid));
					products.add(product);
				}
				return products;
			}
			
		});
	}

}
