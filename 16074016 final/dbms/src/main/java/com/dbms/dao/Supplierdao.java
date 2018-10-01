package com.dbms.dao;

import com.dbms.model.Supplier;

public interface Supplierdao {

	public void addsupplier(Supplier supplier, int supplierid);

	public int getmaxsupplierid();
}
