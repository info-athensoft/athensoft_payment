package com.athensoft.util.number;

import java.text.DecimalFormat;

public class FinancialNumFormat {
	public static String formatDoubleString(double d) {
		DecimalFormat df = new DecimalFormat("#.00");
		return df.format(d);
	}
	
	public static String formatDoubleString(String s) {
		DecimalFormat df = new DecimalFormat("#.00");
		return df.format(Double.parseDouble(s));
	}
	
	public static double formatDoubleValue(double d) {
		DecimalFormat df = new DecimalFormat("#.00");
		return Double.parseDouble(df.format(d));
	}
	
	public static double formatDoubleValue(String s) {
		DecimalFormat df = new DecimalFormat("#.00");
		return  Double.parseDouble(df.format(Double.parseDouble(s)));
	}
	
	public static void main(String[] args){
		System.out.println(formatDoubleValue("15.275"));
	}
	
}
