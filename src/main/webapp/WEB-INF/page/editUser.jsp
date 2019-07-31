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

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>编辑用户</title>
<link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

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
	<h1>修改用户</h1>
	<form class="form-horizontal" role="form">
<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">id</label>
		
		<div class="col-sm-10">
			<input type="hidden" class="form-control" id="firstname"  name="id" value="${user.id }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">姓名</label>
		
		<div class="col-sm-10">
			<input type="text" class="form-control" id="firstname" name="username" value="${user.username }"/>
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

</body>

</html>
