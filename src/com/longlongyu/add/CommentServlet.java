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

import com.longlongyu.Info.CommentInfo;
import com.longlongyu.dal.Comment;
import com.longlongyu.dal.User;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	// ������ʽ����֤����
  final String REGEX_COMMENT = "^.{6,600}";
  
	User user = new User();
	Comment comm = new Comment();
	
  /**
   * @see HttpServlet#HttpServlet()
   */
  public CommentServlet() {
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
    
    int u_id = Integer.parseInt(request.getParameter("u_id"));                  // ��ȡ�ϴ��û�id		
		String username = (String) request.getSession().getAttribute("username");   // ��ȡSession��Ӧ�û���

    try {
    	if (user.getUserId(username) != u_id) {   // �ж�id�Ƿ���ͬ
				out.print("�Ƿ�������"); // �Ƿ�����
			} else {
				String comment = request.getParameter("comment");          // ��ȡ����
				int p_id = Integer.parseInt(request.getParameter("p_id")); // ��ȡ��Ӧ����id
				
		    if (Pattern.matches(REGEX_COMMENT, comment)) {             // �ж�����Ϸ���
	      	CommentInfo info = new CommentInfo();
	  			info.setUserId(u_id);
	  			info.setPostId(p_id);
	  			info.setComment(comment);
	  			comm.insert(info);                                       // ��������
		    } else {
		      out.print("��������������Ҫ��");
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
