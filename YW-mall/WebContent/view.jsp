<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.ywjava.bean.Cloth"%>
<%@page import="org.ywjava.bean.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 引入css -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<!-- bootstrap依赖于jquery -->
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
<!-- 引入js -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/**
 * 商品购买数量减一
 * @returns
 */
function minus(){
	//1.获取购买数量的文本框
	var buyNumberInput = document.getElementById("buyNumber");
	//2.获取文本框的值,让其减一
	var buyNumberValue = buyNumberInput.value;
	//console.log(typeof buyNumberValue);
	if(buyNumberValue > 1){
		//3.将减一后的值在赋值给 文本框
		buyNumberInput.value = parseInt(buyNumberValue) - 1;
	}else{
		  alert("亲，最少买一个商品哦！");
	}
}
/**
 * 商品购买数量加一
 * @param storage 库存
 */
function plus(storage){
	//1.获取购买数量的文本框
	var buyNumberInput = document.getElementById("buyNumber");
	//2.获取文本框的值,让其加一
	var buyNumberValue = buyNumberInput.value;
	//查看数据库类型
	//console.log(typeof buyNumberValue);
	//将字符串类型数值转转换成数字类型
	// parseInt(str)  parseFloat(str);
	if(buyNumberValue < storage){
		//3.将减一后的值在赋值给 文本框
		buyNumberInput.value = parseInt(buyNumberValue) + 1;
	}else{
		  alert("亲,您购买的数量已经超过库存！");
	}
}


</script>
</head>
<body>
	<%
	System.out.println("进入view.jsp -->");
	System.out.println(session.getId());
	User user = (User)session.getAttribute("user");
	System.out.println(user);
%>
	<div class="container">
		<div class="page-header">
			<div class="well">
				<h4>
					欢迎[<%=user.getUsername() %>]访问 <imgsrc="images/<%=user.getHeadPic()%>">
					&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
					<a href="shopcar.action" class="btn btn-danger">我的购物车</a>&nbsp;&nbsp;
					<a href="logout.jsp" class="btn btn-primary"> <span
						class="glyphicon glyphicon-log-out"></span>&nbsp;退出
					</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<div class="panel-title">服装信息</div>
			</div>
			<div class="panel-body">
				<!-- bootstrap默认将一行分成12格 -->
				<div class="row">
					<%
						// 根据id查找图书，返回Book对象
						Cloth cloth = (Cloth)request.getAttribute("cloth");
						%>
					<div class="col-md-10 col-sm-12 col-xs-12">
						<table>
							<tbody>
								<tr>
									<td rowspan="6"><img src="images/<%=cloth.getImage()%>" style="width: 90%;"></td>
								</tr>
								<tr>
									<td><%=cloth.getRemark() %></td>
								</tr>

								<tr>
									<td><%=cloth.getName() %></td>
								</tr>

								<tr>
									<td><%=cloth.getAuthor() %></td>
								</tr>

								<tr>
									<td><font color="red"><%=cloth.getPrice() %> /元</font></td>
								</tr>
								<!-- 
											商品加入购物车在实际项目开发中有两种选择：
											1. 将选择加入购物车的商品保存到数据库
											2. 将选择加入购物车的商品保存到内存（不存入数据库）
										 -->
								<tr>
									<td>
										<form class="form-inline" action="addshopcar.action"
											method="post">
											<!-- 隐藏文本域，不会显示在页面上，但是表单提交时，会提交到后台 -->
											<input type="hidden" id="id" name="id" size="2"
												value="<%=cloth.getId() %>" /> <span onclick="minus();"
												class="glyphicon glyphicon-minus" style="cursor: pointer;"></span>
											<input type="text" id="buyNumber" name="count" size="2"
												value="1" style="text-align: center;" /> <span
												onclick="plus(10);" class="glyphicon glyphicon-plus"
												style="cursor: pointer;"></span>
											<button type="submit" class="btn btn-danger">加入购物车</button>
										</form>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<%
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>