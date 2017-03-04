package com.organocart.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.organocart.DAO.ProductDAO;
import com.organocart.model.ProductModel;
import com.organocart.model.SupplierModel;

@Repository
public class ProductDAOImpl implements ProductDAO{

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public String insertProduct(ProductModel pm) {
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		s.save(pm);
		t.commit();
		s.close();
		return null;
	}

	@Override
	public String updateProduct(String product_id,ProductModel pm) {
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		ProductModel oneproductobject = (ProductModel)s.get(ProductModel.class,product_id);
		oneproductobject.setCategoryId(pm.getCategoryId());
		oneproductobject.setSupplierId(pm.getSupplierId());
		oneproductobject.setProductDescription(pm.getProductDescription());
		oneproductobject.setProductName(pm.getProductName());
		oneproductobject.setProductPrice(pm.getProductPrice());
		oneproductobject.setProductStock(pm.getProductStock());
		s.update(oneproductobject);
		t.commit();
		s.close();
		return null;
	}

	@Override
	public String deleteProduct(String productid) {
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		ProductModel pm =  (ProductModel)s.get(ProductModel.class, productid);
		s.delete(pm);
		t.commit();
		s.close();
		return null;
	}

	@Override
	public String viewProduct() {
		
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		List<ProductModel> productslist = s.createQuery("from ProductModel").list();
		Gson g = new Gson();
		String productslistgson = g.toJson(productslist);
		t.commit();
		s.close();
		return productslistgson;
		
	}

	@Override
	public ProductModel viewOneProduct(String productid) {
		
		Session s = sessionFactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		ProductModel pm =  (ProductModel)s.get(ProductModel.class, productid);
		t.commit();
		s.close();
		return pm;
	}

}
