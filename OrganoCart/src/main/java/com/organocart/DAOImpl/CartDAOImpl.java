package com.organocart.DAOImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.organocart.DAO.CartDAOServices;
import com.organocart.model.Cart;
import com.organocart.model.CartIdCred;
import com.organocart.model.UserCartDetails;

@Repository
public class CartDAOImpl implements CartDAOServices {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public int getCartId(String email) {

		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		int cartid = 0;
		List<CartIdCred> cartidcredlist = s.createQuery("from CartIdCred").list();
		Iterator<CartIdCred> iterator = cartidcredlist.iterator();
		while (iterator.hasNext()) {
			CartIdCred cartidobj = iterator.next();
			if (cartidobj.getUserEmail().equals(email)) {
				cartid = cartidobj.getCartId();
			}
		}

		t.commit();
		s.close();
		return cartid;
	}

	@Override
	public String insertCartwithProducts(UserCartDetails usercartdetails) {
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		List<UserCartDetails> us = s.createQuery("from UserCartDetails").list();
		if (us.isEmpty()) 
		{
			s.save(usercartdetails);
		} 
		else 
		{
			Iterator<UserCartDetails> usercartiteration = us.listIterator();
			while (usercartiteration.hasNext())
			{
				UserCartDetails cartitems = usercartiteration.next();				
				if (cartitems.getCartid() == usercartdetails.getCartid()) 
				{
					s.delete(cartitems);
					s.save(usercartdetails);
					break;
				}
				else
				{
					s.save(usercartdetails);
				}
			}
		}

		t.commit();
		s.close();
		return null;
	}

	@Override
	public String updateCartWithProducts(UserCartDetails usercartdetails) {
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		List<UserCartDetails> us = s.createQuery("from UserCartDetails").list();
		Iterator<UserCartDetails> usi = us.listIterator();
		while (usi.hasNext()) {
			UserCartDetails cd = usi.next();
			if (cd.getCartid() == usercartdetails.getCartid()) {
				cd.setProductsincart(usercartdetails.getProductsincart());
				cd.setStatus(usercartdetails.getStatus());
				s.update(cd);
				break;
			}
		}
		t.commit();
		s.close();
		return null;
	}
	
	@Override
	public String deleteCart(int cartid) {
		Session session = sessionFactory.openSession();
		Transaction t = session.getTransaction();
		t.begin();
		ArrayList<Cart> c = new ArrayList<Cart>();
		List<UserCartDetails> usercartitems = session.createQuery("from UserCartDetails").list();
		Iterator<UserCartDetails> usercartiteration = usercartitems.listIterator();
		while (usercartiteration.hasNext()) {
			UserCartDetails cartitems = usercartiteration.next();
			if (cartitems.getCartid() == cartid) {
				session.delete(cartitems);
				break;
			}
		}
		return null;
	}

	@Override
	public ArrayList<Cart> viewItemsInCart(int cartid) {

		Session session = sessionFactory.openSession();
		Transaction t = session.getTransaction();
		t.begin();
		ArrayList<Cart> c = new ArrayList<Cart>();
		List<UserCartDetails> usercartitems = session.createQuery("from UserCartDetails").list();
		Iterator<UserCartDetails> usercartiteration = usercartitems.listIterator();
		while (usercartiteration.hasNext()) {
			UserCartDetails cartitems = usercartiteration.next();
			if (cartitems.getCartid() == cartid && cartitems.getStatus() == "InCart") {
				String[] concatedproducts = cartitems.getProductsincart().split(",");
				for (String prod : concatedproducts) {
					String[] oneproduct = prod.split("!");
					c.add(new Cart(oneproduct[0].substring(5), oneproduct[1].substring(6),
							Integer.parseInt(oneproduct[2].substring(4)), Integer.parseInt(oneproduct[3].substring(6)),
							Integer.parseInt(oneproduct[4].substring(6))));
				}
				break;
			}
			else
			{
				break;
			}
		}
		return c;
	}
}
