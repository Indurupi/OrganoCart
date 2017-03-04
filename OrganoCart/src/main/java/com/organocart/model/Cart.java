package com.organocart.model;


public class Cart 
{	
	String pid;
	String pname;
	int qty=1;
	int price;
	int total;

	public Cart(String pid, String pname, int qty, int price, int total) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.qty = qty;
		this.price = price;
		this.total = total;
	}

	public Cart()
	{
	
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	@Override
	public String toString() 
	{
		String s="pid="+pid+"!pname="+pname+"!qty="+qty+"!price="+price+"!total="+total+"!";
		return s;
	}
}