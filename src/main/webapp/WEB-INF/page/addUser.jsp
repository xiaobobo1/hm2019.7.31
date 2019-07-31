<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  
<%
	pageContext.setAttribute("path", request.getContextPath());
%>

<html>
<title>添加用户</title>
<link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>添加用户</h1>
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

	<script type="text/javascript">
		function addUser() {
			var form = document.forms[0];
			form.action = "<%=basePath %>user/addUser";
			form.method = "post";
			form.submit();
		}
	</script>
</body>
</html>
