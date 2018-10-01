package com.dbms;

import java.security.Principal;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dbms.dao.Cartdao;
import com.dbms.dao.Categorydao;
import com.dbms.dao.Productdao;
import com.dbms.model.Category;
import com.dbms.model.Categorylikes;
import com.dbms.model.Product;

@Controller
public class CategoryController {

  @Autowired
  Categorydao categorydao;
  @Autowired
  Productdao productdao;
  @Autowired
  Cartdao cartdao;
  
  @RequestMapping(value = "/categories")
  public String allcategories(Model model, HttpServletRequest request, HttpServletResponse response) {
    
    String msg = (String)model.asMap().get("liked");
    List<Category> allcategories = categorydao.showallcategories();
    model.addAttribute("allcategories", allcategories);
    model.addAttribute("error", msg);

    return "allcategories";
  }
  
  
  @RequestMapping(value = "/categories/{categoryid}")
  public ModelAndView categoryproducts(HttpServletRequest request, HttpServletResponse response, @PathVariable(value = "categoryid") int categoryid, Principal principal) {
    ModelAndView mav = new ModelAndView("categoryproducts");
    
    String username = principal.getName();
    
    List<Product> categoryproducts = productdao.showallproductsbycategory(categoryid);
    Category category = categorydao.getcategorybyid(categoryid);
    TreeMap<Product,Integer> productQuantity = new TreeMap<>(new ProductComparator());
    
    for(Product product : categoryproducts) {
    	if(!cartdao.isPresentInCart(username, product))
    		productQuantity.put(product,0);
    	else {
	    	int count = cartdao.getCountInCart(username, product);
	    	productQuantity.put(product, count);
    	}
    }
    mav.addObject("productQuantity",productQuantity);
    mav.addObject("category",category); 
    return mav;
  }
  
  @RequestMapping(value="/searchcategories")
  public String Search(Model model, @RequestParam(value = "searchTerm", required = false) String SearchTerm, HttpServletRequest request, HttpServletResponse response) {

      model.addAttribute("searchTerm", SearchTerm);
      model.addAttribute("searchResults", categorydao.getCategoriesbySearch(SearchTerm));      

      return "searchcategories";
  }
  
  @RequestMapping(value = "/categories/searchproducts/{categoryid}")
  public ModelAndView categoryproductsSearch(@RequestParam(value = "searchTerm", required = false) String SearchTerm, HttpServletRequest request, HttpServletResponse response, @PathVariable(value = "categoryid") int categoryid, Principal principal) {
    ModelAndView mav = new ModelAndView("searchcategoryproducts");
    
    String username = principal.getName();
    
    List<Product> categoryproducts = productdao.getCategoryProductsbySearch(categoryid, SearchTerm);
    Category category = categorydao.getcategorybyid(categoryid);
    TreeMap<Product,Integer> productQuantity = new TreeMap<>(new ProductComparator());
    for(Product product : categoryproducts) {
    	if(!cartdao.isPresentInCart(username, product))
    		productQuantity.put(product,0);
    	else {
	    	int count = cartdao.getCountInCart(username, product);
	    	productQuantity.put(product, count);
    	}
    }
    mav.addObject("productQuantity",productQuantity);
    mav.addObject("category",category); 
    mav.addObject("searchTerm", SearchTerm);
    //mav.addObject("searchResults", productdao.getCategoryProductsbySearch(categoryid, SearchTerm));
    return mav;
  }
  
  @RequestMapping(value = "/top")
  public String gettop(Model model, HttpServletRequest request, HttpServletResponse response) {
    
    List<Product> products = productdao.gettopproducts();
    List<Categorylikes> categories = categorydao.gettopcategories();
    model.addAttribute("products", products);
    model.addAttribute("categories", categories);
    return "top";
    
  }
  
  
}
