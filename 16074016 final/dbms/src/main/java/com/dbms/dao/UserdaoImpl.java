package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.dbms.model.Product;
import com.dbms.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.transaction.annotation.Transactional;
@Transactional
public class UserdaoImpl implements Userdao{
	
	@Autowired
	DataSource datasource;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	Productdao productdao;
	
	public UserdaoImpl() {
		
	}
	public UserdaoImpl(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public void saveOrUpdate(User user, String role) {
		 String sql = "INSERT INTO USERS(username, password) VALUES (?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getUsername(),user.getPassword()});
		 sql = "INSERT INTO USERS_ROLES(user,role) VALUES(?,?)";
		 jdbcTemplate.update(sql,new Object[] {user.getUsername(),role});
		 
	}
	@Transactional
	public void delete(String username) {
		String sql = "DELETE FROM USERS WHERE username=?";
		jdbcTemplate.update(sql,username);
		sql = "DELETE FROM USERS_ROLES WHERE user=?";
		jdbcTemplate.update(sql,username);
	}
	public User getUserbyusername(String username) {
		String sql = "SELECT * FROM USERS WHERE username='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<User>() {
		
		public User extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				String password = rs.getString("password");
				user.setPassword(password);
				user.setMpassword(password);
				return user;
			}
			return null;
		}
		
	});
		
	}
	public void saveOrUpdateCustomer(User user) {
		String sql="INSERT INTO CUSTOMERS VALUES(?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {user.getUsername(),user.getName(),user.getAddress(),user.getPin(),user.getCity(),user.getPhone(),user.getMail()});
		saveOrUpdate(user, "ROLE_USER");
	}
	
	public User getCustomerbyusername(String username) {
		String sql = "SELECT * FROM CUSTOMERS WHERE username='"+username+"'";
		return jdbcTemplate.query(sql,new ResultSetExtractor<User>() {
		
	public User extractData(ResultSet rs) throws SQLException,DataAccessException{
		if(rs.next()) {
			User user = new User();
			user.setUsername(rs.getString("username"));
			user.setName(rs.getString("name"));
			user.setAddress(rs.getString("address"));
			user.setPin(rs.getLong("pin"));
			user.setCity(rs.getString("city"));
			user.setPhone(rs.getString("phone"));
			user.setMail(rs.getString("mail"));
			return user;
		}
		return null;
	}
	});
	}
	@Override
	  public List<User> showallusers() {
	    String sql = "select * from USERS";
	    List<User> allusers = jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
	    return allusers;
	 }
	@Override
	public void updatedetails(User user) {
		String sql = "update CUSTOMERS set name=?, address=?, city=?, mail=?, phone=? where username=?";
		jdbcTemplate.update(sql, new Object[] {user.getName(), user.getAddress(), user.getCity(), user.getMail(), user.getPhone(), user.getUsername()});
		
	}
	@Override
	public void likeproduct(String username, int productid) {
		String sql = "insert into LIKES values(?,?)";
		jdbcTemplate.update(sql, new Object[] {username, productid});
	}
	
	@Override
	public void dislikeproduct(String username, int productid) {
		String sql = "delete from LIKES where username=? and productid=?";
		jdbcTemplate.update(sql, new Object[] {username, productid});
	}
	
	@Override
	public List<Product> getfavorites(String username) {
		String sql = "select * from LIKES natural join PRODUCTS where username=?";
		return jdbcTemplate.query(sql, new Object[] {username},  new ResultSetExtractor<List<Product>>() {

			@Override
			public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<Product> favorites = new ArrayList<>();
				if(!rs.isBeforeFirst()) return favorites;
				while(rs.next()) {
					Product product = new Product();
					int productid = rs.getInt("productid");
					product.setProductid(productid);
					product.setProductname(rs.getString("productname"));
					product.setProductprice(rs.getDouble("productprice"));
					product.setCategoryid(rs.getInt("categoryid"));
					product.setAvailablequantity(rs.getInt("availablequantity"));
					product.setDescription(rs.getString("description"));
					product.setProductlikes(productdao.getproductlikes(productid));
					favorites.add(product);
				}
				return favorites;
			}
			
		});
	}
}