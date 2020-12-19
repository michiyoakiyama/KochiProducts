package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Product;
import bean.User;
import dao.ProductDAO;

/**
 * Servlet implementation class ProductsServlet
 */
@WebServlet("/products")
public class ProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if( user == null ){
 			user = new User();
 			user.setName("ゲスト");
		}
		request.setAttribute("user", user);

		/*if( user == null ){
			// ログインしていない場合（直接リクエスト）
			response.sendRedirect("/KochiProducts/login");
			return;
		}*/

		// DBから商品データを取得するために、ProductDAOを生成
		ProductDAO productDAO = new ProductDAO();

		// GET送信されたキーワードを取得
		String keyword = request.getParameter("keyword");
		// GET送信されたカテゴリーを取得
		String category = request.getParameter("category");
		// 商品リストを代入するための変数を宣言
		List<Product> products;

		if (keyword != null) {
			// キーワードが送信されていればキーワード検索
			products = productDAO.getProductsByKeyword(keyword);
		} else if(category != null) {
			// カテゴリーが送信されていればキーワード検索
			products = productDAO.getProductsByCategory(category);
		} else {
			// どちらも送信されていなければ、全ての公開されている商品を取得
			products = productDAO.getOpenProducts();
		}

		request.setAttribute("products", products);
	    request.getRequestDispatcher("/WEB-INF/jsp/products.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
