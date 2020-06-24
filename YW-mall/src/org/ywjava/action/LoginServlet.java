package org.ywjava.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ywjava.bean.User;
import org.ywjava.service.JDService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.action")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入LoginServlet -->");
		// 获取参数
		response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
		String loginname = request.getParameter("loginname");
		String password = request.getParameter("password");
		// 把参数封装成Map对象
		Map<String, String> param = new HashMap<>();
		param.put("loginname", loginname);
		param.put("password", password);
		// 调用服务层
		JDService service = new JDService();
		
		User user = service.login(param);
		
		if(user != null) {
			Cookie[] cookie=request.getCookies();
            for (Cookie c:cookie){
                if(c.getName().equals("loginname")){
                   loginname=c.getValue();
                }else if(c.getName().equals("password")){
                    password=c.getValue();
                }
            }
            if(!loginname.equals("")||!password.equals("")){
            	HttpSession session = request.getSession();
    			System.out.println(session.getId());
    			session.setAttribute("user", user);
    			// request.setAttribute("user", user);
    			//request.getServletContext().setAttribute("user", user);
    			// 跳转到main.action，因为mvc模式先跳转到控制器
    			//request.getRequestDispatcher("main.action").forward(request, response);
    			response.sendRedirect("main.action");
            }else{
                  Cookie cookie1=new Cookie("loginname",loginname);
                        Cookie cookie2=new Cookie("password",password);
                        cookie1.setMaxAge(60*60);
                        cookie2.setMaxAge(60*60);
                        response.addCookie(cookie1);
                        response.addCookie(cookie2);
                            
			// 跳转到首页
			
			// request.setAttribute("user", user);
			//request.getServletContext().setAttribute("user", user);
			// 跳转到main.action，因为mvc模式先跳转到控制器
			//request.getRequestDispatcher("main.action").forward(request, response);
			response.sendRedirect("main.action");
		}
            }else {
			request.setAttribute("message", "登录名或密码错误!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}
  }


	