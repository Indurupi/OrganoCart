package com.organocart.DAOImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.organocart.DAO.BillingAddresDAO;
import com.organocart.model.BillingAddressModel;
import com.organocart.model.ProductModel;

@Repository
public class BillingAddressDAOImpl implements BillingAddresDAO{
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public String insertBillingAddress(BillingAddressModel billingaddress) {
		
		Session s = sessionFactory.openSession();
		Transaction tr = s.getTransaction();
		tr.begin();
		s.save(billingaddress);
		tr.commit();
		s.close();
		
		return null;
	}

	@Override
	public String updateBillingAddress(int addressid,BillingAddressModel billingaddress) {
		Session s = sessionFactory.openSession();
		Transaction tr = s.getTransaction();
		tr.begin();
		BillingAddressModel bm = (BillingAddressModel)s.get(BillingAddressModel.class, addressid);
		
		bm.setAddressId(billingaddress.getAddressId());
		bm.setAddressLine1(billingaddress.getAddressLine1());
		bm.setAddressLine2(billingaddress.getAddressLine2());
		bm.setCartId(billingaddress.getCartId());
		bm.setCity(billingaddress.getCity());
		bm.setCountry(billingaddress.getCountry());
		bm.setPhoneNumber(billingaddress.getPhoneNumber());
		bm.setPincode(billingaddress.getPincode());
		bm.setState(billingaddress.getState());
		bm.setUserName(billingaddress.getUserName());
		
		s.update(bm);
		
		tr.commit();
		s.close();
		return null;
	}

	@Override
	public String deleteBillingAddress(int addressid) {
		Session s = sessionFactory.openSession();
		Transaction tr = s.getTransaction();
		tr.begin();	
		BillingAddressModel bm = (BillingAddressModel)s.get(BillingAddressModel.class, addressid);
		s.remove(bm);
		tr.commit();
		s.close();
		return null;
	}

	@Override
	public String viewBillingAddresses(int cartid) {
	
		Session s = sessionFactory.openSession();
		Transaction tr = s.getTransaction();
		tr.begin();
		ArrayList<BillingAddressModel> addressarray = new ArrayList<BillingAddressModel>();
		List<BillingAddressModel> addresslist = s.createQuery("from BillingAddressModel").list();
		Iterator<BillingAddressModel> iterator = addresslist.iterator();
		while (iterator.hasNext()) {
			BillingAddressModel bam = iterator.next();
			if(bam.getCartId() == cartid)
			{
				addressarray.add(bam);
			}
		}
		Gson gson = new Gson();
		String addressjsonlist = gson.toJson(addressarray);
		tr.commit();
		s.close();
		return addressjsonlist;
	}

	@Override
	public BillingAddressModel viewOneBillingAddress(int bid) {
		
		Session s = sessionFactory.openSession();
		Transaction tr = s.getTransaction();
		tr.begin();
		BillingAddressModel oneaddressobj = (BillingAddressModel)s.get(BillingAddressModel.class, bid);
		tr.commit();
		s.close();
		return oneaddressobj;
	}
}
