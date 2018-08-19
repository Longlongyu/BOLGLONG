package com.longlongyu.add;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class BlogListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// ��ȡ�õ�Context����ʹ��Context����󱣴��û����ߵĸ���
		ServletContext context = arg0.getSession().getServletContext();

		Integer num = (Integer) context.getAttribute("num");
		if (num == null) {
			context.setAttribute("num", 1);
		} else {
			num++;
			context.setAttribute("num", num);
		}

		System.out.println("--> session ���� ID :" + arg0.getSession().getId());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// ��ȡ�õ�Context����ʹ��Context����󱣴��û����ߵĸ���
		ServletContext context = arg0.getSession().getServletContext();

		Integer num = (Integer) arg0.getSession().getAttribute("num");
		if (num == null) {
			context.setAttribute("num", 1);
		} else {
			num--;
			context.setAttribute("num", num);
		}
		System.out.println("--> session ע�� ID :" + arg0.getSession().getId());
	}

}
