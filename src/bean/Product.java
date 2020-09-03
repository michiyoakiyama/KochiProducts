package bean;

import java.io.Serializable;

public class Product implements Serializable{
	private static final long serialVersionUID = 1L;

	private int id;
	private String name; //ユーザ名
	private int price;
	private int stock;
	private String description;
	private String image;
	private int status;
	private String category;

	public Product(String name, int stock, int price, String description, String image, int status, String category) {
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.description = description;
		this.image = image;
		this.status = status;
		this.category = category;
	}



	public Product(int id, String name, int price, int stock,  String description, String image, int status, String category) {
		this.id = id;
		this.name = name;
		this.stock = stock;
		this.price = price;
		this.description = description;
		this.image = image;
		this.status = status;
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
