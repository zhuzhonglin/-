package org.ywjava.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ywjava.bean.Cloth;
import org.ywjava.service.JDService;

/**
 * Servlet implementation class ShopcartServlet
 */
@WebServlet("/shopcar.action")
public class ShopcartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopcartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得session,request先从请求中查询JSESSIONID是否有值，如果有，通过JSESSIONID找到对应的session对象
		// 如果没有，创建一个session对象。
		HttpSession session = request.getSession();
		// 从session中查找购物车
		/**
		 * 购物车 Map{key=value,1=2,2=1,3=10}
		 * */
	
		Map<Integer, Integer> shopcar 
			= (Map<Integer, Integer>)session.getAttribute("shopcar");
		if (shopcar==null) {
			List<Cloth> shopcarList = new ArrayList<>();
			session.setAttribute("shopcarlist", shopcarList);
			request.getRequestDispatcher("shopcar.jsp").forward(request, response);
			
		}else {
		/*************获取购物车数据*****************************/
		List<Cloth> shopcarList = new ArrayList<>();
		// 循环购物车每一个数据
		for(Integer clothId : shopcar.keySet()) {
			JDService service = new JDService();
			// 根据id找到对应的书籍
			Cloth cloth = service.findById(clothId);
			// 保存购买数量
			cloth.setCount(shopcar.get(clothId));
			// 添加到集合
			shopcarList.add(cloth);
		}
		request.setAttribute("shopcarList", shopcarList);
		request.getRequestDispatcher("shopcar.jsp").forward(request, response);
		/******************************************/
		}
	}

}
