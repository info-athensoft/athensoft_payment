package com.athensoft.ecomm.entity.ship;

public enum FreightRule {
	FREE("free",0), CHARGE("charge",1);
	
	private String name;
	private int index;
	
	private FreightRule(String name, int index){
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
