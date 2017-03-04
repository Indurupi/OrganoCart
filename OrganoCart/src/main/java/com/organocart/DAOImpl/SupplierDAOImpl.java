package com.organocart.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.organocart.DAO.SupplierDAO;
import com.organocart.model.CategoriesModel;
import com.organocart.model.SupplierModel;

@Repository
public class SupplierDAOImpl implements SupplierDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public String insertSupplier(SupplierModel sm) {

		String status;
		
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		s.save(sm);
		t.commit();
		s.close();
		return null;
	}

	@Override
	public String updateSupplier(SupplierModel sm) {

		String status;
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		s.update(sm);
		t.commit();
		s.close();
		return null;
	}

	@Override
	public String deleteSupplier(String id) {
		String status;
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		SupplierModel sm =  (SupplierModel)s.get(SupplierModel.class, id);
		s.delete(sm);
		t.commit();
		s.close();
		return null;
	}

	@Override
	public String viewSupplier() {
		
		String status;
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		List<SupplierModel> supplierlist = s.createQuery("from SupplierModel").list();
		Gson g = new Gson();
		String supplierlistgson = g.toJson(supplierlist);
		t.commit();
		s.close();
		return supplierlistgson;
	}

	@Override
	public SupplierModel viewOneSupplier(String supplierid) {
		String status;
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		SupplierModel sm =  (SupplierModel)s.get(SupplierModel.class, supplierid);
		//Gson gson = new Gson();
		//String onesuppliergsonstring = gson.toJson(sm);
		t.commit();
		s.close();
		return sm;
	}

}
