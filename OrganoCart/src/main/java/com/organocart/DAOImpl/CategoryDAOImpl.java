package com.organocart.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.organocart.DAO.CategoriesDAO;
import com.organocart.model.CategoriesModel;

@Repository
public class CategoryDAOImpl implements CategoriesDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public String insertCategory(CategoriesModel cm) {

		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		s.save(cm);
		t.commit();
		s.close();

		return null;
	}

	@Override
	public String updateCategory(CategoriesModel cm) {

		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		//CategoriesModel cm = (CategoriesModel)s.get(CategoriesModel.class, categoryid);
		s.update(cm);
		t.commit();
		s.close();
		return null;
	}

	@Override
	public String deleteCategory(String Id) {

		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		CategoriesModel cm = (CategoriesModel) s.get(CategoriesModel.class, Id);
		s.delete(cm);
		t.commit();
		s.close();

		return null;
	}

	@Override
	public String viewCategory() {

		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		List<CategoriesModel> categorieslist = s.createQuery("from CategoriesModel").list();
		Gson g = new Gson();
		String categorylistgson = g.toJson(categorieslist);
		t.commit();
		s.close();
		//System.out.println(categorylistgson);
		return categorylistgson;
	}

	@Override
	public CategoriesModel viewOneCategory(String id) {
		Session s = sessionFactory.openSession();		
		Transaction t = s.getTransaction();
		t.begin();
		CategoriesModel cm = (CategoriesModel) s.get(CategoriesModel.class, id);
		t.commit();
		s.close();
		Gson g = new Gson();
		String categorygson = g.toJson(cm);
		return  cm;
	}

}
