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

import com.longlongyu.Info.PostInfo;
import com.longlongyu.dal.Post;
import com.longlongyu.dal.User;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
   * ������ʽ����֤����
   */
  final String REGEX_TITLE = "^.{1,50}$";
  
  Post post = new Post();
  User user = new User();
  /**
   * @see HttpServlet#HttpServlet()
   */
  public EditServlet() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf8");
    request.setCharacterEncoding("utf8");
    PrintWriter out = response.getWriter();
    
    String username = request.getParameter("username");  // ��ȡ���Ĳ����û�
    int id = Integer.parseInt(request.getParameter("id")); // ��ȡ����id
    String title = request.getParameter("title"); // ��ȡ����
		String content = request.getParameter("content"); // ��ȡ����
		
		try {
			if (!user.isExistUsersInfo(username)) {
				out.print("�û���δʶ�����½��ע������ԣ�");
			} else if (Pattern.matches(REGEX_TITLE, title)) {
				PostInfo info = new PostInfo();
				info.setTitle(title);
				info.setContent(content);
				if (id == 0) {
					System.out.println(username);
					int u_id = user.getUserinfo(username).getUserid();
					info.setAuthorId(u_id);
					post.insert(info);
				} else {
					info.setId(id);
					post.update(info);
				}
				out.print("����ɹ���");
		  } else {
		    out.print("�������ƷǷ���");
		  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
