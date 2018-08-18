package com.longlongyu.add;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addServlet")
public class addServlet extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public addServlet() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
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
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("到了Servlet！！！");
        response.setContentType("text/html;charset=utf8");
        request.setCharacterEncoding("utf8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");   //获取部门编号
        String name = request.getParameter("name");    //获取部门名称
        String address = request.getParameter("address"); //获取部门所在地址
        int num = Integer.parseInt(request.getParameter("num")); //获取部门人数
        Connection conn = null; //声明一个Connection对象，用来连接数据库
        PreparedStatement pstmt = null; //声明PreparedStatement对象，用来向数据库插入数据条数据
        try {
            //连接到MySQL数据库中的bank数据库模式
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("创建驱动成功！");
            //连接数据库
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?serverTimezone=UTC", "root", "123456");
            System.out.println("连接数据库成功！");
            //插入数据的SQL语句
            String sql = "INSERT INTO blank(id,d_name,address,num) VALUES(?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            //设置插入数据的顺序
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, address);
            pstmt.setInt(4, num);
            int result = pstmt.executeUpdate();
            //判断执行结果
            if (result == 1) {
                out.print("插入数据成功！");
            }else {
                out.print("插入数据失败！请重新插入！");
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
