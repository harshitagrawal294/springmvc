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

import com.dbms.model.Category;
import com.dbms.model.Categorylikes;

@Transactional
public class CategorydaoImpl implements Categorydao{

	  @Autowired
	  DataSource datasource;

	  @Autowired
	  JdbcTemplate jdbcTemplate;

	  @Override
	  public List<Category> showallcategories() {
	    String sql = "select * from CATEGORIES";
	    List<Category> allcategories = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	    return allcategories;
	 }

	@Override
	public Category getcategorybyid(int categoryid) {
		String sql = "select * from CATEGORIES where categoryid="+Integer.toString(categoryid);
		return jdbcTemplate.query(sql,new ResultSetExtractor<Category>() {
			
		public Category extractData(ResultSet rs) throws SQLException,DataAccessException{
			if(rs.next()) {
				Category category = new Category();
				category.setCategoryid(rs.getInt("categoryid"));
				category.setCategoryname(rs.getString("categoryname"));
				category.setCategorydescription(rs.getString("categorydescription"));
				return category;
			}
			return null;
		}
		
	});
	}
	@Override
	public boolean checkcategoryexists(Category category) {
		String sql = "select count(*) from CATEGORIES where categoryid=?";
		int count = jdbcTemplate.queryForObject(sql, new Object [] {category.getCategoryid()}, Integer.class);
		if(count>0) return true;
		return false;
	}
	@Override
	public void addcategory(Category category) {

		String sql = "insert into CATEGORIES(categoryname,categorydescription) values(?,?)";
		jdbcTemplate.update(sql,new Object[] {category.getCategoryname(),category.getCategorydescription()});

	}

	@Override
	public List<Category> getCategoriesbySearch(String searchTerm) {
		String searchterm = searchTerm.toLowerCase();
		String sql = "select * from CATEGORIES where categoryname like '%"+searchterm+"%'";
		List<Category> searchedcategories = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
		return searchedcategories;
	}

	@Override
	public List<Categorylikes> gettopcategories() {
		//String sql = "select * from (select * from (select productid,categoryid from PRODUCTS) as p natural join LIKES) as pl natural join CATEGORIES group by categoryid limit 3";
		String sql = "select categoryid, categoryname, categorydescription, count(categoryid) as c from (select productid,categoryid from PRODUCTS natural join LIKES) as p natural join CATEGORIES group by categoryid order by count(categoryid) desc limit 3";
		return jdbcTemplate.query(sql,new ResultSetExtractor<List<Categorylikes>>() {
			
			public List<Categorylikes> extractData(ResultSet rs) throws SQLException,DataAccessException{
				List<Categorylikes> categories = new ArrayList<>();
				if(!rs.isBeforeFirst()) return categories;
				while(rs.next()) {
					Category category = new Category();
					category.setCategoryid(rs.getInt("categoryid"));
					category.setCategoryname(rs.getString("categoryname"));
					category.setCategorydescription(rs.getString("categorydescription"));
					Categorylikes categorylikes = new Categorylikes();
					categorylikes.setCategory(category);
					categorylikes.setLikes(rs.getInt("c"));
					categories.add(categorylikes);
				}
				return categories;
			}
			
		});
	}
}
