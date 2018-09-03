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

import com.longlongyu.Info.Userinfo;
import com.longlongyu.dal.User;

/**
 * Servlet implementation class SigninServlet
 */
@WebServlet("/SigninServlet")
public class SigninServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 正则表达式：验证用户名
  final String REGEX_USERNAME = "^[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9_\u4e00-\u9fa5]{4,20}$";
  //正则表达式：验证密码
  final String REGEX_PASSWORD = "^[a-zA-Z0-9*_+-]{6,20}$";
  //正则表达式：验证邮箱
  final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";

	User user = new User();
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SigninServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
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
		String password = request.getParameter("password");  // 获取密码
		String email = request.getParameter("email");        // 获取邮箱
		
		try {
			if (user.isExistUsersInfo(name)) {                 // 判断用户是否存在
				out.print("该用户已存在！请重新输入！");
			} else {
				int count = 0;
		    if (!Pattern.matches(REGEX_USERNAME, name)) {
		    	out.println("用户名");
		    	count++;
		    }
		    if (!Pattern.matches(REGEX_PASSWORD, password)) {
		    	out.println(" 密码");
		    	count++;
		    }
		    if (!Pattern.matches(REGEX_EMAIL, email)) {   // 判断输入合法性
		      out.println(" 邮箱");
		      count++;
		    }
		    if (count == 0) {
		    	Userinfo info = new Userinfo();
	  			info.setUsername(name);
	  			info.setPassword(password);
	  			info.setEmail(email);
	  			user.insert(info);                             // 插入数据
	  			
	  			out.print("注册成功！即将自动登陆！");
	  			
	  			user.updateTime(name);                              // 自动登陆
	      	request.getSession().setAttribute("username", name);// Session记录对应用户
	        out.print("<script>setTimeout('location.reload();', 1000)</script>");
		    } else {
		    	out.println("不符合要求！请重新输入！");
		    }
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
