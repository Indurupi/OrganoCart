package com.organocart.DAO;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.organocart.model.BillingAddressModel;

@Service
public interface BillingAddresDAO {
	
	public String insertBillingAddress(BillingAddressModel billingaddress);
	public String updateBillingAddress(int addressid,BillingAddressModel billingaddress);
	public String deleteBillingAddress(int addressid);
	public String viewBillingAddresses(int cartid);
	public BillingAddressModel viewOneBillingAddress(int bid);
}
