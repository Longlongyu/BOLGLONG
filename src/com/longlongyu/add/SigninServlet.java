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
	
	/**
   * ������ʽ����֤�û���
   */
  final String REGEX_USERNAME = "^[A-Za-z][A-Za-z1-9_]{6,20}$";
  /**
   * ������ʽ����֤����
   */
  final String REGEX_PASSWORD = "^[a-zA-Z0-9]{6,20}$";
  /**
   * ������ʽ����֤����
   */
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
    
    String name = request.getParameter("name"); // ��ȡ�û���
		String password = request.getParameter("password"); // ��ȡ����
		String email = request.getParameter("email"); // ��ȡ����
		
		try {
			if (user.isExistUsersInfo(name)) {
				out.print("���û��Ѵ��ڣ����������룡");// �ж��û��Ƿ����
			} else {
		    if (Pattern.matches(REGEX_USERNAME, name) 
		    		&& Pattern.matches(REGEX_PASSWORD, password) 
		    		&& Pattern.matches(REGEX_EMAIL, email)) {// �ж�����Ϸ���
	      	Userinfo info = new Userinfo();
	  			info.setUsername(name);
	  			info.setPassword(password);
	  			info.setEmail(email);
	  			user.insert(info);
	  			out.print("ע��ɹ��������Զ���½��");
	  			
	  			user.updateTime(name);// �Զ���½
	      	request.getSession().setAttribute("username", name);// Session��¼��Ӧ�û�
	        out.print("<script>setTimeout('location.reload();', 1000)</script>");
		    } else {
		      out.print("����������������룡");
		    }
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
		// doGet(request, response);
	}

}
