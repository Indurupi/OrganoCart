package com.organocart.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.organocart.DAO.CategoriesDAO;
import com.organocart.DAO.ProductDAO;
import com.organocart.DAO.SupplierDAO;
import com.organocart.model.ProductModel;

@Controller
public class ProductController {

	@Autowired
	ProductDAO pdao;

	@Autowired
	SupplierDAO sdao;

	@Autowired
	CategoriesDAO cdao;

	@RequestMapping("/showproductpage")
	public ModelAndView showproductpage() {
		String productlist = pdao.viewProduct();
		String categorygsonlist = cdao.viewCategory();
		String supplierslist = sdao.viewSupplier();

		ModelAndView mv = new ModelAndView("AddProduct", "newProductObject", new ProductModel());
		mv.addObject("productlist", productlist);
		mv.addObject("supplierslist", supplierslist);
		mv.addObject("categorymodelobject", categorygsonlist);
		mv.addObject("check", "true");
		return mv;
	}

	@RequestMapping(value = "/addproduct", params = "Add")
	public String addproductpage(@ModelAttribute("newProductObject") ProductModel product) {
		pdao.insertProduct(product);
		String path = "D:\\New Workspace\\OrganoCart\\src\\main\\webapp\\resources\\Pimage\\";
		path = path + String.valueOf(product.getProductId()) + "" + ".jpg";
		MultipartFile filedet = product.getPImage();
		if (!filedet.isEmpty()) {
			try {
				byte[] bytes = filedet.getBytes();
				System.out.println(bytes.length);
				FileOutputStream fos = new FileOutputStream(new File(path));
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(bytes);
				bs.close();	fos.close();
				Thread.sleep(10000);
				System.out.println("File Uploaded Successfully");
			} catch (Exception e) {
				System.out.println("Exception Arised" + e);
			}	} else {
			System.out.println("File is Empty not Uploaded");
		}	return "redirect:/showproductpage";
	}

	@RequestMapping(value = "/addproduct", params = "Edit")
	public String editProduct(@ModelAttribute("newProductObject") ProductModel product) {
		pdao.updateProduct(product.getProductId(), product);
		String path = "D:\\New Workspace\\OrganoCart\\src\\main\\webapp\\resources\\Pimage\\";
		path = path + String.valueOf(product.getProductId()) + "" + ".jpg";
		MultipartFile filedet = product.getPImage();
		if (!filedet.isEmpty()) {
			try {
				byte[] bytes = filedet.getBytes();
				System.out.println(bytes.length);
				File f = new File(path);
				if (f.exists()) 
				{
					f.delete();
					FileOutputStream fos = new FileOutputStream(f);
					BufferedOutputStream bs = new BufferedOutputStream(fos);
					bs.write(bytes);
					bs.close();
					fos.close();
					Thread.sleep(10000);
					System.out.println("File Uploaded Successfully");
				}
			} catch (Exception e) {
				System.out.println("Exception Arised" + e);
			}
		} else {
			System.out.println("File is Empty not Uploaded");
		}
		return "redirect:/showproductpage";
	}

	@RequestMapping("removingproduct/{productId}")
	public String removeproduct(@PathVariable("productId") String productid) {
		pdao.deleteProduct(productid);
		return "redirect:/showproductpage";
	}

	@RequestMapping("/viewproduct")
	public ModelAndView viewproductdata(@RequestParam("getId") String productid,HttpSession session) {
		Gson g = new Gson();
		String productdata = g.toJson(pdao.viewOneProduct(productid));
		//session.setAttribute("productid", productid);
		ModelAndView mv = new ModelAndView("prodescription");
		mv.addObject("pro", productdata);
		return mv;
	}

	@RequestMapping("/buyproductpage")
	public ModelAndView viewproductpage() {
		String productlist = pdao.viewProduct();
		ModelAndView mv = new ModelAndView("viewproduct");
		mv.addObject("productlist", productlist);
		return mv;
	}

	@RequestMapping("/editingproduct")
	public ModelAndView editproductpage(@RequestParam("getpid") String pid)
	{
		String categorygsonlist = cdao.viewCategory();
		String supplierslist = sdao.viewSupplier();
		String productlist = pdao.viewProduct();
		ModelAndView mv = new ModelAndView("AddProduct", "newProductObject", pdao.viewOneProduct(pid));
		mv.addObject("productlist", productlist);
		mv.addObject("supplierslist", supplierslist);
		mv.addObject("categorymodelobject", categorygsonlist);
		mv.addObject("check", "false");
		return mv;
	}
}
