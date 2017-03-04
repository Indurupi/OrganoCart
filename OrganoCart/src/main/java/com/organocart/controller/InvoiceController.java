package com.organocart.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.organocart.DAO.BillingAddresDAO;
import com.organocart.DAO.CartDAOServices;
import com.organocart.model.BillingAddressModel;
import com.organocart.model.Cart;
import com.organocart.model.UserCartDetails;

@Controller
public class InvoiceController {

	@Autowired
	BillingAddresDAO bdao;
	
	@Autowired
	CartDAOServices cartdao;

	@Autowired
	private JavaMailSender mailsender;

	@RequestMapping("/generatinginvoice")
	public ModelAndView showingReceipt(@RequestParam("getaddressid") int addressid, HttpSession httpSession) {
		BillingAddressModel bm = (BillingAddressModel) bdao.viewOneBillingAddress(addressid);
		ArrayList<Cart> c = (ArrayList<Cart>) httpSession.getAttribute("usercart");
		Gson g = new Gson();
		String cartgson = g.toJson(c);
		String addressgson = g.toJson(bm);
		String currentDateTimeString = DateFormat.getDateTimeInstance().format(new Date());
		System.out.println("this is date  "+currentDateTimeString);
		
		ModelAndView mv = new ModelAndView("Invoice");
		mv.addObject("addressobject", addressgson);
		mv.addObject("itemsincart", cartgson);
		mv.addObject("bill", "true");
		httpSession.setAttribute("addressid", addressid);
		httpSession.setAttribute("Date", currentDateTimeString);
		//c.removeAll(c);
		UserCartDetails cd = new UserCartDetails();
		int cartid = (int) httpSession.getAttribute("Cartid");
		
		cd.setCartid((Integer.parseInt(httpSession.getAttribute("Cartid").toString())));
		cd.setProductsincart(c.toString());
		cd.setStatus("Ordered");
		cartdao.updateCartWithProducts(cd);
		httpSession.setAttribute("usercart", c);
		httpSession.setAttribute("grandquantity", 0);
		return mv;
	}

	@RequestMapping("/emailingreceipt")
	public ModelAndView emailingReceipt(@RequestParam("email") String emailid, HttpSession httpSession) {

		ModelAndView mv = new ModelAndView("Invoice");
		try {
			String recipientAddress = emailid;
			int addressid = (int) httpSession.getAttribute("addressid");
			BillingAddressModel bm = (BillingAddressModel) bdao.viewOneBillingAddress(addressid);

			String username = (String) httpSession.getAttribute("UserLoggedIn");
			Integer totalprice = (Integer) httpSession.getAttribute("grandtotal");
			String total = totalprice.toString();
			String billingaddress = "\n Your Orders will be shipped to below address \n \n \t " + bm.getAddressLine1() +", \n \t"+bm.getAddressLine2() + ", \n \t "+ bm.getCity() +", \n \t Pincode:"+bm.getPincode()+". \n \t Contact Number :"+bm.getPhoneNumber();
			String finalInvoice = "\n Hi " + username + ","
					+ "\n \n \n This email is regarding your purchase From ORGANOCART and thus your Order Is Confirmed. \n \n And we also would like to inform you the payments of the goods for the"
					+ " products has to be done through cash.\n \n The total Amount to be paid is Rs. " + total
					+"\n \n The above items will be delivered within 5 Workingdays.\n"+billingaddress+ " \n \n For more information please feel free to contact\n \n \n Regards \n Organocart, \n Organocart@gmail.com \n or \n rupi0192@gmail.com";
			System.out.println(finalInvoice);
			SimpleMailMessage email = new SimpleMailMessage();
			email.setTo(recipientAddress);
			email.setSubject("Organocart - Order Confirmation Details and Invoice");
			email.setText(finalInvoice);
			mailsender.send(email);
			mv.addObject("success", "true");
			mv.addObject("bill", "false");

		}

		catch (Exception x) {
			System.out.println(x);
			mv.addObject("success", "fail");
			mv.addObject("bill", "false");

		}
		return mv;
	}

}
