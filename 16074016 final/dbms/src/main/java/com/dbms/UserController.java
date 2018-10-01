package com.dbms;

import java.security.Principal;
import java.util.List;

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
import com.dbms.dao.Employeedao;
import com.dbms.dao.Feedbackdao;
import com.dbms.dao.Notificationdao;
import com.dbms.dao.Orderdao;
import com.dbms.dao.Productdao;
import com.dbms.dao.Userdao;
import com.dbms.model.Cart;
import com.dbms.model.CartItem;
import com.dbms.model.Feedback;
import com.dbms.model.Notification;
import com.dbms.model.Order;
import com.dbms.model.Product;
import com.dbms.model.User;


@Controller
public class UserController {

	@Autowired
	Cartdao cartdao;
	@Autowired
	Userdao userdao;
	@Autowired
	Orderdao orderdao;
	@Autowired
	Productdao productdao;
	@Autowired
	Feedbackdao feedbackdao;
	@Autowired
	Notificationdao notificationdao;
	@Autowired
	Employeedao employeedao;
	
	@RequestMapping("/dashboard")
	public ModelAndView user(Principal principal) {

		ModelAndView model = new ModelAndView("dashboard");
		String loggedInUserName = principal.getName();
		model.addObject("user", loggedInUserName);
		model.addObject("name", "Spring Security USER Custom Login");
		model.addObject("description", "Protected page for user !");
		return model;
	}
	
	@RequestMapping("/home")
	public ModelAndView home(Principal principal) {

		ModelAndView model = new ModelAndView("dashboard");
		return model;
	}
	
	@RequestMapping("/notifications")
	public ModelAndView viewNotifications(Principal principal) {

		ModelAndView model = new ModelAndView("notifications");
		List<Notification> notifications = notificationdao.getallNotifications();
		model.addObject("notifications", notifications);
		return model;
	}
	
	@RequestMapping(value="/profile")
	public ModelAndView viewprofile(Principal principal) {
		
		ModelAndView model = new ModelAndView("profiledetails");
		String username = principal.getName();
		User user = userdao.getCustomerbyusername(username);
		model.addObject("userinfo", user);
		return model;
	}
	@RequestMapping(value="/confirmorder")
	public String confirmorder(Model model, Principal principal, RedirectAttributes redirectAttributes) {
		
		String username = principal.getName();
		Cart cart = cartdao.getCartbyusername(username);
		Double amount = cartdao.getamount(cart);
		if(amount==0.0) {
			model.addAttribute("error", "No Products Selected");
			redirectAttributes.addFlashAttribute("error", "No Products Selected");
			return "redirect:/myproducts";
		}
		
		for(CartItem cartitem:cart.getCartitems()) { 
			Product product=productdao.getproductbyid(cartitem.getProduct().getProductid());
			if(product.getAvailablequantity()<cartitem.getQuantity()) {
				redirectAttributes.addFlashAttribute("error","Quantity not Available");
				return "redirect:/myproducts";
			}
		}
		
		return "confirmorder";
	}
	
	@RequestMapping(value="/editprofile", method = RequestMethod.GET)
	public ModelAndView editprofile(Principal principal) {
		
		ModelAndView model = new ModelAndView("editprofile");
		User user = userdao.getCustomerbyusername(principal.getName());
		user.setPassword("dummy");
		user.setMpassword("dummy");
		model.addObject("user",user);
		return model;
	}
	
	@RequestMapping(value="/editprofile", method = RequestMethod.POST)
	public String editprofileprocess(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, Principal principal) {
		
		
		if(result.hasErrors()) {
			return "editprofile";
		}
		else {
			userdao.updatedetails(user);
			return "redirect:/profile";
		}
	}
	
	@RequestMapping(value="/placeorder")
	public String placeorder(Model model, Principal principal, RedirectAttributes redirectAttributes) {
		
		String username = principal.getName();

		//place order
		Order order = new Order();
		Cart cart = cartdao.getCartbyusername(username);
		Double amount = cartdao.getamount(cart);
		if(amount==0.0) {
			model.addAttribute("error", "No Products Selected");
			redirectAttributes.addFlashAttribute("error", "No Products Selected");
			return "redirect:/myproducts";
		}
		
		order.setOrderid(orderdao.getordercount()+1);
		order.setCart(cart);
		order.setUsername(username);
		order.setStatus("Pending");
		order.setAmount(amount);
		order.setDeliveryaddress(userdao.getCustomerbyusername(username).getAddress());
		
		//check if cart/order empty
		
		
		for(CartItem cartitem:order.getCart().getCartitems()) { 
			Product product=productdao.getproductbyid(cartitem.getProduct().getProductid());
			if(product.getAvailablequantity()<cartitem.getQuantity()) {
				redirectAttributes.addFlashAttribute("error","Quantity not Available");
				return "redirect:/myproducts";
			}
		}
		//make critical section
		
		//subtract available product quantity
		cartdao.reduceavailableproductquantity(cart);
		//empty cart contents
		cartdao.emptycart(username);
		//add order to database
		orderdao.placeorder(order);
		
		return "redirect:/orderhistory";
		
	}
	@RequestMapping(value="/orderhistory")
	public ModelAndView orderhistory(Principal principal) {
		
		ModelAndView model = new ModelAndView("orderhistory");
		String username = principal.getName();
		
		
		//display all orders
		List<Order> orderlist = orderdao.getOrdersbyusername(username);
		model.addObject("orderlist", orderlist);	
		return model;
		
	}
	
	@RequestMapping(value="/orderhistory/{status}")
	public String orderhistory(Model model, Principal principal, @PathVariable(value="status")String status) {
		
		String username = principal.getName();
		
		
		//display all orders
		List<Order> orderlist = orderdao.getallordersFilteredbyusername(username, status);
		model.addAttribute("orderlist", orderlist);	
		return "orderhistoryfiltered";
		
	}
		
	@RequestMapping(value="/cancelorder", method=RequestMethod.POST)
	public String cancelorder(Model model, Principal principal, @RequestParam(value="orderid") int orderid) {
		
		String username = principal.getName();
		Cart cart = orderdao.getCartbyorderid(orderid, username);
		
		
		//make critical section
		
		//delete order
		orderdao.cancelorder(orderid);
		//add available quantity to products
		cartdao.addavailableproductquantity(cart);
			
		return "redirect:/orderhistory";	
	}
	
	@RequestMapping(value="/feedback/{orderid}", method = RequestMethod.GET)
	public String feedback(Model model, Principal principal, @PathVariable(value="orderid") int orderid) {

		Feedback feedback = new Feedback();
		List<Feedback> orderfeedbacks = feedbackdao.getFeedbacksbyorderid(orderid);
		model.addAttribute("orderfeedbacks", orderfeedbacks);
		model.addAttribute(feedback);
		model.addAttribute("orderid",orderid);
		return "feedbacks";	
	}
	@RequestMapping(value="/feedback/{orderid}", method = RequestMethod.POST)
	public String feedbackprocess(@Valid @ModelAttribute("feedback") Feedback feedback, BindingResult result, Model model, Principal principal, @PathVariable(value="orderid") int orderid) {
		
		
		if(result.hasErrors()) {
			return "redirect:/feedback/{orderid}";
		}
		else {
			feedback.setOrderid(orderid);
			feedback.setUsername(principal.getName());
			feedbackdao.addfeedback(feedback);
			return "redirect:/feedback/{orderid}";
		}
	}
	
	@RequestMapping(value="/viewuserorder", method=RequestMethod.POST)
	public String vieworder(Model model, Principal principal, @RequestParam(value="orderid") int orderid) {

		Order order = orderdao.getOrderbyorderid(orderid);
		Cart cart = orderdao.getCartbyorderid(orderid, principal.getName());
		model.addAttribute("cart", cart);
		model.addAttribute("order",order);
		model.addAttribute("employee", employeedao.getEmployeebyOrderid(orderid));
		return "viewuserorder";
	}
	
	@RequestMapping(value="/aboutus")
	public String aboutus(Model model, Principal principal) {
		return "aboutus";
	}
	
	@RequestMapping(value="/like/{productid}")
	public String likeproduct(Model model, RedirectAttributes redirectAttributes, Principal principal, @PathVariable(value="productid") int productid) {

		if(productdao.isalreadyliked(principal.getName(), productid)) {
			redirectAttributes.addFlashAttribute("liked", "Already Liked");
			return "redirect:/categories/"+Integer.toString(productdao.getproductbyid(productid).getCategoryid());
			//return "redirect:/dashboard";
		}
		userdao.likeproduct(principal.getName(), productid);
		return "redirect:/categories/"+Integer.toString(productdao.getproductbyid(productid).getCategoryid());
	}
	
	@RequestMapping(value="/dislike/{productid}")
	public String dislikeproduct(Model model, RedirectAttributes redirectAttributes, Principal principal, @PathVariable(value="productid") int productid) {

		if(!productdao.isalreadyliked(principal.getName(), productid)) {
			redirectAttributes.addFlashAttribute("liked", "Already Disliked");
			return "redirect:/categories/"+Integer.toString(productdao.getproductbyid(productid).getCategoryid());
			//return "redirect:/dashboard";
		}
		userdao.dislikeproduct(principal.getName(), productid);
		return "redirect:/categories/"+Integer.toString(productdao.getproductbyid(productid).getCategoryid());
	}
	@RequestMapping(value="/favorites")
	public String favorites(Model model, Principal principal) {
		List<Product> favorites = userdao.getfavorites(principal.getName());
		model.addAttribute("favorites", favorites);
		return "favorites";
	}
}
