package com.organocart.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserCartDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int aprimarykey;
	
	@Column
	int cartid;
	
	@Column(columnDefinition="TEXT")
	String productsincart;
	
	@Column
	String status="InCart";
	
	
	public int getAprimarykey() {
		return aprimarykey;
	}

	public void setAprimarykey(int aprimarykey) {
		this.aprimarykey = aprimarykey;
	}

	public int getCartid() {
		return cartid;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}

	public String getProductsincart() {
		return productsincart;
	}

	public void setProductsincart(String productsincart) {
		this.productsincart = productsincart;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


}
