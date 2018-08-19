package com.longlongyu.data;

import java.util.regex.Pattern;

/**
 * ������֤��
 */
public class DataValidator {
	/**
	 * ��֤�ַ����Ƿ�Ϊ��
	 */
	public static boolean isNullOrEmpty(String input) {
		return "".equals(input) || input == null;
	}

	/**
	 * ƥ��������ʽ
	 * 
	 * @param input--->��Ҫ����ƥ����ַ���
	 * @param pattern--->������ʽ
	 * @return
	 */
	public static boolean regexMatch(String input, String pattern) {
		if (isNullOrEmpty(input)) {
			return false;
		}
		return Pattern.compile(pattern).matcher(input).matches();
	}

}
