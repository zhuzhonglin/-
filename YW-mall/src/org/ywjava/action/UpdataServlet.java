package org.ywjava.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ywjava.bean.User;
import org.ywjava.service.JDService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/updata.action")
public class UpdataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入UpdataServlet -->");
		// 获取参数
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		
		// 调用服务层
		JDService service = new JDService();
		
		User user = service.updata(id);
		
		if(user!= null) {
			// 跳转到首页
			HttpSession session = request.getSession();
			System.out.println(session.getId());
			request.setAttribute("user", user);
			// request.setAttribute("user", user);
			//request.getServletContext().setAttribute("user", user);
			// 跳转到main.action，因为mvc模式先跳转到控制器
			//request.getRequestDispatcher("main.action").forward(request, response);
			request.getRequestDispatcher("updata.jsp").forward(request, response);
		}else {
			request.setAttribute("message", "用户不存在!");
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		}
		
	}

}
