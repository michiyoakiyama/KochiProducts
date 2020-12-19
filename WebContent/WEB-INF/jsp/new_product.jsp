<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- CDNから Bootstrapを読み込む -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>商品の新規登録</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
.navbar-light .navbar-brand.logo {
	font-size: 35px;
	font-weight: bold;
}
.nav-item {
	margin-top: 10px;
}
h1 {
	margin: 20px 0px;
}
.row {
	margin-bottom: 15px;
	font-size: 16px;
}
.new-buttun {
	width: 100px;
	margin-top: 20px;
}
.col-1 {
	margin: 0px;
}
</style>

</head>
<body>
<header>
	  <nav class="navbar navbar-expand-sm navbar-light bg-light">
	    <a class="navbar-brand logo" href="./products">HAPPY FRUITS</a>
	    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#header_nav">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="header_nav">
	      <ul class="navbar-nav mr-auto">
	        <li class="nav-item">
	          <a class="nav-link" href="./admin">商品管理</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="./logout">ログアウト</a>
	        </li>
	      </ul>
	    </div>
	  </nav>
	</header>
	<div class="container contents">
		<h1>商品の新規登録</h1>

	<form method="post" enctype="multipart/form-data">
		<div class="row">
			<label class="col-1">名前</label>
			<input type="text" name="name" class="form-control col-10">
		</div>
		<div class="row">
			<label class="col-1">価格</label>
			<input type="text" name="price" class="form-control col-10">
		</div>
		<div class="row">
			<label class="col-1">在庫数</label>
			<input type="text" name="stock" value="<c:out value='${product.stock }' />" class="form-control col-10">
		</div>
		<div class="row">
			<label class="col-1">説明</label>
				<textarea name="description" rows="7" class="form-control col-10"><c:out value='${product.stock }' /></textarea>
		</div>
		<div class="row">
			<label class="col-1">画像</label>
			<input type="file" name="image">
		</div>
		<div class="row">
			<label class="col-1">状態</label>
			<select name="status" class="form-control col-2">
				<option value="0" <c:if test='${product.status == 0 }'>selected</c:if> >
					非公開
				</option>
				<option value="1" <c:if test='${product.status == 1 }'>selected</c:if> >
					公開
				</option>
			</select>
		</div>
		<div class="row">
			<label class="col-1">種類</label>
			<select name="category" class="form-control col-2">
				<option value="今が旬" <c:if test='${product.category == "今が旬" }'>selected</c:if> >
					今が旬
				</option>
				<option value="贈り物" <c:if test='${product.category == "贈り物" }'>selected</c:if> >
					贈り物
				</option>
				<option value="ご褒美" <c:if test='${product.category == "ご褒美" }'>selected</c:if> >
					ご褒美
				</option>
			</select>
			</div>
		<div>
			<input type="submit" value="新規作成" class="new-buttun">
		</div>
	</form>
		</div>
</body>
</html>