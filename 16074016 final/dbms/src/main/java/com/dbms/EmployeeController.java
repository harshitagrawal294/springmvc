package com.dbms;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.OrderComparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dbms.dao.Cartdao;
import com.dbms.dao.Employeedao;
import com.dbms.dao.Orderdao;
import com.dbms.model.Cart;
import com.dbms.model.Employee;
import com.dbms.model.Order;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
  
	@Autowired
	Employeedao employeedao;
	@Autowired
	Orderdao orderdao;
	@Autowired
	Cartdao cartdao;
	
	@RequestMapping(value = "")
	public ModelAndView employeedashboard(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("employeedashboard");
		return mav;
	}
  
	@RequestMapping(value = "/orders")
	public ModelAndView employeeorders(HttpServletRequest request, HttpServletResponse response, Principal principal) {
		ModelAndView mav = new ModelAndView("employeeorders");
		Employee employee = employeedao.getEmployeebyname(principal.getName());
		List<Order> employeeorders = employeedao.getFilteredOrdersbyEmployeeid(employee.getEmployeeid(), "Assigned");
		
//		Collections.sort(employeeorders,  Collections.reverseOrder(new OrderComparator()));
		
		mav.addObject("employeeorders", employeeorders);
		return mav;
	}
	
	@RequestMapping(value = "/orders/{status}")
	public ModelAndView employeeorders(HttpServletRequest request, HttpServletResponse response, Principal principal, @PathVariable(value="status") String status) {
		ModelAndView mav = new ModelAndView("employeeorders");
		Employee employee = employeedao.getEmployeebyname(principal.getName());
		List<Order> employeeorders = employeedao.getFilteredOrdersbyEmployeeid(employee.getEmployeeid(), status);
		
		//Collections.sort(employeeorders,  Collections.reverseOrder(new OrderComparator()));
		mav.addObject("employeeorders", employeeorders);
		return mav;
	}
	
	@RequestMapping(value="/vieworder", method=RequestMethod.POST)
	public ModelAndView vieworder(Principal principal, @RequestParam(value="orderid") int orderid) {

		ModelAndView model = new ModelAndView("vieworderemployee");
		Order order = orderdao.getOrderbyorderid(orderid);
		Employee employee = employeedao.getEmployeebyOrderid(orderid);
		
		Cart cart = orderdao.getCartbyorderid(orderid, order.getUsername());
		order.setCart(cart);
		order.setAmount(cartdao.getamount(cart));
		model.addObject("order", order);
		model.addObject("employee", employee);
	    return model;
	}
	@RequestMapping(value="/complete",method=RequestMethod.POST)
	public String completeorder(Model model, Principal principal, @RequestParam(value="orderid") int orderid) {
		
		//Employee employee = employeedao.getEmployeebyname(principal.getName());
		employeedao.completeOrder(orderid);
		return "redirect:/employee/orders";
	}
	@RequestMapping(value="/profile")
	public String viewprofile(Model model, Principal principal) {
		
		Employee employee = employeedao.getEmployeebyname(principal.getName());
		model.addAttribute("employee", employee);
		return "employeeprofile";
	}
}
