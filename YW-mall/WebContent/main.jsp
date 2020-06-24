<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.ywjava.bean.Cloth"%>
<%@page import="java.util.ArrayList"%>
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
</head>
<body style="background-color: #CE8483;">
	<%
	System.out.println("进入main.jsp -->");
	System.out.println(session.getId());
	// 上一个页面 session.setAttribute("user", user); 
	User user = (User)session.getAttribute("user");
%>
	<div class="container">
		<div class="page-header">
			<div class="well">
				<h3>
				<%	
               int i=0;	
               synchronized(application){
	           if(application.getAttribute("times")==null){
		       i=1;		
	           }		
	           else{		
		       i=Integer.parseInt((String)application.getAttribute("times"));
		       i++;		
	           }		
	           application.setAttribute("times", Integer.toString(i));	
	         }%>
                           网站访问人数：<%= i%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       
					<img src="images/<%=user.getHeadPic()%>">：[<%=user.getUsername() %>]访问&nbsp;&nbsp; 
						<button  type="button" class="">
						   <span class="glyphicon glyphicon-edit">
							</span>&nbsp;&nbsp;
							   <a href="updata.action?id=<%=user.getId()%>">修改信息</a>
								  </button>	
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="shopcar.action" class="btn btn-danger">我的购物车</a>&nbsp;&nbsp;
					<a href="logout.jsp" class="btn btn-primary"> <span
						class="glyphicon glyphicon-log-out"></span>&nbsp;退出
					</a>
				</h3>
			</div>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<div class="panel-title">衣微橱窗列表
				<div class="input-group">
      <input type="text" class="form-control" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-zoom-in"></span></button>
      </span>
    </div></div>
			</div>
			<div class="panel-body">
				<!-- bootstrap默认将一行分成12格 -->
				<div class="row">
					<%
						// 查找所有图书信息，返回集合
						List<Cloth> cloths =  (List<Cloth>)request.getAttribute("cloths");
						// 循环遍历集合
						for(Cloth cloth : cloths){
							%>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<!-- 通常开发中建议只传一个id过去 -->
						<a href="view.action?id=<%=cloth.getId()%>"> <img
							src="images/<%=cloth.getImage() %>" height="120">
						</a>
						<h4><%=cloth.getName() %></h4>
						<p><%=cloth.getAuthor() %></p>
						<p><%=cloth.getPublication() %></p>
						<p><font color="red"><%=cloth.getPrice() %> /元</font></p>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>