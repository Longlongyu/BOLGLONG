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
        System.out.println("����Servlet������");
        response.setContentType("text/html;charset=utf8");
        request.setCharacterEncoding("utf8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");   //��ȡ���ű��
        String name = request.getParameter("name");    //��ȡ��������
        String address = request.getParameter("address"); //��ȡ�������ڵ�ַ
        int num = Integer.parseInt(request.getParameter("num")); //��ȡ��������
        Connection conn = null; //����һ��Connection���������������ݿ�
        PreparedStatement pstmt = null; //����PreparedStatement�������������ݿ��������������
        try {
            //���ӵ�MySQL���ݿ��е�bank���ݿ�ģʽ
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("���������ɹ���");
            //�������ݿ�
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?serverTimezone=UTC", "root", "123456");
            System.out.println("�������ݿ�ɹ���");
            //�������ݵ�SQL���
            String sql = "INSERT INTO blank(id,d_name,address,num) VALUES(?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            //���ò������ݵ�˳��
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, address);
            pstmt.setInt(4, num);
            int result = pstmt.executeUpdate();
            //�ж�ִ�н��
            if (result == 1) {
                out.print("�������ݳɹ���");
            }else {
                out.print("��������ʧ�ܣ������²��룡");
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
