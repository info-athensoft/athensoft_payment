package com.athensoft.ecomm.dao.shopping;

import java.util.List;

import com.athensoft.ecomm.entity.shopping.ItemCart;

public interface ItemCartDao {
	
	public List<ItemCart> findAll();
	
	public ItemCart findItemCartById(int itemId);


}
