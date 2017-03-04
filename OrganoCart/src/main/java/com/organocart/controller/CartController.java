package com.organocart.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.tuple.GeneratedValueGeneration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.organocart.DAO.BillingAddresDAO;
import com.organocart.DAO.CartDAOServices;
import com.organocart.DAO.ProductDAO;
import com.organocart.model.Cart;
import com.organocart.model.ProductModel;
import com.organocart.model.UserCartDetails;

@Controller
public class CartController {

	@Autowired
	ProductDAO productdao;

	@Autowired
	CartDAOServices cdao;
	
	@Autowired
	BillingAddresDAO bdao;

	@RequestMapping("/showcartpage")
	public ModelAndView showCartPage(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView("CartPage");
		Gson g = new Gson();
		ArrayList<Cart> c = (ArrayList<Cart>) httpSession.getAttribute("usercart");
		if (c.isEmpty()) {
			httpSession.setAttribute("cartempty", "true");
			return mv;
		} else {
			String cartgson = g.toJson(c);
			mv.addObject("itemsincart", cartgson);
			httpSession.setAttribute("grandtotal", getGrandTotal(c));
			httpSession.setAttribute("grandquantity",getgrandquantity(c));
			httpSession.setAttribute("cartempty", "false");
			return mv;
		}
	}

	public int getGrandTotal(ArrayList<Cart> item) {
		int gtotal = 0;
		ListIterator<Cart> itr = item.listIterator();
		while (itr.hasNext()) {
			Cart ob = (Cart) itr.next();
			gtotal = gtotal + (ob.getQty() * ob.getPrice());
		}
		return gtotal;
	}
	
	public int getgrandquantity(ArrayList<Cart> items) {
		int grandquant = 0;
		ListIterator<Cart> itr = items.listIterator();
		while (itr.hasNext()) {
			Cart obj = (Cart) itr.next();
			grandquant = grandquant + obj.getQty();
		}
		return grandquant;
	}
	
	@RequestMapping("/addtocart")
	public String addingToCart(@RequestParam("getProductId") String productId, HttpSession session) {

		ProductModel pm = productdao.viewOneProduct(productId);
		session.setAttribute("productid", productId);
		String flag = "not inserted";
		ArrayList<Cart> cartarray = (ArrayList<Cart>) session.getAttribute("usercart");
		
		if(cartarray.isEmpty())
		{
			cartarray.add(new Cart(pm.getProductId(), pm.getProductName(), 1, pm.getProductPrice(), pm.getProductPrice()));
			flag = "inserted";
		}
		else
		{
			Iterator<Cart> lit = cartarray.iterator();
			while (lit.hasNext()) {
				Cart d = lit.next();
				if (d.getPid().equals(productId)) {
					int index = cartarray.indexOf(d);
					String name = d.getPname();
					int qty = d.getQty() + 1;
					int price = d.getPrice();
					cartarray.remove(index);
					cartarray.add(index, new Cart(productId, name, qty, price, ((qty) * price)));
					session.setAttribute("usercart", cartarray);
					flag = "inserted";
					break;
				}
			}
			if (flag.equals("not inserted")) {
				cartarray.add(new Cart(pm.getProductId(), pm.getProductName(), 1, pm.getProductPrice(), pm.getProductPrice()));
				session.setAttribute("usercart", cartarray);
			}
		}
		session.setAttribute("grandquantity", getgrandquantity(cartarray));
		UserCartDetails usercart = new UserCartDetails();
		Integer intcart = Integer.parseInt(session.getAttribute("Cartid").toString());
		usercart.setCartid(Integer.parseInt(session.getAttribute("Cartid").toString()));
		usercart.setProductsincart(cartarray.toString());
		cdao.insertCartwithProducts(usercart);
		return "redirect:/buyproductpage";
	}
	
	@RequestMapping("/removeproductitem")
	public String removeproductitem(@RequestParam("pid")String productid,HttpSession session)
	{
		@SuppressWarnings("unchecked")
		ArrayList<Cart> cartitems = (ArrayList<Cart>)session.getAttribute("usercart");
		Iterator<Cart> list = (Iterator<Cart>)cartitems.iterator();
		while(list.hasNext())
		{
			Cart c = list.next();
			if(c.getPid().equals(productid))
			{
			cartitems.remove(cartitems.indexOf(c));
			break;
			}
		}
		UserCartDetails cd = new UserCartDetails();
		cd.setCartid((Integer.parseInt(session.getAttribute("Cartid").toString())));
		cd.setProductsincart(cartitems.toString());
		cdao.updateCartWithProducts(cd);
				
		session.setAttribute("grandquantity",getgrandquantity(cartitems));
		session.setAttribute("usercart", cartitems);
		return "redirect:/showcartpage";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/editquantity")
	public String editCart(@RequestParam("getproductid") String id, @RequestParam("value") String sign, HttpSession session) {
		ArrayList<Cart> c = (ArrayList<Cart>) session.getAttribute("usercart");
		Iterator<Cart> lit = c.iterator();
		while (lit.hasNext()) {
			Cart d = lit.next();
			int index = c.indexOf(d);
			if (d.getPid().equals(id)) {
				String name = d.getPname();
				int qty = d.getQty();
				int price = d.getPrice();
				c.remove(index);
				if (sign.equals("decrease") && qty > 1) {
					c.add(index, new Cart(id, name, qty - 1, price, ((qty + 1) * price)));
				} else if (sign.equals("decrease") && qty == 1) {
					c.add(index, new Cart(id, name, 1, price, price));
				} else if (sign.equals("increase") && qty < 100) {
					c.add(index, new Cart(id, name, qty + 1, price, ((qty + 1) * price)));
				} else {
					c.add(index, new Cart(id, name, qty, price, ((qty) * price)));
				}
				break;
			}
		}
		UserCartDetails cd = new UserCartDetails();
		int cartid = (int) session.getAttribute("Cartid");
		cd.setCartid((Integer.parseInt(session.getAttribute("Cartid").toString())));
		cd.setProductsincart(c.toString());
		cdao.updateCartWithProducts(cd);
		session.setAttribute("grandquantity", getgrandquantity(c));
		session.setAttribute("usercart", c);
		
		return "redirect:/showcartpage";
	}
	
}
