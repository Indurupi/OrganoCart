package com.organocart.DAO;

import org.springframework.stereotype.Service;
import com.organocart.model.CategoriesModel;


@Service
public interface CategoriesDAO {

	public String insertCategory(CategoriesModel cm);
	public String updateCategory(CategoriesModel cm);
	public String deleteCategory(String id);
	public String viewCategory();
	public CategoriesModel viewOneCategory(String id);

}
