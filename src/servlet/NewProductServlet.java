package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import logic.FileManipulator;

/**
 * Servlet implementation class NewProductServlet
 */
@WebServlet("/new_product")
@MultipartConfig(maxFileSize = 1048576)
public class NewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/new_product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String name = request.getParameter("name");
		System.out.println(name);
		int price = Integer.parseInt(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String description = request.getParameter("description");
		int status = Integer.parseInt(request.getParameter("status"));
		String category = request.getParameter("category");

		FileManipulator manipulator = new FileManipulator();
		String file_name = manipulator.saveFile(request.getPart("image"));

		ProductDAO productDAO = new ProductDAO();


		productDAO.insertProduct(name, price, stock, description, file_name, status, category);

		doGet(request, response);
	}

}
