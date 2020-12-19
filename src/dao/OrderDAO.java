package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderDAO {
	private static final long serialVersionUID = 1L;
	private final String DRIVER_NAME = "org.h2.Driver";
	private final String JDBC_URL = "jdbc:h2:~/h2_db/kouchi";
	private final String DB_USER = "sa";
	private final String DB_PASS = "";

	public boolean insertOrder(
			int user_id,
			int product_id,
			int amount,
			String message,
			String fulfillment_status) {
		String sql = "INSERT INTO orders (user_id, product_id, amount, message, fulfillment_status)"
				+ " VALUES (?, ?, ?, ?, ?)";
		Connection connection = null;
		int result = 0;
		PreparedStatement statement = null;
		try {
			connection = connect();
			statement = connection.prepareStatement(sql);
			statement.setInt(1, user_id);
			statement.setInt(2, product_id);
			statement.setInt(3, amount);
			statement.setString(4, message);
			statement.setString(5, fulfillment_status);
			result = statement.executeUpdate();
			if (result != 1) {
				return false;
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} finally {
			allClose(statement, connection);
		}
		return true;
	}

	private void allClose(PreparedStatement statement, Connection connection) {
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	private Connection connect() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER_NAME);
		return DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
	}
}