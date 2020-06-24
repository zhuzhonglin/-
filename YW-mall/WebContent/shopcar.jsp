
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>
<!-- 引入css -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<!-- bootstrap依赖于jquery -->
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
<!-- 引入js -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	
	/** 结算按钮单击事件  */
	$("#submitBtn").click(function(){
		/** id为ewm的控件显示  */
	   // $("#ewm").show();
		location.href = "address.jsp";
	});
	
});

/**
 * 商品购买数量减一
 * @returns
 */

function minus1(){
	//1.获取购买数量的文本框
	var buyNumberInput = document.getElementById("buyNumber-");
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
function plus1(storage){
	//1.获取购买数量的文本框
	var buyNumberInput = document.getElementById("buyNumber-");
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
/**
 * 商品购买数量加一
 * @param storage 库存
 */
function plus(storage){
	//1.获取购买数量的文本框
	var buyNumberInput = document.getElementById("buyNumber+");
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
function minus(){
	//1.获取购买数量的文本框
	var buyNumberInput = document.getElementById("buyNumber+");
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
</script>
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
						src="images/<%=user.getHeadPic()%>">&nbsp;&nbsp;<a
						href="main.action" class="btn btn-primary">首页</a>&nbsp;&nbsp;
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
							<%
								// 获得要显示的购物车数据
								List<Cloth> shopcarList = (List<Cloth>)request.getAttribute("shopcarList");
								// 循环显示每一个数据
								
								 if(shopcarList!=null){
									 %>
						<table class="table table-bordered table-hover">
							<thead>
								<th class="text-center">展品</th>
								<th class="text-center">商品</th>
								<th class="text-center">单价</th>
								<th class="text-center">数量</th>
								<th class="text-center">小计</th>
							</thead>
							<tbody class="text-center">
						<% 
										for(Cloth cloth : shopcarList){
											Double sum = cloth.getPrice() * cloth.getCount();
											total += sum;
											%>	
								<tr>
									<td><img src="images/<%=cloth.getImage() %>" height="60" />
									</td>
									<td><%=cloth.getName() %></td>
									<td><%=cloth.getPrice()%></td>
									<td><%=cloth.getCount() %>
										<form class="form-inline" action="minusshopcar.action"
											method="post">
											<input type="hidden" id="id" name="id" size="2"
												value="<%=cloth.getId() %>" /> <span onclick="minus1();"
												class="glyphicon glyphicon-minus" style="cursor: pointer;"></span>
											<input type="text" id="buyNumber-" name="count" size="2"
												value="1" style="text-align: center;" /> <span
												onclick="plus1(10);" class="glyphicon glyphicon-plus"
												style="cursor: pointer;"></span>
											<button type="submit" class="btn btn-warning">减少</button>
										</form>
										<form class="form-inline" action="addshopcar.action"
											method="post">
											<!-- 隐藏文本域，不会显示在页面上，但是表单提交时，会提交到后台 -->
											<input type="hidden" id="id" name="id" size="2"
												value="<%=cloth.getId() %>" /> <span onclick="minus();"
												class="glyphicon glyphicon-minus" style="cursor: pointer;"></span>
											<input type="text" id="buyNumber+" name="count" size="2"
												value="1" style="text-align: center;" /> <span
												onclick="plus(10);" class="glyphicon glyphicon-plus"
												style="cursor: pointer;"></span>
											<button type="submit" class="btn btn-success">增加</button>
										</form></td>
									<td><%=df.format(sum) %></td>
								</tr>
								<% }%>
							
							</tbody>
						</table>
					</div>
					<div class="col-md-4" id="divDialog" style="overflow: hidden;">
						<img id="ewm" alt="" src="images/hh.PNG" style="display: none;"
							height="400" width="250">
					</div>
					<div class="col-md-4 col-md-offset-5">
						<a href="main.action" class="btn btn-info">继续购物</a> 总价：<font
							color="red">￥<%=df.format(total)   %></font>&nbsp;&nbsp;
						<button id="submitBtn" type="button" class="btn btn-danger">&nbsp;去结算</button>
							<%
								}else{
									%>
									<tr>
									<th><font size="+2" color="red">您的购物车没有东西，快到首页购买点东西吧！</font></th>
									</tr>
						<% 	}
							%>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>