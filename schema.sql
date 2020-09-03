CREATE TABLE users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name TEXT,
  password TEXT
)

INSERT INTO
  users (name, password)
  VALUES(
    'admin',
    'admin'
  ),(
    'testuser1',
    'password'
  ),(
    'testuser2',
    'password'
  ),(
    'testuser3',
    'password'
  );

CREATE TABLE products(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name TEXT,
  price INT,
  stock INT,
  description TEXT,
  image TEXT,
  status INT
)

CREATE TABLE orders(
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  product_id INT,
  amount INT,
  message TEXT,
  fulfillment_status TEXT,
)