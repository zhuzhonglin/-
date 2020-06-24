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
</head>
<body style="background: url(images/注册.PNG);background-size:cover;">
      <script type="text/javascript">
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
          if(form.username.value=='') {
              alert("请输入用户名!");
              form.username.focus();
              return false;
         }
          if(form.age.value=='') {
              alert("请输入年龄!");
              form.password.focus();
              return false;
         } 
          if(form.address.value=='') {
             alert("请输入地址!");
             form.password.focus();
             return false;
        }
          if(form.email.value=='') {
            alert("请输入邮箱!");
            form.password.focus();
            return false;
       }
          if(form.address.value=='') {
              alert("请输入地址!");
              form.password.focus();
              return false;
         }
          if(form.headPic.value=='') {
             alert("请加入头像!");
             form.headPic.focus();
             return false;
        }
          
         return true;
         }
         </script>
		<div style="width: 500px;height: auto;;margin: 0 auto;margin-top: 0%;margin-left: 40%;">
	<div class="container ">
		<div class="row">
			<div>
				<h2>注册页面</h2>
	
			</div>
			<form class="form-horizontal" action="register.action" method="post"
				enctype="multipart/form-data" onsubmit="return check(this)" />
				<div class="form-group">
					<div class="input-group col-md-4 ">
						<input class="form-control" placeholder="登录名/邮箱" type="text"
							name="loginname">
					</div>
				</div>

				<div class="form-group">
					<div class="input-group col-md-4 ">
						<input class="form-control" placeholder="密码" type="password"
							name="password">
					</div>
				</div>

				<div class="form-group">
					<div class="input-group col-md-4 ">
						<input class="form-control" placeholder="用户名" type="text"
							name="username">
					</div>
				</div>

				<div class="form-group">
					<label>男:</label><input name="sex" value="男" type="radio"
						checked="checked"> <label>女:</label><input name="sex"
						value="女" type="radio">
				</div>

				<div class="form-group">
					<div class="input-group col-md-4 ">
						<input class="form-control" placeholder="年龄" type="text"
							name="age">
					</div>
				</div>

				<div class="form-group">
					<div class="input-group col-md-4 ">
						<input class="form-control" placeholder="地址" type="text"
							name="address">
					</div>
				</div>

				<div class="form-group">
					<div class="input-group col-md-4 ">
						<input class="form-control" placeholder="电话" type="text"
							name="phone">
					</div>
				</div>

				<div class="form-group">
					<div class="input-group col-md-4 ">
						<input class="form-control" placeholder="邮箱" type="text"
							name="email">
					</div>
				</div>

				<!-- 文件上传控件是file -->
				<div class="form-group">
					<div class="input-group col-md-4 ">
						<input class="form-control" type="file" name="headPic">
					</div>
				</div>

				<div class="form-group">
					<div class="input-group col-md-4 ">
						<button type="submit" class="btn btn-danger" onclick="validata()()">
							<span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;注册
						</button>
						<a href="login.jsp" class="btn btn-success""> <span
							class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;退出
						</a>

					</div>
				</div>

			</form>
		</div>
	</div>
</div>
</body>
</html>