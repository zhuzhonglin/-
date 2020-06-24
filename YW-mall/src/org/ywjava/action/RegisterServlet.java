package org.ywjava.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.ywjava.bean.User;
import org.ywjava.service.JDService;

/**
 * Servlet implementation class RegisterServlet
 web 2.5使用xml映射请求 
 <servlet>
  	<servlet-name>registerServlet</servlet-name>
  	<servlet-class>org.fkjava.action.RegisterServlet</servlet-class>
  </servlet>
  <servlet-mapping>
  	<servlet-name>registerServlet</servlet-name>
  	<url-pattern>/registrer.action</url-pattern>
  </servlet-mapping>
  
 */
@MultipartConfig
@WebServlet("/register.action")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 * 1.http协议是使用一定格式保证网络数据传输，http协议将数据按照key:value的形式，打包成http数据包通过网络传输。
	 * 2.web程序根据http协议解析数据包，处理请求，将响应结果再次打成http数据包，返回给客户端浏览器。
	 * 3.浏览器解析http数据包，展示数据。
	 * 
	 * Tomcat帮助我们解析http协议，生成一个HttpServletRequest对象，将获取的请求数据封装到HttpServletRequest对象当中。
	 * 又生成一个HttpServletResponse对象，做完参数传递到service方法当中。
	 * 
	 * http信息： loginname36750064@qq.com
	 * key: value;key: value;key: value;key: value;key: value
	 * Content-lenght:43  
	 * 
	 */
	protected void service(
			HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		// 1. 接收参数
		// <input type="text" name="loginname">
		String loginname = request.getParameter("loginname");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		String sex = request.getParameter("sex");
		Integer age = Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		System.out.println(loginname);
		System.out.println(password);
		System.out.println(username);
		System.out.println(sex);
		System.out.println(age);
		System.out.println(address);
		System.out.println(phone);
		System.out.println(email);

		/************文件上传**************************/
		// 服务器会将上传的文件封装成Part对象
		// <input class="form-control" type="file" name="headPic">
		Part part = request.getPart("headPic");
		// 获得上传的文件名
		String headPic = part.getSubmittedFileName();
		System.out.println(headPic);
		// 获取上传文件路径,注意是服务器Tomcat的路径，而不是源代码路径
		String path = this.getServletContext().getRealPath("/images");
		System.out.println(path);
		// 文件上传
		part.write(path + "/" + headPic);
		/**************************************/
		
		User user = new User();
		user.setLoginname(loginname);
		user.setPassword(password);
		user.setUsername(username);
		user.setSex(sex);
		user.setAddress(address);
		user.setAge(age);
		user.setPhone(phone);
		user.setEmail(email);
		user.setHeadPic(headPic);
		
		// 2. 将数据保存到数据库的tb_user表
		JDService service = new JDService();
		// 调用注册方法
		service.register(user);
		
		// 3. 转发页面
		request.setAttribute("message", "注册成功!");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	
}
}
