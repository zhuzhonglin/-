package org.ywjava.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ywjava.bean.Cloth;
import org.ywjava.service.JDService;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/view.action")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入ViewServlet -->");
		// 接收参数id  <a href="view.action?id=<%=book.getId()%>">
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		JDService service = new JDService();
		
		Cloth cloth = service.findById(id);
		
		request.setAttribute("cloth", cloth);
		
		request.getRequestDispatcher("view.jsp").forward(request, response);
	}

}
