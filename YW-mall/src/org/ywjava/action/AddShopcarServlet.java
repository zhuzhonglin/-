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

/**
 * Servlet implementation class AddShopcarServlet
 */
@WebServlet("/addshopcar.action")
public class AddShopcarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShopcarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void service(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得详情页面传递的书籍id和购买数量
		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer count = Integer.parseInt(request.getParameter("count"));
		
		// 获得session,request先从请求中查询JSESSIONID是否有值，如果有，通过JSESSIONID找到对应的session对象
		// 如果没有，创建一个session对象。
		HttpSession session = request.getSession();
		// 从session中查找购物车
		Map<Integer, Integer> shopcar 
			= (Map<Integer, Integer>)session.getAttribute("shopcar");
		if(shopcar == null) {
			// 说明是第一次购买
			shopcar = new HashMap<>();
			shopcar.put(id, count);
			// 将购物车添加到session
			session.setAttribute("shopcar", shopcar);
		}else {
			// 再次购买有两种情况 a. 购物的是新商品  b. 再次购买同一种商品
			// 根据key找到值
			Integer oldValue = shopcar.get(id);
			if(oldValue != null) {
				// b. 再次购买同一种商品
				shopcar.put(id, count + oldValue);
			}else {
				// a. 购物的是新商品
				shopcar.put(id, count);
			}
			
		}
		
		System.out.println(shopcar);
		
		response.sendRedirect("shopcar.action");
		
		
		
	}

}





