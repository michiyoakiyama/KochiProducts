<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.User"%>
<%@ page import="bean.Product"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	User user = (User) session.getAttribute("user");
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品一覧</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!-- BootStrap4 用の javascriptの読み込み -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./stylesheets/icon.css">

<style>
.carousel-inner {
	margin-bottom: 30px
}
.product_image {
	height: 150px;
}
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
.category-items {
	display: flex;
	justify-content: space-evenly;
	margin: 50px 0px 50px 0px;
	padding: 0px;
}
.category-title {
	font-size: 40px;
	color: black;
	margin: 0px;
}
a:hover {
	text-decoration: none;
}
.category-font-large{
	margin-top: 60px;
}
.category-font-small {
	margin-bottom: 40px;
}
ul{
	list-style: none;
	margin-left: 20px;
}
.category-button-season {
	 background-image: url("http://localhost:8080/KochiProducts/images/buntan.png");
	 border-radius: 50%;
	 width: 250px;
	 height: 250px;
	 font-family: serif;
	 font-size: 40px;
	 color: black;
	 transition-duration: 0.5s; /*変化の時間*/
}
.category-button-season:hover {
	 transform: scale(1.1,1.1); /*画像の拡大*/
	 cursor: pointer; /*カーソルをポインターにする*/
}
.category-button-present {
	 background-image: url("http://localhost:8080/KochiProducts/images/apple.png");
	 border-radius: 50%;
	 width: 250px;
	 height: 250px;
	 font-family: serif;
	 font-size: 40px;
	 color: black;
	 transition-duration: 0.5s; /*変化の時間*/
}
.category-button-present:hover {
	 transform: scale(1.1,1.1); /*画像の拡大*/
	 cursor: pointer; /*カーソルをポインターにする*/
}
.category-button-myself {
	 background-image: url("http://localhost:8080/KochiProducts/images/grape.png");
	 border-radius: 50%;
	 width: 250px;
	 height: 250px;
	 font-family: serif;
	 font-size: 40px;
	 color: black;
	 transition-duration: 0.5s; /*変化の時間*/
}
.category-button-myself:hover {
	 transform: scale(1.1,1.1); /*画像の拡大*/
	 cursor: pointer; /*カーソルをポインターにする*/
}
.search .btn.btn-outline-secondary {
	background-color: #f1eaf5;
}
.product.card {
	padding: 15px;
	margin-bottom: 15px;
	border: solid 1px white;
}
.product-title {
	margin: 0px;
}
.product-name {
	font-size: 20px;
	font-family: serif;
	color: black;
	margin: 20px 0px 5px 0px;
}
.product-price {
	margin-bottom: 10px;
}
.product_figure {
	/* padding: 10px; */
}
.zoom {
	overflow: hidden;	/*拡大時にはみ出た部分を隠す*/
	transition-duration: 0.5s; /*変化の時間*/
}
.zoom:hover {
	 transform: scale(1.03,1.03); /*画像の拡大*/
	 cursor: pointer; /*カーソルをポインターにする*/
}
.image_position {
    position: absolute;
    top: 0;
    left: 0;
    height: 20%;
}
.modal-image{
	margin-bottom: 15px;
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
					<c:choose>
						<c:when test='${user.name == "ゲスト" }'>
							<li class="nav-item"><a class="nav-link" href="./login"><i class="gg-log-in"></i>ログイン</a></li>
							<li class="nav-item"><a class="nav-link" href="./signup"><i class="gg-user-add"></i>サインアップ</a></li>
							<li class="nav-item"><a class="nav-link" href="./products"><i class="gg-mail"></i>問い合わせ</a></li>
						</c:when>
						<c:when test='${user.name == "admin" }'>
						<li class="nav-item"><a class="nav-link" href="./admin"><i class="gg-mouse"></i>管理画面</a></li>
						<li class="nav-item"><a class="nav-link" href="./orders"><i class="gg-shopping-cart"></i>注文一覧</a></li>
						<li class="nav-item"><a class="nav-link" href="./logout"><i class="gg-user-remove"></i>ログアウト</a></li>
						</c:when>
						<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="./signup"><i class="gg-user-add"></i>サインアップ</a></li>
						<li class="nav-item"><a class="nav-link" href="./logout"><i class="gg-user-remove"></i>ログアウト</a></li>
						<li class="nav-item"><a class="nav-link" href="./products"><i class="gg-mail"></i>お問い合わせ</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- 商品の検索 -->
			<form class="search col-4">
				<div class="input-group">
					<input class="form-control" type="text" name="keyword"
						placeholder="商品名の一部を入れて検索" autocomplete="off"> <span
						class="input-group-append"> <input
						class="btn btn-outline-secondary" type="submit" value="検索">
					</span>
				</div>
			</form>
		</nav>
		<nav class="navbar navbar-expand-sm navbar-light bg-light">
			<p>ようこそ、${user.name}さん。</p>
		</nav>
	</header>

		<div id="carouselExampleSlidesOnly" class="carousel slide"
			data-ride="carousel">
			<!-- インジケータの設定 -->
			<ol class="carousel-indicators">
				<li data-target="carouselExampleSlidesOnly" data-slide-to="0"
					class="active"></li>
				<li data-target="carouselExampleSlidesOnly" data-slide-to="1"></li>
				<li data-target="carouselExampleSlidesOnly" data-slide-to="2"></li>
			</ol>
			<!-- スライドさせる画像の設定 -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="http://localhost:8080/KochiProducts/images/product_slide_image/orange.png"
						alt="第1スライド">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="http://localhost:8080/KochiProducts/images/product_slide_image/muscat.png"
						alt="第2スライド">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="http://localhost:8080/KochiProducts/images/product_slide_image/bowl.png"
						alt="第3スライド">
				</div>
				<!-- /.carousel -->
			</div>
			<!-- /.carousel-inner -->
			<!-- スライドコントロールの設定 -->
			<a class="carousel-control-prev" href="#carouselExampleSlidesOnly"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleSlidesOnly"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

		<div class="container">
		<H1 class="category-font-large text-center">CATEGORY</H1>
		<p class="category-font-small text-center">カテゴリ</p>
		<ul class="category-items">
			<li>
				<a href="./products?category=今が旬">
					<p class="category-button-season">今が旬</p>
				</a>
			</li>
			<li>
				<a href="./products?category=贈り物">
					<p class="category-button-present">贈り物</p>
				</a>
			</li>
			<li>
				<a href="./products?category=ご褒美">
					<p class="category-button-myself">ご褒美</p>
				</a>
			</li>
		</ul>

		<H1 class="category-font-large text-center">PRODUCTS</H1>
		<p class="category-font-small text-center">商品一覧</p>

				<c:if test="${products == null || products.size() == 0}">
					<p>商品はありません。</p>
				</c:if>
				<c:if test="${products != null && products.size() > 0}">

					<div class="row">
					<c:forEach var="product" items="${products}">
						<!-- それぞれの商品表示 -->
						<div class="card product col-4">
								<!-- 商品画像 -->
								<div class="product_figure">
									<img class="img-fluid zoom" src="./images/${product.image}" data-toggle="modal" data-target="#Modal${product.id}" />
								</div>
								<c:if test='${product.category == "今が旬" }'>
								<img src="./images/m_e_new_293.png" class="image_position">
								</c:if>
								<!-- 商品説明 -->
								<div class="product_description">
									<h2  class="product-title">
										<p class="product-name">${product.name}</p>
									</h2>
									<c:if test="${product.stock > 0}">
										<div class="product-price">
											￥<c:out value="${product.price }" /> +tax
										</div>
									</c:if>
									<c:if test="${product.stock == 0}">
											<div>売り切れ</div>
									</c:if>
									<!-- <div>
										<c:out value="${product.description }" />
									</div> -->
									</div>
								<!-- モーダルのボタン -->
								<a href="./show_product?id=${product.id }"><button type="button" class="btn btn-outline-info col-12"
									data-toggle="modal" data-target="#Modal${product.id}">
									<i class="gg-shopping-cart"></i> 注文する</button></a>
							</div>
					</c:forEach>
					</div>
				</c:if>
			</div>
	<footer class="text-center">
		<p>
			<small>&copy;CodeCamp All Rights Reserved.</small>
		</p>
	</footer>

	<!-- モーダル -->
	<c:forEach var="product" items="${products}">
		<div class="modal fade" tabindex="-1" id="Modal${product.id}">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">${product.name}</h5>
						<button type="button" class="close" data-dismiss="modal"
          aria-label="閉じる">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<!-- /.modal-header -->
					<div class="modal-body">
						<img class="img-fluid modal-image" src="./images/${product.image}" />
						<p>${product.description }</p>
						</div>
					<!-- /.modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">閉じる</button>
					</div>
					<!-- /.modal-footer -->
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</c:forEach>
	<!-- /.modal -->
</body>
</html>