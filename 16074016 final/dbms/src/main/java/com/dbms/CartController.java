package com.dbms;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dbms.dao.Cartdao;
import com.dbms.dao.Productdao;
import com.dbms.model.Cart;
import com.dbms.model.Product;

@Controller
public class CartController {

	@Autowired
	Cartdao cartdao;
	@Autowired
	Productdao productdao;
	
	@RequestMapping(value="/myproducts")
	public ModelAndView showcart(Model modell, Principal principal) {
		
		String error = (String)modell.asMap().get("error");
		ModelAndView model = new ModelAndView("userproducts");
		String username = principal.getName();
		Cart cart= cartdao.getCartbyusername(username);
		Double amount = cartdao.getamount(cart);
		model.addObject("amount", amount);
		model.addObject("mycart",cart);
		model.addObject("error",error);
		return model;
	}
	
	@RequestMapping(value="/emptycart")
	public String emptycartprocess(Model model, Principal principal) {
		cartdao.emptycart(principal.getName());
		return "redirect:/myproducts";	
	}
	
	@RequestMapping(value="/add/{productid}")
	public String addtocart(Principal principal, @PathVariable(value="productid") int productid) {
		
		String username = principal.getName();
		Product product = productdao.getproductbyid(productid);
		
		int availablequantity=product.getAvailablequantity();
		int categoryid=product.getCategoryid();
		if(availablequantity==0) {
			return "redirect:/categories/"+Integer.toString(categoryid);
		}
		cartdao.addToCart(username, product);
		return "redirect:/categories/"+Integer.toString(categoryid);
	}
	
	@RequestMapping(value="/addfromcart/{productid}")
	public String addtocartcart(Principal principal, @PathVariable(value="productid") int productid) {
		
		String username = principal.getName();
		Product product = productdao.getproductbyid(productid);
		
		int availablequantity=product.getAvailablequantity();
		int categoryid=product.getCategoryid();
		if(availablequantity==0) {
			return "redirect:/myproducts";
		}
		cartdao.addToCart(username, product);
		return "redirect:/myproducts/";
	}
	
	@RequestMapping(value="/remove/{productid}")
	public String removefromcart(Model model, Principal principal, @PathVariable(value="productid") int productid) {
		
		String username = principal.getName();
		Product product = productdao.getproductbyid(productid);
		
		cartdao.removeFromCart(username, product);
		return "redirect:/myproducts";
	}
}
