package com.organocart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.organocart.DAO.SupplierDAO;
import com.organocart.model.SupplierModel;

@Controller
public class SupplierController {

	@Autowired
	SupplierDAO sdao;
	
	@RequestMapping("/showsupplier")
	public ModelAndView showsupplierpage()
	{
		String supplierslist = sdao.viewSupplier();
		//System.out.println("this is "+ supplierslist);
		ModelAndView mv = new ModelAndView("AddSupplier","newSupplierObject", new SupplierModel());		
		mv.addObject("supplierslist",supplierslist);
		mv.addObject("check","true");
		return mv;
	}
	
	@RequestMapping(value="/addingsupplier", params="Addingsupplier")
	public String addsupplierpage(@ModelAttribute("newSupplierObject")SupplierModel supplier)
	{
		sdao.insertSupplier(supplier);
		return "redirect:/showsupplier";
		
	}
	
	@RequestMapping(value="/addingsupplier",params="EditingSupplier")
	public String editsupplierpage(@ModelAttribute("newSupplierObject")SupplierModel supplier)
	{
		sdao.updateSupplier(supplier);
		return "redirect:/showsupplier";
		
	}
	
	@RequestMapping("removingsupplier/{supplierId}")
	public String removecategory(@PathVariable("supplierId") String supplierid) {
		sdao.deleteSupplier(supplierid);
		return "redirect:/showsupplier";
	}
	
	@RequestMapping("/editingsupplierbutton")
	public ModelAndView editsupplierbutton(@RequestParam("getsupplierid")String supplierid)
	{
		SupplierModel onesupplier = sdao.viewOneSupplier(supplierid);
		
		ModelAndView mv= new ModelAndView("AddSupplier","newSupplierObject",onesupplier);
		String suppliergsonlist = sdao.viewSupplier();
		mv.addObject("supplierslist",suppliergsonlist);
		mv.addObject("check","false");
		return mv;
	}
}
