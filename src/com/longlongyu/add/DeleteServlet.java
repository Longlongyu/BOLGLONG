package com.longlongyu.add;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.longlongyu.dal.Post;
import com.longlongyu.dal.User;

/**
 * Servlet implementation class DelectServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	User user = new User();
	Post post = new Post();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
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
    
    int id = Integer.parseInt(request.getParameter("id")); // 获取文章id
    String username = request.getParameter("username");    // 获取文章操作用户
    try {
			if (!user.isExistUsersInfo(username)
					 || !username.equals((String) request.getSession().getAttribute("username"))) { // 判断用户是否存在
				out.print("user error");
			} else if (post.getPostInfo(id).getAuthorId() == user.getUserId(username)) {   // 判断用户和作者是否为同一人
				int u_id = user.getUserId(username);
				post.delete(id, u_id);
				out.print("success");
			} else {
				out.print("failed");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
