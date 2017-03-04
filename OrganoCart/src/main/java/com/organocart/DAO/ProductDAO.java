package com.organocart.DAO;

import org.springframework.stereotype.Service;

import com.organocart.model.ProductModel;

@Service
public interface ProductDAO {


	public String insertProduct(ProductModel pm);
	public String updateProduct(String product_id,ProductModel pm);
	public String deleteProduct(String product_id);
	public String viewProduct();
	public ProductModel viewOneProduct(String product_id);
}
