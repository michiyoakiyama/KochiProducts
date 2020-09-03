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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="./stylesheets/style.css">
</head>
<body>
	<header>
	  <nav class="navbar navbar-expand-sm navbar-light bg-light">
	    <a class="navbar-brand logo" href="./products">知っちゅう?高知</a>
	    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#header_nav">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="header_nav">
	      <ul class="navbar-nav mr-auto">
	        <li class="nav-item">
	          <a class="nav-link" href="./orders">注文一覧</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="./logout">ログアウト</a>
	        </li>
	      </ul>
	    </div>
	  </nav>
	</header>
	<main>
		<div class="container contents">
			<h1 class="main_title">商品一覧</h1>
			<p>ようこそ、${user.name}さん。</p>
			<div class="row">
				<form class="search col-6">
					<div class="input-group">
						<input class="form-control" type="text" name="keyword" placeholder="商品名の一部を入れて検索">
						<span class="input-group-append">
							<input class="btn btn-outline-secondary" type="submit" value="検索" >
						</span>
					</div>
				</form>
			</div>
			<div class="row">
				<div class="col-3">
					<nav class="card category">
						<h2 class="nav_title text-center">カテゴリから検索</h2>
						<ul class="list-group category_menu">
							<li class="list-group-item"><a href="./products?category=魚介類">魚介類</a></li>
							<li class="list-group-item"><a href="./products?category=肉類">肉類</a></li>
							<li class="list-group-item"><a href="./products?category=くだもの">くだもの</a></li>
							<li class="list-group-item"><a href="./products?category=野菜類">野菜類</a></li>
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
										<h2 class="product_title"><a href="/show_product?id=${product.id }">${product.name}</a></h2>
										<c:if test="${product.stock > 0}">
											<div><c:out value="${product.price }" />円</div>
										</c:if>
										<c:if test="${product.stock == 0}">
											<div>売り切れ</div>
										</c:if>
										<div><c:out value="${product.description }" /></div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>

		</div>
	</main>
	<footer class="text-center">
		<p><small>&copy;CodeCamp All Rights Reserved.</small></p>
	</footer>
</body>
</html>