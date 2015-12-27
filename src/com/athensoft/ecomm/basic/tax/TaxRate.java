package com.athensoft.ecomm.basic.tax;

public interface TaxRate {
	public double getTotalTaxRate(int provinceId);
	public double getGST(int provinceId);
	public double getQST(int provinceId);
	public double getHST(int provinceId);
	public double getPST(int provinceId);
}
