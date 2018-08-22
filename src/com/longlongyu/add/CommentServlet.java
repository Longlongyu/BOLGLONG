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
  
	// 正则表达式：验证评论
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
    
    int u_id = Integer.parseInt(request.getParameter("u_id"));                  // 获取上传用户id		
		String username = (String) request.getSession().getAttribute("username");   // 获取Session对应用户名

    try {
    	if (user.getUserId(username) != u_id) {   // 判断id是否相同
				out.print("非法操作！"); // 非法操作
			} else {
				String comment = request.getParameter("comment");          // 获取内容
				int p_id = Integer.parseInt(request.getParameter("p_id")); // 获取对应文章id
				
		    if (Pattern.matches(REGEX_COMMENT, comment)) {             // 判断输入合法性
	      	CommentInfo info = new CommentInfo();
	  			info.setUserId(u_id);
	  			info.setPostId(p_id);
	  			info.setComment(comment);
	  			comm.insert(info);                                       // 插入数据
		    } else {
		      out.print("输入字数不符合要求！");
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
