package com.dbms.dao;

import java.util.List;


import com.dbms.model.Employee;
import com.dbms.model.Order;

public interface Employeedao {

	public List<Employee> getallemployees();
	public void assignOrdertoEmployee(int orderid, int employeeid);
	public Employee getEmployeebyOrderid(int orderid);
	public void addEmployee(Employee employee);
	public void removeEmployee(Employee employee);
	public Employee getEmployeebyname(String name);
	public Employee getEmployeebyid(int employeeid);
	public void completeOrder(int orderid);
	public List<Order> getOrdersbyEmployeeid(int employeeid);
	public List<Order> getFilteredOrdersbyEmployeeid(int employeeid, String status);
	public int getCountOrdersbyEmployeeid(int employeeid);
}
