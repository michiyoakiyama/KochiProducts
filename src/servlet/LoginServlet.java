package servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// フォワード処理
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメータの取得
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		if(name == null | password == null) {
			// ログイン失敗時のメッセージをリクエストスコープに保存
			request.setAttribute("loginFailure", "ログインに失敗しました。もう一度入力してください。");
			doGet(request, response);
			return;
		}

		UserDAO userDAO = new UserDAO();
		User user;
		try {
			user = userDAO.getUserByName(name);
		} catch (SQLException | ClassNotFoundException e) {
			response.sendRedirect("/KochiProducts/error.jsp");
			return;
		}

		if (user == null) {
			// ログイン失敗時のメッセージをリクエストスコープに保存
			request.setAttribute("loginFailure", "ログインに失敗しました。もう一度入力してください。");
			doGet(request, response);
			return;
		}

		try {
			// ハッシュ関数を利用するためのインスタンス
			MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
			// ハッシュ関数を利用して文字列を変換
			String hashed_password = String.format("%040x", new BigInteger(1, sha256.digest(password.getBytes())));
			// 確認用
			System.out.println("SHA-256：" + hashed_password);
		} catch (NoSuchAlgorithmException e) {
			System.out.println(e.getMessage());
		}

		// ログイン処理
		if (password.equals(user.getPassword()) == false) {
			// ログイン失敗時のメッセージをリクエストスコープに保存
			request.setAttribute("loginFailure", "ログインに失敗しました。もう一度入力してください。");
			doGet(request, response);
			return;
		}

		// ユーザ情報をセッションスコープに保存
		HttpSession session = request.getSession();
		session.setAttribute("user", new User(name, password));
		// トップへ
		response.sendRedirect("/KochiProducts/products");
	}
}