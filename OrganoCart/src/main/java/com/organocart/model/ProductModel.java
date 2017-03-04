package com.organocart.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import org.hibernate.annotations.ForeignKey;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class ProductModel {

	@Id
	String ProductId;
	
	@Column
	String ProductName;
	
	@Column
	int ProductPrice;
	
	@Column
	int ProductStock;

	@Column
	String ProductDescription;
	
	@Column
	String SupplierId;
	
	@Column
	String CategoryId;
	
	
	@Transient
	MultipartFile PImage;


	public String getProductId() {
		return ProductId;
	}


	public void setProductId(String productId) {
		ProductId = productId;
	}


	public String getProductName() {
		return ProductName;
	}


	public void setProductName(String productName) {
		ProductName = productName;
	}


	public int getProductPrice() {
		return ProductPrice;
	}


	public void setProductPrice(int productPrice) {
		ProductPrice = productPrice;
	}


	public int getProductStock() {
		return ProductStock;
	}


	public void setProductStock(int productStock) {
		ProductStock = productStock;
	}


	public String getProductDescription() {
		return ProductDescription;
	}


	public void setProductDescription(String productDescription) {
		ProductDescription = productDescription;
	}


	public String getSupplierId() {
		return SupplierId;
	}


	public void setSupplierId(String supplierId) {
		SupplierId = supplierId;
	}


	public String getCategoryId() {
		return CategoryId;
	}


	public void setCategoryId(String categoryId) {
		CategoryId = categoryId;
	}


	public MultipartFile getPImage() {
		return PImage;
	}


	public void setPImage(MultipartFile pImage) {
		PImage = pImage;
	}
}
