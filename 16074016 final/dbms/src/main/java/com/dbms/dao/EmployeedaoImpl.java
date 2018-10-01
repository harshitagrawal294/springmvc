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
import org.springframework.transaction.annotation.Transactional;

import com.dbms.model.Employee;
import com.dbms.model.Order;

public class EmployeedaoImpl implements Employeedao{

	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
    
	
	@Override
	public List<Employee> getallemployees() {
		String sql = "select * from EMPLOYEES";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Employee>(Employee.class));
	}


	@Override
	public void assignOrdertoEmployee(int orderid, int employeeid) {
		String sql = "update USERORDERS set status='Assigned', employeeid=? where orderid=?";
		jdbcTemplate.update(sql, new Object[] {employeeid, orderid});
		
	}


	@Override
	public Employee getEmployeebyOrderid(int orderid) {
		String sql = "select * from EMPLOYEES where employeeid in (select employeeid from USERORDERS where orderid="+Integer.toString(orderid)+")";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Employee>() {

			@Override
			public Employee extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()) {
					Employee employee = new Employee();
					employee.setEmployeeid(rs.getInt("employeeid"));
					employee.setEmployeename(rs.getString("employeename"));
					employee.setEmployeephone(rs.getString("employeephone"));
					employee.setEmployeesalary(rs.getString("employeesalary"));
					employee.setEmployeepassword(rs.getString("employeepassword"));
					return employee;
				}
				return null;
			}
			
		});
		
	}


	@Override
	public void addEmployee(Employee employee) {
		String sql="insert into EMPLOYEES(employeename, employeephone, employeesalary, employeepassword) values(?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {employee.getEmployeename(), employee.getEmployeephone(), employee.getEmployeesalary(), employee.getEmployeepassword()});
		
	}


	@Override
	public Employee getEmployeebyname(String name) {
		String sql = "select * from EMPLOYEES where employeename='"+name+"'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Employee>() {

			@Override
			public Employee extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()) {
					Employee employee = new Employee();
					employee.setEmployeeid(rs.getInt("employeeid"));
					employee.setEmployeename(rs.getString("employeename"));
					employee.setEmployeephone(rs.getString("employeephone"));
					employee.setEmployeesalary(rs.getString("employeesalary"));
					employee.setEmployeepassword(rs.getString("employeepassword"));
					return employee;
				}
				return null;
			}
			
		});
		
	}

	@Override
	public List<Order> getOrdersbyEmployeeid(int employeeid) {
		String sql = "select * from USERORDERS where employeeid="+Integer.toString(employeeid);
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Order>>() {

			@Override
			public List<Order> extractData(ResultSet rs) throws SQLException, DataAccessException {
				//if(rs.isBeforeFirst()) return null;
				List<Order> employeeorders = new ArrayList<Order>();
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
					employeeorders.add(order);
				}
				return employeeorders;
			}
			
		});
	}
	@Override
	public List<Order> getFilteredOrdersbyEmployeeid(int employeeid, String status) {
		String sql = "select * from USERORDERS where employeeid=? and status=?";
		return jdbcTemplate.query(sql, new Object[] {employeeid, status}, new ResultSetExtractor<List<Order>>() {

			@Override
			public List<Order> extractData(ResultSet rs) throws SQLException, DataAccessException {
				//if(rs.isBeforeFirst()) return null;
				List<Order> employeeorders = new ArrayList<Order>();
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
					employeeorders.add(order);
				}
				return employeeorders;
			}
			
		});
	}


	@Override
	public void completeOrder(int orderid) {
		String sql = "update USERORDERS set status='Completed', employeeid=NULL where orderid=?";
		jdbcTemplate.update(sql, new Object[] {orderid});
	}


	@Override
	public void removeEmployee(Employee employee) {
		String sql = "delete from EMPLOYEES where employeeid=?";
		jdbcTemplate.update(sql, employee.getEmployeeid());
	}


	@Override
	public int getCountOrdersbyEmployeeid(int employeeid) {
		String sql = "select count(*) from USERORDERS where status='Assigned' and employeeid="+Integer.toString(employeeid);
		int ordercount = jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class);
		if(ordercount==0) return 0;
		return ordercount;
	}


	@Override
	public Employee getEmployeebyid(int employeeid) {
		String sql = "select * from EMPLOYEES where employeeid="+Integer.toString(employeeid);
		return jdbcTemplate.query(sql, new ResultSetExtractor<Employee>() {

			@Override
			public Employee extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()) {
					Employee employee = new Employee();
					employee.setEmployeeid(rs.getInt("employeeid"));
					employee.setEmployeename(rs.getString("employeename"));
					employee.setEmployeephone(rs.getString("employeephone"));
					employee.setEmployeesalary(rs.getString("employeesalary"));
					employee.setEmployeepassword(rs.getString("employeepassword"));
					return employee;
				}
				return null;
			}
			
		});
	}

}

