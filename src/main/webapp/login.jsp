<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
  <base href="<%=basePath%>">
  <meta charset="utf-8">
  <title>CRM登录</title>
  <script type="text/javascript" src="static/jquery/jquery.min.js"></script>
  <link rel="stylesheet" href="static/css/login.css">
</head>

<body>
  <section class="container">
    <div class="login">
      <h1>登录CRM系统</h1>
      <span id="info"></span>
      <form id="loginForm" method="post" action="index.html">
        <p><input type="text" name="username" value="" placeholder="用户名"></p>
        <p><input type="password" name="password" value="" placeholder="密码"></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me">
            7天内自动登录
          </label>
        </p>
        <p class="submit"><input type="submit" value="登录"></p>
      </form>
    </div>

    <div class="login-help">
      <p>忘记密码? <a href="index.html">点击这里找回</a>.</p>
    </div>
  </section>
  <script type="text/javascript">
  	$(function(){
  		$("#loginForm").on("submit", function(event){
  			//阻止默认的提交行为:
  			event.preventDefault();
  			//获取用户名和密码
  			var username = $("input[name=username]").val();
  			var password = $("input[name=password]").val();
  			
  			//校验用户名
  			if( !username ){
  				$("#info").text("请输入用户名").css({"color":"#f00"});
  				return;
  			}
            if( username.indexOf(" ") != -1 ){
                $("#info").text("不能输入空格").css({"color":"#f00"});
                return;
            }
  			
  			//校验密码
  			if( !password ){
  				$("#info").text("请输入密码").css({"color":"#f00"});
  				return;
  			}

  			//发送ajax请求给服务器
  			$.post("user/login.action",
  			{
  				"user.username" : username,
  				"user.password" : password 
  			},
  			function(data){
  				if(data && data.success){
  					window.location.href="system/IndexAction.action";
  					return;
  				}
  				if(data && !data.success){
  					$("#info").text(data.message).css({"color":"#f00"});
  					return;
  				}
  			},"json");
  			
  		});
  	})
  </script>
</body>
</html>
