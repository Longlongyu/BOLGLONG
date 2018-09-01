<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%@ page import="net.sf.json.*"%>
<%! 
  User user = new User();
  Post post = new Post();
  Cate cate = new Cate();
  Comment comm = new Comment();
%>
<%
  request.setCharacterEncoding("utf-8");

  String url = "";
  String name = (String) session.getAttribute("username");
  String pid = request.getParameter("p_id"); // 在这里写个方法判断 pid合法性
  int curr_page = 1;
  List<PostInfo> post_list = new ArrayList<>();
  
  
  if (request.getParameter("username") != null) {
    int uid = user.getUserId(name);
    name = request.getParameter("username");
    url = "username=" + name + "&";
    post_list = post.getListByAuthor(uid); 
  } else {
    String keyword = request.getParameter("keyword");
    post_list = post.getList(keyword);
  }
  
  if (request.getParameter("cate") != null) {
    int p_cate = Integer.parseInt(request.getParameter("cate"));
    int uid = user.getUserId(name);
    url += "cate=" + p_cate + "&";
    if (request.getParameter("username") != null) {
      post_list = post.getListByAuthorAndCate(uid, p_cate);
    } else {
      post_list = post.getListByCate(p_cate);
    }
  }
  
  if (request.getParameter("p-page") != null) {
    int p_page = Integer.parseInt(request.getParameter("p-page"));
    curr_page = p_page < 0 ? 1 : p_page;
  }
  PageCut page_cut = new PageCut(post_list, curr_page, 10);
  List<PostInfo> curr_page_posts = page_cut.getCurrPageList();
  
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
  	
    
  	main.put("" + i, returnjson);
  }
  
  JSONObject nav = new JSONObject();
  nav.put("url", url);
  nav.put("startPageNum", page_cut.getStartPageNum());
  nav.put("endPageNum", page_cut.getEndPageNum());
  nav.put("totalPages", page_cut.getTotalPages());
  main.put("nav", nav);
  out.clear();
  out.println(main.toString());   //通过json返回，静态页面通过ajax
%>