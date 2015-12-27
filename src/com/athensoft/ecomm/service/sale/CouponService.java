package com.athensoft.ecomm.service.sale;

import org.springframework.stereotype.Service;

import com.athensoft.ecomm.entity.sale.Coupon;

@Service
public class CouponService {
	public Coupon getCouponByCode(String couponCode){
		Coupon cpn = Coupon.getCoupon(couponCode);		
		return cpn;
	}
}
