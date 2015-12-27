package com.athensoft.ecomm.entity.ship;

public enum ShipMethod {
	PickUp("pickup",0), CanadaPost("canadapost",1), UPS("ups",2), FedEx("fedex",3), DHL("dhl",4);
	
	private String name;
	private int index;
	
	private ShipMethod(String name, int index){
		this.name = name;
		this.index = index;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
	
}
