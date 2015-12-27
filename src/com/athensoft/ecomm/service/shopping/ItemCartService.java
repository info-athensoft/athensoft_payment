package com.athensoft.ecomm.service.shopping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.athensoft.ecomm.dao.shopping.ItemCartDao;
import com.athensoft.ecomm.entity.shopping.ItemCart;

@Service
public class ItemCartService {
	private ItemCartDao itemCartDao;
	
	@Autowired
	@Qualifier("itemCartDaoParam")
	public void setItemCartDao(ItemCartDao itemCartDao) {
		this.itemCartDao = itemCartDao;
	}
	
	public List<ItemCart> getItemCartList(){
		List<ItemCart> list = itemCartDao.findAll();
		return list;
	}
	
	public ItemCart getItemCartEntry(int itemId){
		ItemCart itemCart = itemCartDao.findItemCartById(itemId);
		return itemCart;
	}
	
}
