package com.organocart.DAO;

import org.springframework.stereotype.Service;

import com.organocart.model.UserRegCred;
import com.organocart.model.UserRegModel;

@Service
public interface Userservice 
{
	public String acceptUser(UserRegCred u);
	public String insertUser(UserRegModel u);
	public String updateUser(UserRegModel u);
	public String deleteUser(UserRegModel u);
	public String viewUsers(UserRegModel u);
	public UserRegModel viewUser(String s);
	
}
