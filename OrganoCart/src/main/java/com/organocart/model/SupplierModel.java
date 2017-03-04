package com.organocart.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class SupplierModel {

	@Id
	String SupplierId;
	
	@Column
	String SupplierName;
	
	@Column
	String SupplierPhone;
	
	@Column
	String SupplierAddress;

	public String getSupplierId() {
		return SupplierId;
	}

	public void setSupplierId(String supplierId) {
		SupplierId = supplierId;
	}

	public String getSupplierName() {
		return SupplierName;
	}

	public void setSupplierName(String supplierName) {
		SupplierName = supplierName;
	}

	public String getSupplierPhone() {
		return SupplierPhone;
	}

	public void setSupplierPhone(String supplierPhone) {
		SupplierPhone = supplierPhone;
	}

	public String getSupplierAddress() {
		return SupplierAddress;
	}

	public void setSupplierAddress(String supplierAddress) {
		SupplierAddress = supplierAddress;
	}
}
