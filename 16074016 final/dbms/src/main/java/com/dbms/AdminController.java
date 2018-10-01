package com.dbms;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dbms.dao.Cartdao;
import com.dbms.dao.Categorydao;
import com.dbms.dao.Employeedao;
import com.dbms.dao.Feedbackdao;
import com.dbms.dao.Notificationdao;
import com.dbms.dao.Orderdao;
import com.dbms.dao.Productdao;
import com.dbms.dao.Supplierdao;
import com.dbms.dao.Userdao;
import com.dbms.model.Cart;
import com.dbms.model.Category;
import com.dbms.model.Employee;
import com.dbms.model.Feedback;
import com.dbms.model.Notification;
import com.dbms.model.Order;
import com.dbms.model.Product;
import com.dbms.model.Supplier;
import com.dbms.model.User;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	Categorydao categorydao;
	@Autowired
	Productdao productdao;
	@Autowired
	Userdao userdao;
	@Autowired
	Orderdao orderdao;
	@Autowired
	Employeedao employeedao;
	@Autowired
	Cartdao cartdao;
	@Autowired
	Notificationdao notificationdao;
	@Autowired
	Feedbackdao feedbackdao;
	@Autowired
	Supplierdao supplierdao;
	
	@RequestMapping("")
	public ModelAndView admin(Principal principal) {

		ModelAndView model = new ModelAndView("admin");
		String loggedInUserName = principal.getName();
		model.addObject("user", loggedInUserName);
		model.addObject("name", "Spring Security Custom Login Demo");
		model.addObject("description", "Protected page !");
		return model;
	}

	
	@RequestMapping(value = "/addproduct/{categoryid}", method = RequestMethod.GET)
	public String addproduct(Model model, HttpServletRequest request, HttpServletResponse response, @PathVariable(value="categoryid") int categoryid) {
	    
		String error = (String)model.asMap().get("error");
		//ModelAndView mav = new ModelAndView("addproduct");
	    Product product = new Product();
		model.addAttribute("product", product);
		model.addAttribute("categoryid", categoryid);
		model.addAttribute("error", error);
	    return "addproduct";
	  }
	
	@RequestMapping(value="/addproduct/{categoryid}",method=RequestMethod.POST)
	public String addproductProcess(Model model, @Valid @ModelAttribute("product") Product product, BindingResult result, RedirectAttributes redirectAttributes, @PathVariable(value="categoryid") int categoryid) {
			
		if(result.hasErrors()) {
			return "redirect:/admin/addproduct";
		}
		if(productdao.checkproductnameexists(product)) {
			redirectAttributes.addFlashAttribute("error", "Product already exists");
			model.addAttribute("error", "Product already exists");
			return "redirect:/admin/addproduct/"+Integer.toString(categoryid);
		}
		if(product.getAvailablequantity()<0) {
			redirectAttributes.addFlashAttribute("error", "Product quantity less than zero");
			model.addAttribute("error", "Product quantity less than zero");
			return "redirect:/admin/addproduct/"+Integer.toString(categoryid);
		}
		
		product.setCategoryid(categoryid);
		productdao.addnewproduct(product);
		return "redirect:/admin/allcategories/"+Integer.toString(categoryid);
		
	}
	
	@RequestMapping(value = "/allcategories")
	  public ModelAndView adminallcategories(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("adminallcategories");
	    
	    List<Category> allcategories = categorydao.showallcategories();
	    mav.addObject("allcategories", allcategories);
	
	    return mav;
	  }
	
	
	
	@RequestMapping(value = "/allcategories/{categoryid}", method=RequestMethod.GET)
	  public String categoryproducts(Model model, HttpServletRequest request, HttpServletResponse response, @PathVariable(value = "categoryid") int categoryid, Principal principal) {
	    //ModelAndView mav = new ModelAndView("admincategoryproducts");
	    
		String error = (String)model.asMap().get("error");
		
	    List<Product> categoryproducts = productdao.showallproductsbycategoryall(categoryid);
	    model.addAttribute("category",categorydao.getcategorybyid(categoryid));
	    model.addAttribute("admincategoryproducts",categoryproducts); 
	    model.addAttribute("error", error);
	    return "admincategoryproducts";
	  }
	
	
	@RequestMapping(value = "/allcategories/{categoryid}", method=RequestMethod.POST)
	  public String categoryproductsquantityprocess(@RequestParam(value="productid")int productid, @RequestParam(value="updatequantity")int updatequantity, HttpServletRequest request, HttpServletResponse response, @PathVariable(value = "categoryid") int categoryid, Principal principal) {
	    
		if(updatequantity<0) {
			return "redirect:/admin/allcategories/"+Integer.toString(categoryid);
		}
		productdao.updateproductquantity(productid, updatequantity);
		return "redirect:/admin/allcategories/"+Integer.toString(categoryid);
	  }
	
	
	  @RequestMapping(value="/searchproducts/{categoryid}", method=RequestMethod.POST)
	  public String SearchProducts(Model model, @PathVariable(value="categoryid") int categoryid, @RequestParam(value = "searchTerm", required = false) String SearchTerm, HttpServletRequest request, HttpServletResponse response) {
	     
//		  if(updatequantity<0) {
//			  return "redirect:/admin/searchproducts/{categoryid}";
//		  }
//		  
//		  productdao.updateproductquantity(productid, updatequantity);
//		  

	      model.addAttribute("searchTerm", SearchTerm);
	      model.addAttribute("searchResults", productdao.getCategoryProductsbySearch(categoryid, SearchTerm)); 

	      return "adminsearchcategoryproducts";
	  }
	  
	  @RequestMapping(value="/searchupdate/{categoryid}", method=RequestMethod.POST)
	  public String SearchProductsupdate(Model model, @PathVariable(value="categoryid") int categoryid, @RequestParam(value = "searchTerm", required = false) String SearchTerm, @RequestParam(value="updatequantity") int updatequantity, @RequestParam(value="productid")int productid, HttpServletRequest request, HttpServletResponse response) {
	     
		  if(updatequantity<0) {
			  return "redirect:/admin/searchproducts/{categoryid}";
		  }
		  
		  productdao.updateproductquantity(productid, updatequantity);
	      model.addAttribute("searchTerm", SearchTerm);
	      model.addAttribute("searchResults", productdao.getCategoryProductsbySearch(categoryid, SearchTerm)); 

	      return "adminsearchcategoryproducts";
	  }
	

	@RequestMapping(value = "/addnewcategory", method = RequestMethod.GET)
	public ModelAndView addnewcategory(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView("addnewcategory");
	    Category category = new Category();
		mav.addObject("category",category);
	    return mav;
	  }
	@RequestMapping(value="/addnewcategory",method=RequestMethod.POST)
	public String addnewcategoryProcess(Model model, @Valid @ModelAttribute("category") Category category, BindingResult result) {
			
		if(result.hasErrors()) {
			return "redirect:/admin/addnewcategory";
		}
		if(categorydao.checkcategoryexists(category)) {
			model.addAttribute("error", "Category already exists");
			return "redirect:/admin/addnewcategory";
		}
		categorydao.addcategory(category);
		model.addAttribute("success", "category added successfully");
		return "redirect:/admin/allcategories";
		
	}

	@RequestMapping("/manageusers")
	public ModelAndView manageusers(Principal principal) {

		ModelAndView model = new ModelAndView("manageusers");
		List<User> allusers = userdao.showallusers();
	    model.addObject("allusers", allusers);
	    
	    return model;
	}
	
	@RequestMapping("/allorders")
	public ModelAndView allorders(Principal principal) {

		ModelAndView model = new ModelAndView("allorders");
		List<Order> allorders  = orderdao.getallorders();
		List<Employee> employees = employeedao.getallemployees();
		model.addObject("employees", employees);
		model.addObject("allorders", allorders);
		return model;
	}
	
	@RequestMapping("/allorders/{status}")
	public ModelAndView allorders(Principal principal, @ModelAttribute(value = "status") String status) {

		ModelAndView model = new ModelAndView("allorders");
		List<Order> allorders  = orderdao.getallordersFiltered(status);
		List<Employee> employees = employeedao.getallemployees();
		model.addObject("employees", employees);
		model.addObject("allorders", allorders);
		return model;
	}
	
	@RequestMapping(value="/assignorder/{orderid}")
	public ModelAndView assignorder(Principal principal, @PathVariable(value="orderid") int orderid) {

		ModelAndView model = new ModelAndView("employeelist");
		List<Employee> employees = employeedao.getallemployees();
		Order order = orderdao.getOrderbyorderid(orderid);
		model.addObject("order", order);
		model.addObject("orderid", orderid);
		model.addObject("employees", employees);
		return model;
	}
	
	@RequestMapping(value="/assignorder/{orderid}/{employeeid}")
	public String assignorderemp(Principal principal, @PathVariable(value="orderid") int orderid, @PathVariable(value="employeeid") int employeeid) {

		employeedao.assignOrdertoEmployee(orderid,employeeid);
		return "redirect:/admin/allorders";
	}
	
	@RequestMapping(value="/vieworder/{orderid}")
	public ModelAndView vieworder(Principal principal, @PathVariable(value="orderid") int orderid) {

		ModelAndView model = new ModelAndView("vieworder");
		Order order = orderdao.getOrderbyorderid(orderid);
		Employee employee = employeedao.getEmployeebyOrderid(orderid);
		Cart cart = orderdao.getCartbyorderid(orderid, order.getUsername());
		order.setCart(cart);
		order.setAmount(cartdao.getamount(cart));
		model.addObject("order", order);
		model.addObject("employee", employee);
	    return model;
	}
	
	@RequestMapping(value="/viewfeedbacks/{orderid}", method=RequestMethod.GET)
	public ModelAndView viewfeedbacks(Principal principal, @PathVariable(value="orderid") int orderid) {
		
		ModelAndView model = new ModelAndView("adminviewfeedbacks");
		Feedback feedback = new Feedback();
		List<Feedback> feedbacks = feedbackdao.getFeedbacksbyorderid(orderid);
		model.addObject("feedbacks", feedbacks);
		model.addObject("feedback", feedback);
		model.addObject("orderid", orderid);
		return model;
	}
	
	@RequestMapping(value="/viewfeedbacks/{orderid}", method=RequestMethod.POST)
	public String viewfeedbacksprocess(Model model, Principal principal, @PathVariable(value="orderid") int orderid, @Valid @ModelAttribute(value = "feedback") Feedback feedback, BindingResult result) {
		
		if(result.hasErrors()) {
			return "redirect:/admin/viewfeedbacks/"+Integer.toString(orderid);
		}
		
		feedback.setOrderid(orderid);
		feedback.setUsername(principal.getName());
		feedbackdao.addfeedback(feedback);
		return "redirect:/admin/viewfeedbacks/"+Integer.toString(orderid);
	}
	

	@RequestMapping(value="/addnotification", method = RequestMethod.GET)
	public String feedback(Model model, Principal principal) {

		Notification notification = new Notification();
		List<Notification> notifications = notificationdao.getallNotifications();
		model.addAttribute("notifications", notifications);
		model.addAttribute("notification",notification);
		return "addnotification";	
	}
	@RequestMapping(value="/addnotification", method = RequestMethod.POST)
	public String feedbackprocess(@Valid @ModelAttribute("notification") Notification notification, BindingResult result, Model model, Principal principal) {
		
		if(result.hasErrors()) {
			return "redirect:/admin/addnotification";
		}
		else {
			notificationdao.addNotification(notification.getNotification());
			return "redirect:/admin/addnotification";
		}
	}
	
	@RequestMapping(value="/deletenotification/{notificationid}")
	public String deletenotification(Model model, Principal principal, @PathVariable(value="notificationid") int notificationid) {

		//Notification notification = notificationdao.getNotificationbyid(notificationid);
		notificationdao.deletenotification(notificationid);
		return "redirect:/admin/addnotification";	
	}
	
	@RequestMapping(value="/employees")
	public String employees(Model model, Principal principal) {

		String error = (String)model.asMap().get("empdelerror");
		List<Employee> employees = employeedao.getallemployees();
		model.addAttribute("employees", employees);
		model.addAttribute("error", error);
		return "allemployees";	
	}
	
	@RequestMapping(value="/addemployee", method = RequestMethod.GET)
	public String addEmployee(Model model, Principal principal) {

		Employee employee = new Employee();
		model.addAttribute("employee", employee);
		return "addemployee";	
	}
	@RequestMapping(value="/addemployee", method = RequestMethod.POST)
	public String addEmployeeprocess(@Valid @ModelAttribute("employee") Employee employee, BindingResult result, Model model, Principal principal) {
		
		if(result.hasErrors()) {
			return "redirect:/admin/addemployee";
		}
		else {
			
			//Critical Section
			employeedao.addEmployee(employee);
			User user = new User();
			user.setUsername(employee.getEmployeename());
			user.setPassword(employee.getEmployeepassword());
			userdao.saveOrUpdate(user, "ROLE_EMPLOYEE");
			return "redirect:/admin/employees";
		}
	}
	
	@RequestMapping(value="/removeemployee/{employeename}")
	public String removeemployeeprocess(@PathVariable(value="employeename") String employeename, Model model, RedirectAttributes redirectAttributes, Principal principal) {
		
		Employee employee = employeedao.getEmployeebyname(employeename);
		int employeeordercount = employeedao.getCountOrdersbyEmployeeid(employee.getEmployeeid());
		System.out.println(employeeordercount);
		if(employeeordercount==0) {
			// critical section
			userdao.delete(employee.getEmployeename());
			employeedao.removeEmployee(employee);
			return "redirect:/admin/employees";
		}
		model.addAttribute("error","Error : Employee has Assigned Orders");
		redirectAttributes.addFlashAttribute("empdelerror", "Employee has assigned Orders");
		return "redirect:/admin/employees";
	}
	
	
	@RequestMapping(value="employeeorders/{employeename}")
	public String employeeorders(Model model, @PathVariable(value="employeename") String employeename, Principal principal) {
		
		Employee employee = employeedao.getEmployeebyname(employeename);
		List<Order> allorders = orderdao.getOrdersbyemployeeid(employee.getEmployeeid());
		model.addAttribute("allorders", allorders);
		model.addAttribute("employeename", employeename);
		return "adminemployeeorders";
	}
	
	
	  @RequestMapping(value="/searchcategories")
	  public ModelAndView Search(@RequestParam(value = "searchTerm", required = false) String SearchTerm, HttpServletRequest request, HttpServletResponse response) {
	      ModelAndView mav = new ModelAndView("adminsearchcategories");

	      mav.addObject("searchTerm", SearchTerm);
	      mav.addObject("searchResults", categorydao.getCategoriesbySearch(SearchTerm));      

	      return mav;
	  }
	  
	  
	  @RequestMapping(value="/supplier/{productid}")
	  public ModelAndView viewSupplier(@PathVariable(value="productid") int productid, HttpServletRequest request, HttpServletResponse response) {
	      ModelAndView mav = new ModelAndView("supplierproducts");

	      List<Supplier> suppliers = productdao.getSuppliersbyProductID(productid);
	      Product product = productdao.getproductbyid(productid);
	      mav.addObject("product", product);
	      mav.addObject("suppliers", suppliers);
	      mav.addObject("categoryid", product.getCategoryid());
	      return mav;
	  }
	  
	  @RequestMapping(value="/addsupplier/{productid}", method=RequestMethod.GET)
	  public ModelAndView addSupplier(@PathVariable(value="productid") int productid, HttpServletRequest request, HttpServletResponse response) {
	      ModelAndView mav = new ModelAndView("addsupplier");

	      Supplier supplier = new Supplier();
	      mav.addObject("productid", productid);
	      mav.addObject("supplier",supplier);
	      return mav;
	  }
	  
	  @RequestMapping(value="/addsupplier/{productid}", method=RequestMethod.POST)
	  public String addSupplierprocess(Model model, @PathVariable(value="productid") int productid, @ModelAttribute(value="supplier") Supplier supplier, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
	      
		  if(result.hasErrors()) {
			  return "redirect:/admin/supplier/"+Integer.toString(productid);
		  }
		  supplierdao.addsupplier(supplier,productid);
		  return "redirect:/admin/supplier/"+Integer.toString(productid);
	  }
}
