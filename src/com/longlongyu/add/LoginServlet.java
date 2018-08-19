package com.longlongyu.add;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.longlongyu.dal.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	User user = new User();
	
	/**
   * @see HttpServlet#HttpServlet()
   */
  public LoginServlet() {
      super();
      // TODO Auto-generated constructor stub
  }
  
  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doPost(request, response);
  }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name"); // 获取用户名
		String password = request.getParameter("password"); // 获取密码
		try {
      if (user.isExist(name, password)) {// 判断用户是否存在
      	user.updateTime(name);// 更新登陆时间
      	request.getSession().setAttribute("username", name);// Session记录对应用户
        out.print("<script>location.reload();</script>");
	    }else {
	      out.print("你输入的用户名或者密码错误！请重新输入！");
	    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}
}
