package com.organocart.controller;

import java.net.UnknownHostException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.organocart.model.UserRegCred;

import org.springframework.mail.*;
import org.springframework.mail.javamail.JavaMailSender;


@Controller
public class SendEmailController
{
	@Autowired
	private JavaMailSender mailsender;
	
	@ModelAttribute
	public void adduser(Model mv)
	{
		mv.addAttribute("user", new UserRegCred());
	}
	
	@RequestMapping("/sendEmail")
	public ModelAndView sendEmail(@PathVariable Map<String, String> mdetail) throws UnknownHostException {

		ModelAndView mv=new ModelAndView("Contactus");
		try 
		{
			// takes input from e-mail form
			String recipientAddress = "indu795@gmail.com";
			String fname = mdetail.get("username");
			String emailid = mdetail.get("emailid");
			String phno=mdetail.get("phonenumber");
			String subject = "Contact Request";
			String message = mdetail.get("feedback");
			String finalmessage = "Hi  Admin,\n" + message+"Regards\n"+fname+"\n"+phno+"\n"+emailid;
			System.out.println(finalmessage);
			SimpleMailMessage email = new SimpleMailMessage();
			email.setTo(recipientAddress);
			email.setSubject(subject);
			email.setText(finalmessage);
			mailsender.send(email);
			mv.addObject("success", "Mail Sent Successfully :) We value your opinions and feedback !!!Stay in touch");
			
			// forwards to the view named "Result"
		} catch (Exception x) 
		{
			System.out.println(x);
			mv.addObject("fail", "Sorry, Mail can't be sent Please try later or try this option ");
		}
		return mv;
	}

}
