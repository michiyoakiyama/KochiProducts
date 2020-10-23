package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.User;

public class UserDAO {
	private static final long serialVersionUID = 1L;
	private final String DRIVER_NAME = "org.h2.Driver";
    private final String JDBC_URL = "jdbc:h2:~/h2_db/kouchi";
    private final String DB_USER = "sa";
    private final String DB_PASS = "";

	public User getUser(int id) {
		String sql = "SELECT id,name,password FROM users"
				+ " WHERE id = ?";
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet result = null;
		try {
			connection = connect();
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			result = statement.executeQuery();
			result.next();
			return new User(
					result.getInt("id"),
					result.getString("name"),
					result.getString("password")
			);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			allClose(statement, connection);
		}
		return null;
	}

	public User getUserByName(String name) {
		String sql = "SELECT id,name,password FROM users"
				+ " WHERE name = ?";
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet result = null;
		try {
			connection = connect();
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			result = statement.executeQuery();
			result.next();
			return new User(
					result.getInt("id"),
					result.getString("name"),
					result.getString("password")
			);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			allClose(statement, connection);
		}
		return null;
	}

	public List<User> getUsers() {
		String sql = "SELECT id,name,password FROM users";
		List<User> users = new ArrayList<>();
		Connection connection = null;
		ResultSet result = null;
		PreparedStatement statement = null;
		try {
			connection = connect();
			statement = connection.prepareStatement(sql);

			result = statement.executeQuery();
			while (result.next()) {
				User user = new User(
						result.getInt("id"),
						result.getString("name"),
						result.getString("password")
				);
				// 11. リストにProductインスタンスを追加する
				users.add(user);
			}
			return users;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();

		} finally {
			allClose(statement, connection);
		}
		return null;
	}

	public boolean insertUser(
			String name,
			String password
	) {
		String sql = "INSERT INTO users (name, password)"
				+ " VALUES (?, ?)";
		Connection connection = null;
		int result = 0;
		PreparedStatement statement = null;
		try {
			connection = connect();
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			statement.setString(2, password);
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

	public boolean updateUser(
			int id,
			String name,
			String password) {
		String sql = "UPDATE users SET name = ?,password = ? WHERE id = ? ";
		Connection connection = null;
		int result = 0;
		PreparedStatement statement = null;
		try {
			connection = connect();
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			statement.setString(2, password);
			statement.setInt(3, id);
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

	public boolean deleteUser(int id) {
		String sql = "DELETE FROM users WHERE id = ? ";
		Connection connection = null;
		int result = 0;
		PreparedStatement statement = null;
		try {
			connection = connect();
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
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

	private Connection connect() throws ClassNotFoundException, SQLException{
		Class.forName(DRIVER_NAME);
		return DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
	}
}
