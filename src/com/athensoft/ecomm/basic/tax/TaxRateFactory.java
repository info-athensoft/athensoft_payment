package com.athensoft.ecomm.basic.tax;

import com.athensoft.ecomm.basic.geo.ProvinceCA;

public class TaxRateFactory {
	private static TaxRate taxRate;
	public static TaxRate getTaxRate(String countryCode){
		
		if(countryCode.equalsIgnoreCase("CA")){
			taxRate = new TaxRate_CA();
		}
		
		return taxRate;
	}
	
	public static void main(String[] args){
		TaxRate tr = TaxRateFactory.getTaxRate("CA");
		System.out.println(tr.getTotalTaxRate(ProvinceCA.QUEBEC));
	}
}
