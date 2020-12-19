<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.Product"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//リクエストスコープからひとことリストを取得する
	//List<Employee> employees = (ArrayList<Employee>) request.getAttribute("employees");
%>
<!DOCTYPE html>
<html>
<head>

<!-- CDNから Bootstrapを読み込む -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>商品管理</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">


<style>
.navbar-light .navbar-brand.logo {
	font-size: 35px;
	font-weight: bold;
}

.nav-item {
	margin-top: 10px;
}

input {
	margin-top: 10px;
}

.admin-container {
	width: 90%;
	margin: 0 auto;
}

.product_table {
	border-collapse: collapse;
	margin-top: 20px;
}

.product_image {
	height: 70px;
}
th {
	border:none;
}

tr {
	font-size: 15px;
}

.row {
	margin: 20px 0px 20px 0px;
}

h1 {
	margin-top: 20px;
}
.admin-link {
	padding: 0px;
	color: black;
	text-decoration: none;
}

.admin-link:hover {
  color: gray;
  text-decoration: none;
}


.col {
	padding: 0px;
}

.search {
	padding: 0px;
}

.gg-add-r {
	box-sizing: border-box;
	position: relative;
	display: inline-block;
	width: 22px;
	height: 22px;
	border: 2px solid;
	transform: scale(var(- -ggs, 1));
	border-radius: 4px;
	margin: 0px 13px 5px 0px;

}

.gg-add-r::after, .gg-add-r::before {
	content: "";
	display: inline-block;;
	box-sizing: border-box;
	position: absolute;
	width: 10px;
	height: 2px;
	background: currentColor;
	border-radius: 5px;
	top: 8px;
	left: 4px
}

.gg-add-r::after {
	width: 2px;
	height: 10px;
	top: 4px;
	left: 8px
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
					<li class="nav-item"><a class="nav-link" href="./products">商品画面</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="./logout">注文一覧</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="./logout">ログアウト</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="admin-container">
		<h1><a class="admin-link" href="./admin">商品管理</a></h1>
		<div class="row">
			<!-- 商品検索 -->
			<form class="search col-4">
				<div class="input-group">
					<input class="form-control" type="text" name="keyword"
						placeholder="商品名の一部を入れて検索" autocomplete="off"> <span
						class="input-group-append"> <input
						class="btn btn-outline-secondary" type="submit" value="検索">
					</span>
				</div>
			</form>
			<div class="col col-8 text-right">
			<a href="./new_product">
				<button type="button"
					class="btn btn-danger btn-lg activ align-middle">
					<i class="gg-add-r align-middle"></i>新規追加
				</button>
			</a>
			</div>
		</div>

		<c:if test="${products == null || products.size() == 0}">
			<p>商品はありません。</p>
		</c:if>
		<c:if test="${products != null && products.size() > 0}">
			<table class="table table-striped ">
				<thead>
					<tr class="table-borderless">
						<th style="width:1%">ID</th>
						<th style="width:15%">名前</th>
						<th style="width:5%">金額</th>
						<th style="width:6%">在庫</th>
						<th style="width:32%">説明</th>
						<th>画像</th>
						<th class="width:10%">状態</th>
						<th class="width:21%">カテゴリ</th>
						<th class="width:10%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${products}">
						<tr>
							<td class="align-middle">${product.id }</td>
							<td class="align-middle">${product.name }</td>
							<td class="align-middle">¥${product.price }</td>
							<td class="align-middle">${product.stock }</td>
							<td class="align-middle">${product.description }</td>
							<td class="align-middle"><img class="product_image"
								src="./images/${product.image }" /></td>
							<td class="align-middle"><c:if test="${product.status == 1 }">
							<p>公開<p>
							</c:if> <c:if test="${product.status == 0 }">
							<p style="color:blue">非公開<p>
							</c:if></td>
							<td class="align-middle">${product.category }</td>
							<td class="align-middle"><a href="./edit_product?id=${product.id }"> <input
									type="submit" value="編集">
							</a>
								<form method="post" action="./delete_product">
									<input type="hidden" name="id" value="${product.id}"> <input
										type="submit" value="削除">
								</form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>