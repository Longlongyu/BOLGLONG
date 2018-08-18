package com.longlongyu.add;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet.
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request  the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException      if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		this.doPost(request, response);
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request  the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException      if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf8");
		request.setCharacterEncoding("utf8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name"); // 获取用户名
		String password = request.getParameter("password"); // 获取密码
		Connection conn = null; // 声明一个Connection对象，用来连接数据库
		PreparedStatement pstmt = null; // 声明PreparedStatement对象，用来向数据库插入数据条数据
		ResultSet rs = null;
		try {
			// 连接到MySQL数据库中的bank数据库模式
			Class.forName("com.mysql.jdbc.Driver");
			// 连接数据库
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?serverTimezone=UTC", "root", "123456");
			String sql = "SELECT * FROM user WHERE u_name = ? and password = ?";
			
			pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, name);
      pstmt.setString(2, password);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        out.print("登陆成功！");
	    }else {
	      out.print("你输入的用户名或者密码错误！请重新输入！");
	    }
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}
