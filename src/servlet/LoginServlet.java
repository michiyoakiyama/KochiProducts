package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public LoginServlet() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // フォワード処理
    request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// リクエストパラメータの取得
	    String name = request.getParameter("name");
	    String password = request.getParameter("password");

	    UserDAO userDAO = new UserDAO();
		User user = userDAO.getUserByName(name);

	    // ログイン処理
	    if( password.equals(user.getPassword()) == false ) {
	      // ログイン失敗時のメッセージをリクエストスコープに保存
	      request.setAttribute("loginFailure", "ログインに失敗しました。もう一度入力してください。");
	      doGet(request, response);
	      return;
	    }

	    // ユーザ情報をセッションスコープに保存
	    HttpSession session = request.getSession();
	    session.setAttribute("user", new User(name,password));
	    // トップへ
	    response.sendRedirect("/KochiProducts/products");
  }
}