package com.athensoft.ecomm.entity.shopping;

import java.io.Serializable;

public class ItemCart implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 941881484628317470L;
	private long itemId ;
	private String itemCode;
	private String itemName;
	private String itemDesc;
	private double price;
	private int qty;
	
//	private double amount;
	
	public ItemCart(){
		
	}
	
	public ItemCart(int itemId,String itemName, String itemDesc, double price, int qty){
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemDesc = itemDesc;
		this.price = price;
		this.qty = qty;
	}
	
	
	
	public long getItemId() {
		return itemId;
	}
	public void setItemId(long itemId) {
		this.itemId = itemId;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	
	@Override
	public String toString() {
		return "ItemCart [itemId=" + itemId + ", itemCode=" + itemCode
				+ ", itemName=" + itemName + ", itemDesc=" + itemDesc
				+ ", price=" + price + ", qty=" + qty + "]";
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	

	
	
	
}
