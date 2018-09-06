package com.longlongyu.add;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.longlongyu.dal.User;

/**
 * Servlet implementation class Proof
 */
@WebServlet("/Proof")
public class Proof extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 正则表达式：验证用户名
	final String REGEX_USERNAME = "^[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9_\u4e00-\u9fa5]{4,20}$";
	User user = new User();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Proof() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf8");
    request.setCharacterEncoding("utf8");
    PrintWriter out = response.getWriter();
    
    String name = request.getParameter("name");          // 获取用户名
    try {
			if (user.isExistUsersInfo(name)) {                 // 判断用户是否存在
				out.print("已存在！");
			} else if (!Pattern.matches(REGEX_USERNAME, name)) {
				out.print("非法！");
			} else {
				out.print("right");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
