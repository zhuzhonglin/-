<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<!-- 
	jQuery是目前行业类最流行的js框架，几乎所有的前端框架都是基于jQuery的
	jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	// #找到id="registerBtn"的控件，click是单击事件
	$("#registerBtn").click(function(){
		// alert("注册");
		// 跳转到registerForm.jsp
		location.href = "registerForm.jsp";
	})
})
function check(form) {

          if(form.loginname.value=='') {
                alert("请输入登录名/邮箱!");
                form.loginname.focus();
                return false;
           }

          if(form.password.value=='') {
                alert("请输入用户密码!");
                form.password.focus();
                return false;
           }
         return true;
         
         }
</script>
</head>
<body style="background: url(images/登录.PNG);background-size:cover;">
	<%
		System.out.println("进入index.jsp -->");
	%>
	<div style="width:auto;height: auto;;margin: 0 auto;margin-top: 10%;">
	<!-- .container 类用于固定宽度并支持响应式布局的容器。 -->
	<div class="container">
		<!-- 栅格系统用于通过一系列的行（row）与列（column）的组合来创建页面布局 -->
		<div class="row">
			<!-- col-md-offset-6 可以用来调整位置 offset-6表示距离左边偏离6个格子 -->
			<div class="page-header" align="center">
				<h2>登录页面</h2>
			</div>
			<!-- 
  	   	     .form-horizontal:表单添加 .form-horizontal 类，并联合使用 Bootstrap 预置的栅格类，可以将 label 标签和控件组水平并排布局。
  	   	     	-->
			<div align="center">
				<form class="form-horizontal" action="login.action" method="post"  onsubmit="return check(this)">
					<div class="form-group">
						<div class="col-md-4 col-sm-4 col-xs-4"></div>


						<div class="col-md-4 col-sm-4 col-xs-4">
							<%
	  	   	     			// 上一个页面 request.setAttribute("message", "注册成功!");
	  	   	     		    //  "注册成功!" = request.getAttribute("message");
	  	   	     			String message = (String)request.getAttribute("message");
	  	   	     			if(message != null){
	  	   	     				%>
							<font color="red"><%=message %></font>
							<%
	  	   	     			}
	  	   	     		%>
						</div>
					</div>

					<!-- form-group 表示这个层里面的所有看成一组 -->
					<div class="form-group">
						<!-- input-group 表示这个层里面的图片和控件看成一组，并且占4个格子 -->
						<div class="input-group col-md-4 col-sm-4 col-xs-4">
							<!-- input-group-addon addon只把span添加到input当中 -->
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-user"></span>
							</span>
							<!-- .form-control:所有设置了 .form-control 类的 <input>、<textarea> 和 <select> 元素都将被
  	   	     			默认设置宽度属性为 width: 100%; 这个100%就是col-md-4 -->
							<input class="form-control " placeholder="登录名/邮箱" type="text"
								name="loginname" value="123">
						</div>
					</div>

					<div class="form-group">
						<div class="input-group col-md-4 col-sm-4 col-xs-4">
							<!-- input-group-addon addon只把span添加到input当中 -->
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-lock"></span>
							</span>
							<!-- .form-control:所有设置了 .form-control 类的 <input>、<textarea> 和 <select> 元素都将被
  	   	     			默认设置宽度属性为 width: 100%; 这个100%就是col-md-4 -->
							<input class="form-control  has-error has-feedback"
								placeholder="密码" type="password" name="password" value="123">
						</div>
					</div>
					<div class="static-item">


						<div class="form-group">
							<div class="btn-group col-md-4 col-sm-4 col-xs-4"></div>
							<div class="btn-group col-md-4 col-sm-4 col-xs-4">
								<!--btn-group-justified 能够让你的按钮组根据父容器尺寸来设定各自相同的尺寸，采用响应式布局技术从而有利于移动端的用户体验。-->
								<div class="btn-group-justified">
									<div class="btn-group">
										<button type="submit" class="btn btn-success">
											<span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;登录
										</button>
									</div>
									<div class="btn-group">
										<button id="registerBtn" type="button" class="btn btn-danger">
											<span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;注册
										</button>
									</div>
								</div>
							</div>
						</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>








