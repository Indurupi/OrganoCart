package com.organocart.DAO;

import org.springframework.stereotype.Service;
import com.organocart.model.SupplierModel;

@Service
public interface SupplierDAO {

	public String insertSupplier(SupplierModel sm);
	public String updateSupplier(SupplierModel sm);
	public String deleteSupplier(String id);
	public String viewSupplier();
	public SupplierModel viewOneSupplier(String id);
}
