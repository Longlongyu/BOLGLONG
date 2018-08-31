<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="net.sf.json.*"%>
<%
  String count = "0";
  String pid = request.getParameter("p_id"); // 在这里写个方法判断 pid合法性
  if(pid==null) {
    count = "0";
  } else {
    //可以通过seesion实现防刷新，但是用户希望能刷新一次加一，因此这次没有实现
    Connection conn = null;
    PreparedStatement pstmt = null; 
    PreparedStatement pstmt1 = null; 
    ResultSet rs =  null;
    try {
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?serverTimezone=Hongkong",
			    "root", "123456");
      pstmt = conn.prepareStatement("Select count from post where p_id=?");
      pstmt.setString(1,pid);;
      rs = pstmt.executeQuery();
      String sql = "";
      if(rs.next()) {
        count = ""+(rs.getInt("count")+1);
        sql = "update post set count=count+1 where p_id=?";
        pstmt1 = conn.prepareStatement(sql);
    	pstmt1.setString(1,pid);
    	pstmt1.executeUpdate();
  	  }
    } catch (Exception e) {
  	//System.out.println("ErrorString: " + e.getErrorString());
    } finally {
  	if (rs != null) rs.close();
  	rs = null;
  	if (pstmt != null) pstmt.close();
  	pstmt = null;
  	if (pstmt1 != null) pstmt1.close();
  	pstmt1 = null;
  	if (conn != null) conn.close();
  	conn = null;
  	}
  }

  JSONObject returnjson = new JSONObject();
  returnjson.put("count", count);
  out.clear();
  out.println(returnjson.toString());   //通过json返回，静态页面通过ajax
%>

