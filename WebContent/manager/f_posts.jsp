<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.json.*"%>
<%! 
  Conn conn = new Conn();
  User user = new User();
  Post post = new Post();
  Cate cate = new Cate();
  Comment comm = new Comment();
%>
<%
  request.setCharacterEncoding("utf-8");

  String url = "";
  int curr_page = 1;
  String name = (String) session.getAttribute("username");
  String pid = request.getParameter("p_id"); // 在这里写个方法判断 pid合法性
  List<PostInfo> post_list = new ArrayList<>();
  String sql = "select * from post";
  if (request.getParameter("username") != null) {
    name = request.getParameter("username");
    url = "username=" + name + "&";
    
    int uid = user.getUserId(name);
    sql += " where u_id=" + uid;
  } else if (user.getPower(name) == 1){
  	sql += " where u_id=" + user.getUserId(name);
  }
  
  if (request.getParameter("req") != null && request.getParameter("req").equals("all")) {
  	sql = "select * from post";
  }
  
  if (request.getParameter("cate") != null) {
    int p_cate = Integer.parseInt(request.getParameter("cate"));
    int uid = user.getUserId(name);
    url += "cate=" + p_cate + "&";
    if (sql.indexOf("where") != -1) {
      sql += " and cate=" + p_cate;
    } else {
      sql += " where cate=" + p_cate;
    }
  }
  
  if (request.getParameter("order") == null) {
  	sql = sql + " order by createdate desc";
  }
  try{
  	ResultSet rs = conn.executeQuery(sql);
  	while (rs.next()) {
  		PostInfo info = new PostInfo();
  		info.setId(rs.getInt("p_id"));
  		info.setAuthorId(rs.getInt("u_id"));
  		info.setTitle(rs.getString("title"));
  		info.setContent(rs.getString("content"));
  		info.setCreatedate(rs.getTimestamp("createdate"));
  		info.setCate(rs.getInt("cate"));
  		info.setCount(rs.getInt("pcount"));
  		post_list.add(info);
  	}
  } catch(Exception e) {
  	System.out.println("error: " + e);
  }
  conn.close();
  
  if (request.getParameter("p-page") != null) {
    int p_page = Integer.parseInt(request.getParameter("p-page"));
    curr_page = p_page < 0 ? 1 : p_page;
  }
  
  List<PostInfo> curr_page_posts = new ArrayList<>();
  PageCut page_cut = new PageCut(post_list, curr_page, 10);
  if (post_list.size() > 10) {
  	curr_page_posts = page_cut.getCurrPageList();
  } else {
  	curr_page_posts = post_list;
  }
  
  
  JSONObject main = new JSONObject();
  int i = 0;
  for (PostInfo info : curr_page_posts) {
  	JSONObject returnjson = new JSONObject();
  	String aname = user.getUserName(info.getAuthorId());
  	
  	returnjson.put("pid", info.getId());
  	returnjson.put("authorName", aname);
  	returnjson.put("title", info.getTitle());
  	returnjson.put("time", info.getTime());
  	returnjson.put("cateName", cate.getCateName(info.getCate()));
  	returnjson.put("commentNum", comm.getCommentNum(info.getId()));
  	returnjson.put("count", info.getCount());
  	returnjson.put("content", BlogUtil.Substring(info.getContent(), 300));
  	
    
  	main.put("" + i++, returnjson);
  }
  if (request.getParameter("req") != null && !request.getParameter("req").equals("table")) {
    JSONObject nav = new JSONObject();
    nav.put("url", url);
    nav.put("startPageNum", page_cut.getStartPageNum());
    nav.put("endPageNum", page_cut.getEndPageNum());
    nav.put("totalPages", page_cut.getTotalPages());
    main.put("nav", nav);
  }
  out.clear();
  out.println(main.toString());   //通过json返回，静态页面通过ajax
%>