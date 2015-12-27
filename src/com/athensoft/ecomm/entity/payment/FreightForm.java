package com.athensoft.ecomm.entity.payment;

import com.athensoft.ecomm.entity.ship.FreightRule;
import com.athensoft.ecomm.entity.ship.ShipMethod;

public class FreightForm {
	private String shipMethod = ShipMethod.CanadaPost.name();
	private String freightRule = FreightRule.CHARGE.name();	
	private double freightAmount = 0;
	
	

	public String getShipMethod() {
		return shipMethod;
	}

	public void setShipMethod(String shipMethod) {
		this.shipMethod = shipMethod;
	}

	public String getFreightRule() {
		return freightRule;
	}

	public void setFreightRule(String freightRule) {
		this.freightRule = freightRule;
	}

	public double getFreightAmount() {
		return freightAmount;
	}

	public void setFreightAmount(double freightAmount) {
		this.freightAmount = freightAmount;
	}

	public static void main(String[] args){
		System.out.println(ShipMethod.CanadaPost.ordinal());
		System.out.println(ShipMethod.CanadaPost);
		
		System.out.println(FreightRule.CHARGE.ordinal());
		System.out.println(FreightRule.CHARGE);
	}

	@Override
	public String toString() {
		return "FreightForm [shipMethod=" + shipMethod + ", freightRule="
				+ freightRule + ", freightAmount=" + freightAmount + "]";
	}
	

}
