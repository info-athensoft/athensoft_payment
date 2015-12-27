package com.athensoft.ecomm.entity.sale;

public class Coupon {
	private int couponId;
	private String couponCode;
	private int couponType;
	private double couponValue;
	private int couponStatus;
	
	public Coupon(){}
	

	public Coupon(int id, String code, int type, double value, int status){
		this.couponId = id;
		this.couponCode = code;
		this.couponType = type;
		this.couponValue = value;
		this.couponStatus = status;
	}
	
	public static Coupon getCoupon(String couponCode){
		Coupon cp = null;
		if(couponCode.equalsIgnoreCase("abc001")){
			cp = new Coupon(1,couponCode,CouponType.COUPON_PERCENT,50.0,CouponStatus.COUPON_VALID);
		}
		
		if(couponCode.equalsIgnoreCase("abc002")){
			cp = new Coupon(2,couponCode,CouponType.COUPON_AMOUNT,5.0,CouponStatus.COUPON_VALID);
		}
		return cp;
	}
	
	
	
	public int getCouponStatus() {
		return couponStatus;
	}
	public void setCouponStatus(int couponStatus) {
		this.couponStatus = couponStatus;
	}
	public int getCouponId() {
		return couponId;
	}
	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public int getCouponType() {
		return couponType;
	}
	public void setCouponType(int couponType) {
		this.couponType = couponType;
	}
	public double getCouponValue() {
		return couponValue;
	}
	public void setCouponValue(double couponValue) {
		this.couponValue = couponValue;
	}
	
}
