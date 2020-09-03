package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.UserDAO;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.getRequestDispatcher("/WEB-INF/jsp/signup.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String name = request.getParameter("name");
	    String password = request.getParameter("password");

		List<String> errors = new ArrayList<String>();
	    if( name == "" ) {
	      errors.add("ユーザー名を入力してください。");
	    }
	    if( password == "" ) {
	    	errors.add("パスワードを入力してください。");
	    }
	    if(errors.size() > 0) {
	    	request.setAttribute("errors", errors);
		    doGet(request, response);
		    return;
	    }

	    UserDAO userDAO = new UserDAO();
		userDAO.insertUser(name, password);

		User user = userDAO.getUserByName(name);
	    // 登録したユーザ情報をセッションスコープに保存
	    HttpSession session = request.getSession();
	    session.setAttribute("user", user);
	    // トップへ
	    response.sendRedirect("/KochiProducts/products");
	}

}
