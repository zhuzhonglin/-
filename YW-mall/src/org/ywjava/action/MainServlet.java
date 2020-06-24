package org.ywjava.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ywjava.bean.Cloth;
import org.ywjava.service.JDService;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main.action")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入MainServlet -->");
		JDService service = new JDService();
		List<Cloth> cloths = service.findAllcloth();
		request.setAttribute("cloths", cloths);
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}

}
