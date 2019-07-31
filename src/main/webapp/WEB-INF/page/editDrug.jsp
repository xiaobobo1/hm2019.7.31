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
function updateDrug() {
	var form = document.forms[0];
	form.action = "<%=basePath %>drug/updateDrug";
	form.method = "post";
	form.submit();
</script>

</head>
<body>
	<h1>修改用户</h1>
	<form class="form-horizontal" role="form">
<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">编号</label>
		<div class="col-sm-10">
			<input type="hidden" class="form-control" id="firstname"  name="did" value="${drug.did }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="secondname" class="col-sm-2 control-label">名称</label>
		
		<div class="col-sm-10">
			<input type="text" class="form-control" id="secondname" name="dname" value="${drug.dname }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">规格</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="thirdname"   name="norms" value="${drug.norms }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">单位</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="fourthname"   name="unit" value="${drug.unit }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">价格</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="fifthname"   name="price" value="${drug.price }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">生产日期</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="sixthname"   name="pdate" value="${drug.pdate }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">生产厂商</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname"   name="mfrs" value="${drug.mfrs }"/>
		</div>
	</div>
	
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			 <input type="button" value="编辑"  class="btn btn-default" onclick="updateDrug()">
		</div>
	</div>
</form>

</body>

</html>
