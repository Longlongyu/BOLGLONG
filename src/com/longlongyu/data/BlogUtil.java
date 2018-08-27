package com.longlongyu.data;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BlogUtil {
	/**
	 * ½ØÈ¡×Ö·û´®
	 */
	public static String Substring(String input,int len){
		if(DataValidator.isNullOrEmpty(input))
			return "";
		if(len>=input.length())
			return input;
		if(input.indexOf("<!--more-->") != -1){
			Pattern p = Pattern.compile(".*<!--more-->", Pattern.DOTALL);
	    Matcher m = p.matcher(input);
	    String str = "";
	    while(m.find()){
	    	str = m.group();
	    	break;
	    }
			return str;
		}
		return input.substring(0,len) + "...";
	}
	
	/**
	 * ½ØÈ¡Ê××ÖÄ¸²¢´óĞ´
	 */
	public static String upperCase(String str) {
		return str.substring(0, 1).toUpperCase();
	}
}
