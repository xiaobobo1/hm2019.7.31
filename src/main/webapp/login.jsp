<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
            window.onload = function(){
                document.getElementById("btn").onclick = function(){
                    window.location.href = "http://localhost:8080/ssmdemo/menu.jsp";
                    // window.location = "https://www.baidu.com/";
                };
            };
        </script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <form action="login" method="post">
                <div class="form-group">
                    <label>用户名</label>
                    <input type="text" class="form-control" name="username" placeholder="username">
                </div>
                <div class="form-group">
                    <label>密码</label>
                    <input type="password" class="form-control" name="password" placeholder="Password">
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> 记住密码
                    </label>
                </div>
                <button type="button" class="btn btn-default" id="btn">登录</button>
                <div>${msg}</div>
            </form>
        </div>
    </div>
</div>
</body>
</html>