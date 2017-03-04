package com.organocart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.organocart.DAO.BillingAddresDAO;
import com.organocart.DAO.Userservice;
import com.organocart.model.BillingAddressModel;
import com.organocart.model.UserRegModel;

@Controller
public class AddressController {
	
	@Autowired
	BillingAddresDAO bdao;
	
	@Autowired
	Userservice us;

	@RequestMapping("/billingaddresspage")
	public ModelAndView billingaddressPage(HttpSession httpSession)
	{

		int cartid = (int) httpSession.getAttribute("Cartid");
		
		String addressesjson=bdao.viewBillingAddresses(cartid);
		
		String email = (String) httpSession.getAttribute("UserId");
		UserRegModel urm = us.viewUser(email);
		BillingAddressModel bm = new BillingAddressModel();
		bm.setUserName(urm.getUsername());
		bm.setCartId(cartid);
		
		ModelAndView mv = new ModelAndView("BillingAddress","billingAddressObj",bm);
		mv.addObject("addressesjson",addressesjson);
		httpSession.setAttribute("newobj","true" );
		return mv;
	}
	
	@RequestMapping(value = "/addnewaddress", params="addnew")
	public String addnewaddress(@ModelAttribute("billingAddressObj")BillingAddressModel billingaddress,HttpSession httpSession)
	{
		int cartid = (int) httpSession.getAttribute("Cartid");
		String email = (String) httpSession.getAttribute("UserId");
		UserRegModel urm = us.viewUser(email);
		billingaddress.setUserName(urm.getUsername());
		billingaddress.setCartId(cartid);
		bdao.insertBillingAddress(billingaddress);
		httpSession.setAttribute("newobj","false" );
		return "redirect:/billingaddresspage";
	}
	
	@RequestMapping("/editaddress")
	public ModelAndView showeditaddresspage(@RequestParam("getaddressid")int addressid,HttpSession httpSession)
	{
		int cartid = (int) httpSession.getAttribute("Cartid");
		System.out.println("address id is"+addressid);
		String addressesjson=bdao.viewBillingAddresses(cartid);
		
		BillingAddressModel bm = (BillingAddressModel)bdao.viewOneBillingAddress(addressid);
		System.out.println("this is address line 1 "+bm.getAddressLine1());
		System.out.println("this is address line 2 "+bm.getAddressLine2());
		System.out.println("this is user "+bm.getUserName());

		ModelAndView mv = new ModelAndView("BillingAddress");
		mv.addObject("billingAddressObj",bm);
		mv.addObject("addressesjson",addressesjson);
		httpSession.setAttribute("newobj","false" );
		return mv;
	}
	
	@RequestMapping(value= "/addnewaddress", params="edit")
	public String editingaddress(@ModelAttribute("billingAddressObj")BillingAddressModel billingaddress,HttpSession httpSession)
	{
		int cartid = (int) httpSession.getAttribute("Cartid");
		String email = (String) httpSession.getAttribute("UserId");
		UserRegModel urm = us.viewUser(email);
		billingaddress.setUserName(urm.getUsername());
		billingaddress.setCartId(cartid);
		int billingaddresid = billingaddress.getAddressId();
		bdao.updateBillingAddress(billingaddresid, billingaddress);
		httpSession.setAttribute("newobj","false" );
		return "redirect:/billingaddresspage";
	}
	
	@RequestMapping("/removeaddress")
	public String removeaddress(@RequestParam("getaddressid")int addressid,HttpSession httpSession)
	{
		
		bdao.deleteBillingAddress(addressid);
		httpSession.setAttribute("newobj","false" );
		return "redirect:/billingaddresspage";
	}
	
}
