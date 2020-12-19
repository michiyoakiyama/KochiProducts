<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="bean.User"%>
<%@ page import="bean.Product"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳細</title>
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
  integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
  crossorigin="anonymous">
<link rel="stylesheet" href="./stylesheets/style.css">

<!-- BootStrap4 用の javascriptの読み込み -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<style>
.navbar-light .navbar-brand.logo {
	font-size: 35px;
	font-weight: bold;
}
.navbar {
	background-color: #375E97;
	padding: 0px 15px 0px 15px;
}
.nav-item {
	margin-top: 10px;
}
.input-group {
	margin: 20px
}
ul{
	list-style: none;
}
.col-6 {
	height: 350px;
}
.product-name {
	font-family: serif;
	font-size: 10px;
	color: black;
}
.product-price {
	margin-bottom: 10px;
}
.container {
    margin-top: 50px;
    position: relative;
    min-height: 100%;
    height: auto !important;
    height: 100%;
}
.price-font {
	font-size: 20px;
	margin-bottom: 30px;
}
.descreption{
	margin: 30px;
}
input {
	margin-bottom: 10px;
}
label {
	width: 70px;
}
.input-num {
	width: 40px;
}
.order-button {
	width: 200px;
	height: 50px;
}

footer {
    position: absolute;
    bottom: 0;
    width: 100%;
    height: 50px;
}
.message {
	height: 60px;
}
.product_details {
	font-family: serif;
}
.image-and-details {
	justify-content: space-evenly;
}
.comment {
	margin-top: 70px;
	font-size: 20px;
	border-bottom: dashed 1px;
}
</style>

</head>
<body>
  <header>
    		<nav class="navbar navbar-expand-sm navbar-light bg-light">
			<a class="navbar-brand logo" href="./products">HAPPY FRUITS</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#header_nav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="header_nav">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="./orders">注文一覧</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="./logout">ログアウト</a>
					</li>
				</ul>
			</div>
			<!-- 商品の検索 -->
			<form class="search col-4">
				<div class="input-group">
					<input class="form-control" type="text" name="keyword"
						placeholder="商品名の一部を入れて検索"> <span
						class="input-group-append"> <input
						class="btn btn-outline-secondary" type="submit" value="検索">
					</span>
				</div>
			</form>
			</nav>
  </header>

	<div class="container">
		<div class="row image-and-details">
			<div class="product_image col-6">
				<img src="./images/${product.image}" class="img-fluid">
			</div>
			<div class="product_details col-5">
				<h2 class="product_name">${product.name}</h2>
				<c:if test="${product.stock > 0}">
							<p class="price-font">￥<c:out value="${product.price }" /> +tax</p>
					</c:if>
				<c:if test="${product.stock == 0}">
					<div>売り切れ</div>
				</c:if>
				<form method="post">
					<div>
						<label for="amount" class="label-and-input">注文数量</label> <input type="number"
							name="amount" min="1" id="amount" class="input-num">
					</div>
					<div>
						<label for="message" class="align-middle message">ご要望</label>
						<textarea name="message" id="message"></textarea>
					</div>
					<div>
						<input type="hidden" name="product_id" value="${product.id}">
						<input type="submit" value="注文する" class="order-button">
					</div>
			</div>
			</form>
		</div>
		<p class="comment">comment</p>
		<div class="descreption">
			<c:out value="${product.description }" />
		</div>
	</div>


	<footer class="text-center">
    <p>
      <small>&copy;CodeCamp All Rights Reserved.</small>
    </p>
  </footer>
</body>
</html>