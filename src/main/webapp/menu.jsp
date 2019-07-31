<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>欢迎进入系统主页</title>
<link rel="stylesheet" href="${path}/static/layui/css/layui.css">
<script type="text/javascript" src="${path}/static/layui/layui.js"></script>
<script type="text/javascript">
layui.use('element', function(){
	  var element = layui.element;
	  
	  //一些事件监听
	  element.on('tab(demo)', function(data){
	    console.log(data);
	  });
	});
</script>

</head>
<body>
<ul class="layui-nav layui-nav-tree" lay-filter="test">
<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
  <li class="layui-nav-item layui-nav-itemed">
    <a href="javascript:;">默认展开</a>
    <dl class="layui-nav-child">
      <dd><a href="${path }/user/userInfo">用户管理</a></dd>
      <dd><a href="${path }/drug/drugInfo">药品信息管理</a></dd>
      <dd><a href="">跳转</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="javascript:;">解决方案</a>
    <dl class="layui-nav-child">
      <dd><a href="">移动模块</a></dd>
      <dd><a href="">后台模版</a></dd>
      <dd><a href="">电商平台</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item"><a href="">产品</a></li>
  <li class="layui-nav-item"><a href="">大数据</a></li>
</ul>

</body>
</html>