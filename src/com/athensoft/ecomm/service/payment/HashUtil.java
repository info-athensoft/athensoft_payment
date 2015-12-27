package com.athensoft.ecomm.service.payment;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.athensoft.ecomm.entity.shopping.ItemCart;

public class HashUtil {
	@SuppressWarnings("rawtypes")
	public static void printHashMap(HashMap map){		
		Iterator iter = map.entrySet().iterator(); 
		while (iter.hasNext()) { 
		    Map.Entry entry = (Map.Entry) iter.next(); 
		    Object key = entry.getKey(); 
		    Object val = entry.getValue();
		    System.out.println(key.toString() + " = " + val.toString());
		}
	}
}
