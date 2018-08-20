package com.longlongyu.data;

public class BlogUtil {
	/**
	 * ½ØÈ¡×Ö·û´®
	 */
	public static String Substring(String input,int len){
		if(DataValidator.isNullOrEmpty(input))
			return "";
		if(len>=input.length())
			return input;
		return input.substring(0,len) + "...";
	}
}
