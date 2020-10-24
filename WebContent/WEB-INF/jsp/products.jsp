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
<title>商品一覧</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="./stylesheets/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-sm navbar-light bg-light">
			<a class="navbar-brand logo" href="./products">知っちゅう?高知</a>
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
		</nav>
	</header>
	<div class="main">
		<div class="container contents">
			<h1 class="main_title">商品一覧</h1>
			<p>ようこそ、${user.name}さん。</p>
			<div class="row">
				<form class="search col-6">
					<div class="input-group">
						<input class="form-control" type="text" name="keyword"
							placeholder="商品名の一部を入れて検索"> <span
							class="input-group-append"> <input
							class="btn btn-outline-secondary" type="submit" value="検索">
						</span>
					</div>
				</form>
			</div>


			<div id="carouselExampleSlidesOnly" class="carousel slide"
				data-ride="carousel">
				<!-- インジケータの設定 -->
				<ol class="carousel-indicators">
					<li data-target="carouselExampleSlidesOnly" data-slide-to="0"
						class="active<">"></li>
					<li data-target="carouselExampleSlidesOnly" data-slide-to="1"></li>
					<li data-target="carouselExampleSlidesOnly" data-slide-to="2"></li>
				</ol>
				<!-- スライドさせる画像の設定 -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="https://placehold.jp/960x300.png"
							alt="第1スライド">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="https://placehold.jp/960x300.png"
							alt="第2スライド">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="https://placehold.jp/960x300.png"
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
			<div class="contents">
				<div class="row">
					<div class="col-3">
						<nav class="card category">
							<h2 class="nav_title text-center">カテゴリから検索</h2>
							<ul class="list-group category_menu">
								<li class="list-group-item"><a
									href="./products?category=魚介類">魚介類</a></li>
								<li class="list-group-item"><a
									href="./products?category=肉類">肉類</a></li>
								<li class="list-group-item"><a
									href="./products?category=くだもの">くだもの</a></li>
								<li class="list-group-item"><a
									href="./products?category=野菜類">野菜類</a></li>
							</ul>
						</nav>
					</div>
					<div class="col-9">
						<c:if test="${products == null || products.size() == 0}">
							<p>商品はありません。</p>
						</c:if>
						<c:if test="${products != null && products.size() > 0}">

							<c:forEach var="product" items="${products}">
								<div class="card product">
									<div class="row product_row">
										<div class="col-6 product_figure">
											<img class="img-fluid" src="./images/${product.image}" />
										</div>
										<div class="col-6 product_description">
											<h2 class="product_title">
												<a href="/show_product?id=${product.id }">${product.name}</a>
											</h2>
											<c:if test="${product.stock > 0}">
												<div>
													<c:out value="${product.price }" />
													円
												</div>
											</c:if>
											<c:if test="${product.stock == 0}">
												<div>売り切れ</div>
											</c:if>
											<div>
												<c:out value="${product.description }" />
											</div>
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#Modal${product.id}">
												ココを押すと表示</button>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="text-center">
		<p>
			<a href="./about.html">このサイトについて</a>
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
						<img class="img-fluid" src="./images/${product.image}" />
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
		<!-- /.modal -->

	</c:forEach>
</body>
</html>