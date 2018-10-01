package com.dbms.model;

public class Product {

	private int productid;
	private String productname;
	private Double productprice;
	private int categoryid;
	private int availablequantity;
	private String description;
	private int productlikes;
	
	public int getProductlikes() {
		return productlikes;
	}
	public void setProductlikes(int productlikes) {
		this.productlikes = productlikes;
	}
	public int getAvailablequantity() {
		return availablequantity;
	}
	public void setAvailablequantity(int availablequantity) {
		this.availablequantity = availablequantity;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public Double getProductprice() {
		return productprice;
	}
	public void setProductprice(Double productprice) {
		this.productprice = productprice;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	
	
}
