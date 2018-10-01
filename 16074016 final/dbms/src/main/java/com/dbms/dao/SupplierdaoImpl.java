package com.dbms.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.dbms.model.Supplier;
@Transactional
public class SupplierdaoImpl implements Supplierdao{

	
	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	@Override
	public void addsupplier(Supplier supplier, int productid) {
		String sql = "insert into SUPPLIERS(suppliername, supplierphone, supplieraddress) values(?,?,?)";
		jdbcTemplate.update(sql, new Object[] {supplier.getSuppliername(), supplier.getSupplierphone(), supplier.getSupplieraddress()});
		
		int nsupplierid = getmaxsupplierid();
		
		System.out.println(nsupplierid);
		
		sql = "insert into SUPPLIERPRODUCTS values(?,?)";
		jdbcTemplate.update(sql, new Object[] {nsupplierid, productid});
	}

	@Override
	public int getmaxsupplierid() {
		
		String sql = "select max(supplierid) from SUPPLIERS";
		int suppliers = jdbcTemplate.queryForObject(sql, new Object [] {}, Integer.class);
		return suppliers;
	}
}
