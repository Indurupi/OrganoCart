package com.organocart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.organocart.DAO.CategoriesDAO;
import com.organocart.model.CategoriesModel;

@Controller
public class CategoryController 
{

	@Autowired
	CategoriesDAO cdao;

	@RequestMapping("/showingcategorypage")
	public ModelAndView showcatpage() {
		String categorygsonlist = cdao.viewCategory();
		ModelAndView mv = new ModelAndView("AddCategory", "addCategoryObject1", new CategoriesModel());
		mv.addObject("categorymodelobject", categorygsonlist);
		mv.addObject("check","true");
		return mv;
	}

	@RequestMapping(value="/addingcategory", params="Addcategory")
	public String addcategory(@ModelAttribute("addCategoryObject1") CategoriesModel cm) {
		//String categorygsonlist = cdao.viewCategory();
		//ModelAndView mv =new ModelAndView("AddCategory");
		cdao.insertCategory(cm);
		//mv.addObject("categorymodelobject", categorygsonlist);
		return "redirect:/showingcategorypage";
	}
	
	@RequestMapping(value="/addingcategory", params="EditCategory")
	public String editcategory(@ModelAttribute("addCategoryObject1") CategoriesModel cm) {
		
		//ModelAndView mv =new ModelAndView("AddCategory");
		cdao.updateCategory(cm);
		return "redirect:/showingcategorypage";
	}
	

	@RequestMapping("removecategory/{Id}")
	public String removecategory(@PathVariable("Id") String categoryId) {
		cdao.deleteCategory(categoryId);
		return "redirect:/showingcategorypage";
	}

	@RequestMapping("/editcategorybutton")
	public ModelAndView passingonecategory(@RequestParam("getcid") String categoryId) {
		
		CategoriesModel onecategory = cdao.viewOneCategory(categoryId);	
		String categorygsonlist = cdao.viewCategory();
		ModelAndView mv = new ModelAndView("AddCategory","addCategoryObject1",onecategory);
		mv.addObject("categorymodelobject", categorygsonlist);
		mv.addObject("check","false");
		return mv;
	}

}
