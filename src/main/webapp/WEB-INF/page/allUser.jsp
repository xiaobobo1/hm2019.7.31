<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  
<%
	pageContext.setAttribute("path", request.getContextPath());
%>

<!DOCTYPE HTML>
<html>
<head>
<title>用户列表</title>
<link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
		function addUser() {
			var form = document.forms[0];
			form.action = "<%=basePath %>user/addUser";
			form.method = "post";
			form.submit();
		}
	</script>
	<script type="text/javascript">
	function updateUser() {
		var form = document.forms[0];
		form.action = "<%=basePath %>user/updateUser";
		form.method = "post";
		form.submit();
	}
</script>
</head>

<body>
	
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>用户管理</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="container">
  <!-- 按钮：用于打开模态框 -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
 添加用户
  </button>
   
  <!-- 模态框 -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
   
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h4 class="modal-title">模态框头部</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body">
          <form class="form-horizontal" role="form">
      
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">姓名</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="firstname"  size="30" name="username" placeholder="请输入姓名">
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">年龄</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname"   size="30"  name="age" placeholder="请输入年龄">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<div class="checkbox">
				
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			 <input type="button" value="添加"  class="btn btn-default" onclick="addUser()">
		</div>
	</div>
</form>
        </div>
   
        <!-- 模态框底部 -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
   
      </div>
    </div>
  </div>
		<!-- 表格  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>id</th>
						<th>用户名</th>
						<th>年龄</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="user">
						<tr>
						<td>${user.id}</td>
						<td>${user.username }</td>
						<td>${user.age }</td>
						
							<td>
								<a type="button"  href="${path}/user/getUser?id=${user.id}" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">
								<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
									编辑
								<!-- 按钮：用于打开模态框 -->
<!-- 模态框 -->

<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
 
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title">模态框头部</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
 
      <!-- 模态框主体 -->
      <div class="modal-body">
       	<form class="form-horizontal" role="form">
<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">id</label>
		<div class="col-sm-10">
			<input type="hidden" class="form-control" id="firstname"  name="id" value="${user.id }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="secondname" class="col-sm-2 control-label">姓名</label>
		
		<div class="col-sm-10">
			<input type="text" class="form-control" id="secondname" name="username" value="${user.username }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">年龄</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname"   name="age" value="${user.age }"/>
		</div>
	</div>
	
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			 <input type="button" value="编辑"  class="btn btn-default" onclick="updateUser()">
		</div>
	</div>
</form>

      </div>
 
      <!-- 模态框底部 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
      </div>
 
    </div>
  </div>
</div>

</a>
								<a type="button"  href="${path}/user/delUser?id=${user.id}" class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
									删除</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	
		<hr style="height:1px;border:none;border-top:1px solid #ccc;" />
		<!-- 分页导航栏 -->
		
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->
			<div class="col-md-6">
				当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页，总共：${pageInfo.total}条记录
			</div>
		
		<!-- 分页条 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<li><a href="${path}/user/userInfo?pn=1">首页</a></li>
				  	<c:if test="${pageInfo.hasPreviousPage }">
				  		 <li>
					      <a href="${path}/user/userInfo?pn=${pageInfo.pageNum-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				  	</c:if>

				    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
				    	<c:if test="${page_Num == pageInfo.pageNum }">
				    		<li class="active"><a href="#">${ page_Num}</a></li>
				    	</c:if>
				    	<c:if test="${page_Num != pageInfo.pageNum }">
				    		<li><a href="${path}/user/userInfo?pn=${ page_Num}">${ page_Num}</a></li>
				    	</c:if>
				    </c:forEach> 
				    <c:if test="${pageInfo.hasNextPage }">
					    <li>
					      <a href="${path}/user/userInfo?pn=${pageInfo.pageNum+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>   
				    <li><a href="${path}/user/userInfo?pn=${pageInfo.pages}">末页</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>
