package com.longlongyu.add;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class BlogListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// 获取得到Context对象，使用Context域对象保存用户在线的个数
		ServletContext context = arg0.getSession().getServletContext();

		Integer num = (Integer) context.getAttribute("num");
		if (num == null) {
			context.setAttribute("num", 1);
		} else {
			num++;
			context.setAttribute("num", num);
		}

		System.out.println("--> session 创建 ID :" + arg0.getSession().getId());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// 获取得到Context对象，使用Context域对象保存用户在线的个数
		ServletContext context = arg0.getSession().getServletContext();

		Integer num = (Integer) arg0.getSession().getAttribute("num");
		if (num == null) {
			context.setAttribute("num", 1);
		} else {
			num--;
			context.setAttribute("num", num);
		}
		System.out.println("--> session 注销 ID :" + arg0.getSession().getId());
	}

}
