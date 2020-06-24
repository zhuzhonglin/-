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
 * Servlet implementation class Supdata
 */
@WebServlet("/supdata.action")
public class Supdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Supdata() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("进入SuccesupdataServlet -->");
	     
         String loginname = request.getParameter("loginname");
 		String password = request.getParameter("password");
 		String username = request.getParameter("username");
 		String sex = request.getParameter("sex");
 		String age = request.getParameter("age");
 		String address = request.getParameter("address");
 		String phone = request.getParameter("phone");
 		String email = request.getParameter("email");
 		Integer id = Integer.parseInt(request.getParameter("id"));
		
		System.out.println(id);
		System.out.println(loginname);
		System.out.println(password);
		System.out.println(username);
		System.out.println(sex);
		System.out.println(age);
		System.out.println(address);
		System.out.println(phone);
		System.out.println(email);

		/************文件上传**************************/
//		// 服务器会将上传的文件封装成Part对象
//		// <input class="form-control" type="file" name="headPic">
//		Part part = request.getPart("headPic");
//		// 获得上传的文件名
//		String headPic = part.getSubmittedFileName();
//		System.out.println(headPic);
//		// 获取上传文件路径,注意是服务器Tomcat的路径，而不是源代码路径
//		String path = this.getServletContext().getRealPath("/images");
//		System.out.println(path);
//		// 文件上传
//		part.write(path + "/" + headPic);
		/**************************************/
		
		User user = new User();
		user.setId(id);
		user.setLoginname(loginname);
		user.setPassword(password);
		user.setUsername(username);
		user.setSex(sex);
		user.setAddress(address);
		user.setAge(Integer.parseInt(age));
		user.setPhone(phone);
		user.setEmail(email);
//		user.setHeadPic(headPic);
		// 2. 将数据保存到数据库的tb_user表
		JDService service = new JDService();
		// 调用修改方法
		User user1 = service.supdata(user);
		
		// 3. 转发页面
		request.setAttribute("message", "修改成功，请重新登录!");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	
	}

}
