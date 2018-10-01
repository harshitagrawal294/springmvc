package com.dbms;

import java.util.Comparator;

import com.dbms.model.Product;

public class ProductComparator implements Comparator<Product> {
    public int compare(Product p1,Product p2)
    {
    	if (p1.getProductname() == p2.getProductname()) {
            return 0;
        }
        if (p1.getProductname() == null) {
            return -1;
        }
        if (p2.getProductname() == null) {
            return 1;
        }
		return p1.getProductname().compareTo(p2.getProductname());
        
    }
}
