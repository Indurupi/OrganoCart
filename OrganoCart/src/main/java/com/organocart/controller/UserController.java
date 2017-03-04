 package com.organocart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.organocart.DAO.Userservice;
import com.organocart.model.UserRegCred;
import com.organocart.model.UserRegModel;

@Controller
public class UserController 
{
	@Autowired
	Userservice us;
	
	
	@RequestMapping("/Signup")
	public ModelAndView signUpPage()
	{
		ModelAndView mv=new ModelAndView("Signup");
		mv.addObject("urm",new UserRegModel());
		return  mv;
	}
	
	@RequestMapping("/reguser")
	public ModelAndView reguser(@ModelAttribute("urm")UserRegModel urm1)
	{
		String result = us.insertUser(urm1);
		
		if(result.equalsIgnoreCase("success"))
		{
			ModelAndView mv=new ModelAndView("Login");
			mv.addObject(result, "success");
            return mv;
		}
		else
		{
			ModelAndView mv=new ModelAndView("Signup");
			mv.addObject(result, "fail");
			return mv;
		}	
	}
}
