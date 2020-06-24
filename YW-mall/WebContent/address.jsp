<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.ywjava.bean.Cloth"%>
<%@page import="org.ywjava.bean.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入css -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<!-- bootstrap依赖于jquery -->
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
<!-- 引入js -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
	</head>
	<body>
		<%
	
	User user = (User)session.getAttribute("user");
	// 总价
	Double total = 0.0;
	// 保留两位小数
	DecimalFormat df = new DecimalFormat("0.00");
%>
	<div class="container">
		<div class="page-header">
			<div class="well">
				<h4>
					欢迎[<%=user.getUsername() %>]访问 <img
						src="images/<%=user.getHeadPic()%>">
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
						<a href="main.action" class="btn btn-primary">首页</a>&nbsp;&nbsp;
						<a href="logout.jsp" class="btn btn-primary"> <span
						class="glyphicon glyphicon-log-out"></span>&nbsp;退出
					</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<div class="panel-title">购物车信息列表</div>
			</div>
			<div class="panel-body">
				<!-- bootstrap默认将一行分成12格  -->
				<div class="row">
					<div class="col-md-8">
					
						<table class="table table-bordered table-hover">
							<thead>
								<th class="text-center">收件人姓名</th>
								<th class="text-center">收件人电话号</th>
								<th class="text-center">收件人地址</th>
								
							</thead>
							<tbody class="text-center">
							
									
								
								<tr>
									<td>
									<textarea rows="2" cols="20"></textarea>
									</td>
									<td>
										<textarea rows="2" cols="20"></textarea></td>
									<td>
										<textarea rows="2" cols="20"></textarea></td>
	
								</tr>

							</tbody>
						</table>
					</div>
					<div class="col-md-4" id="divDialog" >
						<img id="ewm" alt="" src="images/hh.PNG" 
							height="300" width="250">
					</div>
					
				</div>
			</div>
		</div>
	</div>
	</body>
</html>