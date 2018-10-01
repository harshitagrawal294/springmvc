package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*; 

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.transaction.annotation.Transactional;

import com.dbms.model.Cart;
import com.dbms.model.CartItem;
import com.dbms.model.Order;
import com.dbms.model.Product;

@Transactional
public class OrderdaoImpl implements Orderdao{

	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	Cartdao cartdao;
	@Autowired
	Productdao productdao;
	@Autowired
	Employeedao employeedao;
	@Override
	public void placeorder(Order order) {
		
		Cart cart = order.getCart();
		Double amount = cartdao.getamount(cart);
		List<CartItem> cartitems = cart.getCartitems();
		
		String sql;
		Date dt = new Date();
		SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdfd.format(dt);
		SimpleDateFormat sdft = new SimpleDateFormat("HH:mm:ss");
		String currentTime = sdft.format(dt);
		
		
		sql = "insert into USERORDERS values (?,?,?,?,?,?,1,?)";
		jdbcTemplate.update(sql,new Object[] {order.getOrderid(), order.getUsername(), amount, "Pending", currentDate, currentTime, order.getDeliveryaddress()});
		

		for(CartItem cartitem:cartitems) {
			sql = "insert into ORDERPRODUCTS values(?,?,?)";
			jdbcTemplate.update(sql,new Object[] {order.getOrderid(), cartitem.getProduct().getProductid(), cartitem.getQuantity()});
		}
	}
	@Override
	public int getordercount() {
		String sql = "select count(*) from USERORDERS";
		int ordercount = jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class);
		return ordercount;
	}
	
	@Override
	public int getmaxorderid() {
		String sql = "select max(orderid) from USERORDERS";
		int orderid = jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class);
		return orderid+1;
	}
	
	@Override
	public List<Order> getOrdersbyusername(String username) { 
		String sql = "select * from USERORDERS where username='"+username+"' order by orderid desc";
		return jdbcTemplate.query(sql,new ResultSetExtractor<List<Order>>() {	
		
		public List<Order> extractData(ResultSet rs) throws SQLException,DataAccessException{
			List<Order> myorders = new ArrayList<Order>();
			while(rs.next()) {
				Order order = new Order();
				order.setUsername(username);
				order.setOrderid(rs.getInt("orderid"));
				order.setOrderdate(rs.getDate("orderdate"));
				order.setOrdertime(rs.getTime("ordertime"));
				order.setStatus(rs.getString("status"));
				order.setAmount(rs.getDouble("amount"));
				order.setEmployeeid(rs.getInt("employeeid"));
				order.setDeliveryaddress(rs.getString("deliveryaddress"));
				
				//Cart cart = getCartbyorderid(rs.getInt("orderid"), username);
				//order.setCart(cart);
				myorders.add(order);
			}
			 return myorders;
		}
	});
	}
	@Override
	public Cart getCartbyorderid(int orderid, String username) {
		String sql = "select * from ORDERPRODUCTS where orderid="+Integer.toString(orderid);
		return jdbcTemplate.query(sql,new ResultSetExtractor<Cart>() {	
		
		public Cart extractData(ResultSet rs) throws SQLException,DataAccessException{
			Cart cart = new Cart();
			List<CartItem> cartitems = new ArrayList<CartItem>();
			while(rs.next()) {
				int productid = rs.getInt("productid");
				Product product = productdao.getproductbyid(productid);
				CartItem cartitem = new CartItem();
				cartitem.setProduct(product);
				cartitem.setQuantity(rs.getInt("orderquantity"));
				cartitems.add(cartitem);
			}
			cart.setCartitems(cartitems);
			cart.setUsername(username);
			return cart;
		}
	});
	}
	@Override
	public void cancelorder(int orderid) {
		String sql = "update USERORDERS set status='Cancelled' where orderid=?";
		jdbcTemplate.update(sql,orderid);
	}
	@Override
	public Order getOrderbyorderid(int orderid) {
		String sql = "select * from USERORDERS where orderid="+Integer.toString(orderid);
		return jdbcTemplate.query(sql, new ResultSetExtractor<Order>() {

			@Override
			public Order extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()) {
					Order order = new Order();
					order.setOrderid(orderid);
					order.setUsername(rs.getString("username"));
					order.setOrderdate(rs.getDate("orderdate"));
					order.setOrdertime(rs.getTime("ordertime"));
					order.setStatus(rs.getString("status"));
					order.setAmount(rs.getDouble("amount"));
					order.setEmployeeid(rs.getInt("employeeid"));
					order.setDeliveryaddress(rs.getString("deliveryaddress"));
					return order;
				}
				return null;
			}
			
		});
	}
	@Override
	public List<Order> getallorders() {
		String sql = "select * from USERORDERS left join (select employeeid,employeename from EMPLOYEES) as E on USERORDERS.employeeid=E.employeeid order by orderid desc";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Order>>() {

			@Override
			public List<Order> extractData(ResultSet rs) throws SQLException, DataAccessException {
				
				List<Order> allorders = new ArrayList<Order>();
				if(!rs.isBeforeFirst()) return allorders;
				while(rs.next()) {
					Order order = new Order();
					order.setOrderid(rs.getInt("orderid"));
					order.setUsername(rs.getString("username"));
					order.setOrderdate(rs.getDate("orderdate"));
					order.setOrdertime(rs.getTime("ordertime"));
					order.setStatus(rs.getString("status"));
					order.setAmount(rs.getDouble("amount"));
					order.setDeliveryaddress(rs.getString("deliveryaddress"));
					
					order.setEmployeeid(rs.getInt("employeeid"));
					order.setEmployeename(rs.getString("employeename"));
					
					allorders.add(order);
				}
				return allorders;
			}
			
		});
	}
	
	
	@Override
	public List<Order> getallordersFiltered(String status) {
		String sql = "select * from USERORDERS left join (select employeeid,employeename from EMPLOYEES) as E on USERORDERS.employeeid=E.employeeid where status=? order by orderid desc";
		return jdbcTemplate.query(sql, new Object[] {status}, new ResultSetExtractor<List<Order>>() {

			@Override
			public List<Order> extractData(ResultSet rs) throws SQLException, DataAccessException {
				
				List<Order> allorders = new ArrayList<Order>();
				if(!rs.isBeforeFirst()) return allorders;
				while(rs.next()) {
					Order order = new Order();
					order.setOrderid(rs.getInt("orderid"));
					order.setUsername(rs.getString("username"));
					order.setOrderdate(rs.getDate("orderdate"));
					order.setOrdertime(rs.getTime("ordertime"));
					order.setStatus(rs.getString("status"));
					order.setAmount(rs.getDouble("amount"));
					order.setEmployeeid(rs.getInt("employeeid"));
					order.setEmployeename(rs.getString("employeename"));
					order.setDeliveryaddress(rs.getString("deliveryaddress"));
					allorders.add(order);
				}
				return allorders;
			}
			
		});
	}
	@Override
	public List<Order> getallordersFilteredbyusername(String username, String status) {
		String sql = "select * from USERORDERS where username=? and status=? order by orderid desc";
		return jdbcTemplate.query(sql, new Object[] {username,status} , new ResultSetExtractor<List<Order>>() {

			@Override
			public List<Order> extractData(ResultSet rs) throws SQLException, DataAccessException {
				
				List<Order> allorders = new ArrayList<Order>();
				if(!rs.isBeforeFirst()) return allorders;
				while(rs.next()) {
					Order order = new Order();
					order.setOrderid(rs.getInt("orderid"));
					order.setUsername(rs.getString("username"));
					order.setOrderdate(rs.getDate("orderdate"));
					order.setOrdertime(rs.getTime("ordertime"));
					order.setStatus(rs.getString("status"));
					order.setAmount(rs.getDouble("amount"));
					order.setEmployeeid(rs.getInt("employeeid"));
					order.setDeliveryaddress(rs.getString("deliveryaddress"));
					allorders.add(order);
				}
				return allorders;
			}
			
		});
	}
	@Override
	public List<Order> getOrdersbyemployeeid(int employeeid) {
		String sql = "select * from USERORDERS where employeeid=? order by orderid desc";
		return jdbcTemplate.query(sql, new Object[] {employeeid}, new ResultSetExtractor<List<Order>>() {

			@Override
			public List<Order> extractData(ResultSet rs) throws SQLException, DataAccessException {
				
				List<Order> allorders = new ArrayList<Order>();
				if(!rs.isBeforeFirst()) return allorders;
				while(rs.next()) {
					Order order = new Order();
					order.setOrderid(rs.getInt("orderid"));
					order.setUsername(rs.getString("username"));
					order.setOrderdate(rs.getDate("orderdate"));
					order.setOrdertime(rs.getTime("ordertime"));
					order.setStatus(rs.getString("status"));
					order.setAmount(rs.getDouble("amount"));
					order.setEmployeeid(rs.getInt("employeeid"));
					order.setDeliveryaddress(rs.getString("deliveryaddress"));
					//order.setEmployeename(employeedao.getEmployeebyid(employeeid).getEmployeename());
					allorders.add(order);
				}
				return allorders;
			}
			
		});
	}

}
