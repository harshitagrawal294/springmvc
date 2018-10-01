package com.dbms.dao;

import java.util.List;

import com.dbms.model.Category;
import com.dbms.model.Categorylikes;

public interface Categorydao {
	
	public List<Category> showallcategories();
	public Category getcategorybyid(int categoryid);
	public boolean checkcategoryexists(Category category);
	public void addcategory(Category category);
	public List<Category> getCategoriesbySearch(String searchTerm);
	public List<Categorylikes> gettopcategories();
}
