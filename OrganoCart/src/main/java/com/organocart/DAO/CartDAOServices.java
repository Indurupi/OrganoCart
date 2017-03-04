package com.organocart.DAO;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.organocart.model.Cart;
import com.organocart.model.UserCartDetails;

@Service
public interface CartDAOServices {

	public int getCartId(String email);
	public String insertCartwithProducts(UserCartDetails usercartdetails);
	public String updateCartWithProducts(UserCartDetails usercartdetails);
	public ArrayList<Cart> viewItemsInCart(int cartid);
	public String deleteCart(int cartid);
}
