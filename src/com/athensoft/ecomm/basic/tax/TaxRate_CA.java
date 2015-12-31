package com.athensoft.ecomm.basic.tax;

import com.athensoft.ecomm.basic.geo.ProvinceCA;

public class TaxRate_CA implements TaxRate{

//	private Province prov = new ProvinceCA();
	
	private double totalTaxRate = 0;
	
	@Override
	public double getTotalTaxRate(int provinceId) {
		switch(provinceId){
			case ProvinceCA.QUEBEC:  
				this.totalTaxRate = getGST(provinceId)+getQST(provinceId);
				break;
			case ProvinceCA.ONTARIO:  
				this.totalTaxRate = getHST(provinceId);
				break;
			default:
				break;
		}
		
		return this.totalTaxRate;
	}
	
	@Override
	public double getHST(int provinceId){
		double HST = 0;
		switch(provinceId){
		case ProvinceCA.ONTARIO:  
			HST = 0.13;
			break;
		default:
			break;
	}
		return HST;
	}
	
	@Override
	public double getGST(int provinceId){
		double GST = 0;
		switch(provinceId){
		case ProvinceCA.QUEBEC:  
			GST = 0.05;
			break;
		default:
			break;
		}
		return GST;
	}
	
	@Override
	public double getPST(int provinceId){
		return 0;
	}
	
	@Override
	public double getQST(int provinceId){
		double QST = 0;
		switch(provinceId){
		case ProvinceCA.QUEBEC:  
			QST = 0.09975;
			break;
		default:
			break;
		}
		return QST;
	}
	
	public static void main (String[] args){
		TaxRate tax = new TaxRate_CA();
		double tx = tax.getTotalTaxRate(ProvinceCA.QUEBEC);
		System.out.println(tx);
	}

}
