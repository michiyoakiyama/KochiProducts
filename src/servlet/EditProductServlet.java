package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Product;
import dao.ProductDAO;

/**
 * Servlet implementation class EditProductServlet
 */
@WebServlet("/edit_product")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductServlet() {
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
		request.getRequestDispatcher("/WEB-INF/jsp/edit_product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String description = request.getParameter("description");
		int status = Integer.parseInt(request.getParameter("status"));
		String category = request.getParameter("category");

		String file_name = request.getParameter("file_name");

		ProductDAO productDAO = new ProductDAO();


		productDAO.updateProduct(id, name, price, stock, description, file_name, status, category);

		doGet(request, response);
	}

}
