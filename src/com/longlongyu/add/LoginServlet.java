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
		
		String name = request.getParameter("name"); // ��ȡ�û���
		String password = request.getParameter("password"); // ��ȡ����
		try {
      if (user.isExist(name, password)) {// �ж��û��Ƿ����
      	user.updateTime(name);// ���µ�½ʱ��
      	request.getSession().setAttribute("username", name);// Session��¼��Ӧ�û�
        out.print("<script>location.reload();</script>");
	    }else {
	      out.print("��������û�����������������������룡");
	    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}
}
