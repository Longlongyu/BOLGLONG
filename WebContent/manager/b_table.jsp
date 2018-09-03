<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<section id="manger-post">
  <h1><%=session.getAttribute("username") %>的博客管理页</h1>
  <div id="alert" class="bs-example bs-example-standalone" data-example-id="dismissible-alert-js">
  </div>
  <table id="post-table"></table>
</section>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">提示</h4>
      </div>
      <div class="modal-body"></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button id="delete-submit" type="button" data-dismiss="modal" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>
<script>
  $('#post-table').bootstrapTable({
    url: "/manager/f_posts.jsp",
    striped: true,
    search: true,
    pagination: true, // 在表格底部显示分页组件，默认false
    pageList: [10, 20], // 设置页面可以显示的数据条数
    pageSize: 10, // 页面数据条数
    pageNumber: 1, // 首页页码
    sortName: 'pid',
    showColumns: true,
    showRefresh: true,
    showPaginationSwitch: true,
    idField: 'pid',
    uniqueId: 'pid',
    responseHandler: function(res) {
    	return res[0];
    },
    queryParams: function (params) {
      return {
        pageSize: params.limit, // 每页要显示的数据条数
        offset: params.offset, // 每页显示数据的开始行号
        sort: params.sort, // 要排序的字段
        sortOrder: params.order  // 排序规则
      }
  	},
    columns: [{
      checkbox: true, // 显示一个勾选框
      align: 'center' // 居中显示
    }, {
      field: 'pid',
      title: '编号',
      align: 'center',
      sortable: true
    }, {
      field: 'title',
      title: '标题',
      align: 'center'
    }, {
      field: 'authorName',
      title: '作者',
      align: 'center'
    }, {
      field: 'cateName',
      title: '分类',
      align: 'center'
    }, {
      field: 'time',
      title: '创建时间',
      align: 'center',
      sortable: true
    }, {
      field: 'commentNum',
      title: '评论数量',
      align: 'center',
      sortable: true
    }, {
      field: 'count',
      title: '阅读量',
      align: 'center',
      sortable: true
    }, {
      field: 'control',
      title: '操作',
      align: 'center',
      width: 160, // 定义列的宽度，单位为像素px
      formatter: function (value, row, index) {
        return '<button class="btn btn-primary btn-sm" onclick="edit(\'' + row.pid + '\')">编辑</button>' +
        	'<button class="btn btn-danger btn-sm margin-left-16" data-toggle="modal" data-target="#myModal" onclick="del(\'' + row.pid + '\',\'' + row.title + '\',\'' + index + '\')">删除</button>';
      }
    }]
  });
  function edit(pid) {
  	window.location.href='/post-edit?id=' + pid;
  }
  function del(pid,title,index) {
  	$('.modal-body').html(' 确认删除 【' + title + '】？')
  	$("#delete-submit").click(function() {
  	  $.ajax({
        type : "POST",
        url : "/DeleteServlet?username=<%=session.getAttribute("username") %>&id=" + pid,
        success : function(data) {
          if (data === 'success'){
          	myalert('success', '删除成功！');
          	$('#post-table').bootstrapTable('removeByUniqueId', pid);
          } else
           myalert('danger', '操作失败！发生未知错误！');
        },
        error : function(data) {
          myalert('danger', '操作失败！发生未知错误！');
        },
   	  });
  	  $(this).unbind();
  	});
  }
  function myalert(state, text) {
  	$('#alert').append('<div class="alert alert-' + state + ' alert-dismissible fade in" role="alert">' +
        '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
  		'<span aria-hidden="true">×</span></button>' +
        '<h4>' + text + '</h4>' + '</div>');
  }
</script>