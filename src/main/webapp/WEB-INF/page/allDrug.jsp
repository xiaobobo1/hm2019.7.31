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
<title>药品列表</title>
<link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
		function addDrug() {
			var form = document.forms[0];
			form.action = "<%=basePath %>drug/addDrug";
			form.method = "post";
			form.submit();
		}
	</script>
	<script type="text/javascript">
	function updateDrug() {
		var form = document.forms[0];
		form.action = "<%=basePath %>drug/updateDrug";
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
				<h1>药品管理</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="container">
  <!-- 按钮：用于打开模态框 -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
 添加药品
  </button>
   
  <!-- 模态框 -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
   
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h4 class="modal-title">添加</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body">
          <form class="form-horizontal" role="form">
      
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">品名</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="dname"  size="30" name="dname" placeholder="请输入姓名">
		</div>
	</div>
	<div class="form-group">
		<label for="norms" class="col-sm-2 control-label">规格</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="norms"  size="30" name="norms" placeholder="请输入姓名">
		</div>
	</div>
	<div class="form-group">
		<label for="unit" class="col-sm-2 control-label">单位</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="unit"  size="30" name="unit" placeholder="请输入姓名">
		</div>
	</div>
	<div class="form-group">
		<label for="price" class="col-sm-2 control-label">价格</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="price"  size="30" name="price" placeholder="请输入姓名">
		</div>
	</div>
	<div class="form-group">
		<label for="pdate" class="col-sm-2 control-label">生产日期</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="pdate"  size="30" name="pdate" placeholder="请输入姓名">
		</div>
	</div>
	<div class="form-group">
		<label for="mfrs" class="col-sm-2 control-label">生产商</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="mfrs"   size="30"  name="mfrs" placeholder="请输入年龄">
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
			 <input type="button" value="添加"  class="btn btn-default" onclick="addDrug()">
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
						<th>药品id</th>
						<th>品名</th>
						<th>规格</th>
						<th>单位</th>
						<th>价格</th>
						<th>生产日期</th>
						<th>生产商</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="drug">
						<tr>
						<td>${drug.did}</td>
						<td>${drug.dname }</td>
						<td>${drug.norms }</td>
						<td>${drug.unit }</td>
						<td>${drug.price }</td>
						<td>${drug.pdate }</td>
						<td>${drug.mfrs }</td>
						
							<td>
								<a type="button"  href="${path}/drug/getDrug?did=${drug.did}" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">
								<span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
									编辑
								<!-- 按钮：用于打开模态框 -->
<!-- 模态框 -->

<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
 
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title">编辑</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
 
      <!-- 模态框主体 -->
      <div class="modal-body">
       	<form class="form-horizontal" role="form">
<div class="form-group">
		<label for="did" class="col-sm-2 control-label">id</label>
		<div class="col-sm-10">
			<input type="hidden" class="form-control" id="did"  name="did" value="${drug.did }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="dname" class="col-sm-2 control-label">品名</label>
		<div class="col-sm-10">
			<input type="hidden" class="form-control" id="dname"  name="dname" value="${drug.dname }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="norms" class="col-sm-2 control-label">规格</label>
		<div class="col-sm-10">
			<input type="hidden" class="form-control" id="norms"  name="norms" value="${drug.norms }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="unit" class="col-sm-2 control-label">单位</label>
		<div class="col-sm-10">
			<input type="hidden" class="form-control" id="unit"  name="unit" value="${drug.unit }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="price" class="col-sm-2 control-label">价格</label>
		<div class="col-sm-10">
			<input type="hidden" class="form-control" id="price"  name="price" value="${drug.price }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="pdate" class="col-sm-2 control-label">生产日期</label>
		<div class="col-sm-10">
			<input type="hidden" class="form-control" id="pdate"  name="pdate" value="${drug.pdate }"/>
		</div>
	</div>
	<div class="form-group">
		<label for="mfrs" class="col-sm-2 control-label">生产商</label>
		<div class="col-sm-10">
			<input type="hidden" class="form-control" id="mfrs"  name="mfrs" value="${drug.mfrs }"/>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			 <input type="button" value="编辑"  class="btn btn-default" onclick="updateDrug()">
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
								<a type="button"  href="${path}/drug/delDrug?did=${drug.did}" class="btn btn-danger btn-sm">
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
				  	<li><a href="${path}/drug/drugInfo?pn=1">首页</a></li>
				  	<c:if test="${pageInfo.hasPreviousPage }">
				  		 <li>
					      <a href="${path}/drug/drugInfo?pn=${pageInfo.pageNum-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				  	</c:if>

				    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
				    	<c:if test="${page_Num == pageInfo.pageNum }">
				    		<li class="active"><a href="#">${ page_Num}</a></li>
				    	</c:if>
				    	<c:if test="${page_Num != pageInfo.pageNum }">
				    		<li><a href="${path}/drug/drugInfo?pn=${ page_Num}">${ page_Num}</a></li>
				    	</c:if>
				    </c:forEach> 
				    <c:if test="${pageInfo.hasNextPage }">
					    <li>
					      <a href="${path}/drug/drugInfo?pn=${pageInfo.pageNum+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>   
				    <li><a href="${path}/drug/drugInfo?pn=${pageInfo.pages}">末页</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>
