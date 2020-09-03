package bean;

import java.io.Serializable;

public class User implements Serializable {
	// フィールドの定義
	private static final long serialVersionUID = 1L;
	private int id;
	private String name; //ユーザ名
	private String password; //パスワード

	// コンストラクタ（引数なし）
	public User() {
	}

	// コンストラクタ（引数あり）
	public User(String name, String password) {
		this.name = name;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public User(int id, String name, String password) {
		this.id = id;
		this.name = name;
		this.password = password;
	}

	//getterメソッド
	public String getName() {
		return this.name;
	}

	public String getPassword() {
		return this.password;
	}
}