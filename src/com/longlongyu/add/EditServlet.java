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
    
	// 正则表达式：验证标题
  final String REGEX_TITLE = "^.{1,50}$";
	// 正则表达式：验证内容
	 final String REGEX_CONENT = "^.{10,}";
  
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
    
    String username = request.getParameter("username");    // 获取文章操作用户
    int id = Integer.parseInt(request.getParameter("id")); // 获取文章id
    String title = request.getParameter("title"); 				 // 获取标题
		String content = request.getParameter("content"); 		 // 获取文章内容
		try {
			if (!user.isExistUsersInfo(username)
					 || !username.equals((String) request.getSession().getAttribute("username"))) { // 判断用户是否存在
				out.print("用户名未识别！请登陆或注册后再试！");
			} else if (Pattern.matches(REGEX_TITLE, title)
					 && Pattern.matches(REGEX_CONENT, content)) {    // 判断标题和内容是否符合要求
				PostInfo info = new PostInfo();
				info.setTitle(title);
				info.setContent(content);
				if (post.getPostInfo(id).getAuthorId() != user.getUserId(username)) {   // 判断用户和作者是否为同一人
					int u_id = user.getUserId(username);
					int p_id = post.getNullPostId();
					info.setAuthorId(u_id);
					post.insert(p_id, info);
					out.print("<script>location.href += '?id=" + p_id + "';</script>");
				} else {
					info.setId(id);
					post.update(info);
				}
				request.getSession().setAttribute("postlist", null);
				out.print("保存成功！");
		  } else {
		    out.print("标题或非法！");
		  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
