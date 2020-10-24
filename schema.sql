CREATE TABLE users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name TEXT,
  password TEXT
);

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
  status INT,
  category TEXT
);

INSERT INTO
  products (name, price, stock, description, image, status, category)
  VALUES(
    '商品サンプル',
    100,
    100,
    '商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。',
    'dummy.png',
    1,
    '魚介類'
  ),
  (
    '商品サンプル2',
    100,
    100,
    '商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。',
    'dummy.png',
    1,
    '果物'
  ),
  (
    '商品サンプル3',
    100,
    100,
    '商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。商品サンプルです。',
    'dummy.png',
    1,
    '肉類'
  );

CREATE TABLE orders(
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  product_id INT,
  amount INT,
  message TEXT,
  fulfillment_status TEXT
);