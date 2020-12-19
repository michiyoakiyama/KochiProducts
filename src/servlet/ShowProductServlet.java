package servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Product;
import bean.User;
import dao.OrderDAO;
import dao.ProductDAO;
/**
 * Servlet implementation class ShowProductServlet
 */
@WebServlet("/show_product")
public class ShowProductServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
    /**
      * @see HttpServlet#HttpServlet()
      */
    public ShowProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
  /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ProductDAO productDAO = new ProductDAO();
    int id = Integer.parseInt(request.getParameter("id"));
    Product product = productDAO.getProduct(id);
    request.setAttribute("product", product);
    request.getRequestDispatcher("/WEB-INF/jsp/show_product.jsp").forward(request, response);
  }
  /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");
	    if( user == null ){
	      // ログインしていない場合（直接リクエスト）
	      response.sendRedirect("/KochiProducts/login");
	      return;
	    }
	    int product_id = Integer.parseInt(request.getParameter("product_id"));
	    int amount = Integer.parseInt(request.getParameter("amount"));
	    String message = request.getParameter("message");
	    OrderDAO orderDAO = new OrderDAO();
	    orderDAO.insertOrder(user.getId(), product_id, amount, message, "未発送");
	    request.getRequestDispatcher("/WEB-INF/jsp/order_confirm.jsp").forward(request, response);
	  }
}
