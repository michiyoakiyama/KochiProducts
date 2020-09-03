<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品の新規登録</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
	<h1>商品の新規登録</h1>

	<form method="post" enctype="multipart/form-data">
		<div>
			<label> 名前: <input type="text" name="name">
			</label>
		</div>
		<div>
			<label> 価格: <input type="text" name="price">
			</label>
		</div>
		<div>
			<label> 在庫数: <input type="text" name="stock" value="<c:out value='${product.stock }' />">
			</label>
		</div>
		<div>
			<label>
				説明: <br>
				<textarea name="description"><c:out value='${product.stock }' /></textarea>
			</label>
		</div>
		<div>
			<label> 画像: <input type="file" name="image">
			</label>
		</div>
		<div>
			<select name="status">
				<option value="0" <c:if test='${product.status == 0 }'>selected</c:if> >
					非公開
				</option>
				<option value="1" <c:if test='${product.status == 1 }'>selected</c:if> >
					公開
				</option>
			</select>
		</div>
		<div>
			<select name="category">
				<option value="魚介類" <c:if test='${product.category == "魚介類" }'>selected</c:if> >
					魚介類
				</option>
				<option value="肉類" <c:if test='${product.category == "肉類" }'>selected</c:if> >
					肉類
				</option>
				<option value="くだもの" <c:if test='${product.category == "くだもの" }'>selected</c:if> >
					くだもの
				</option>
				<option value="野菜類" <c:if test='${product.category == "野菜類" }'>selected</c:if> >
					野菜類
				</option>
			</select>
		</div>
		<div>
			<input type="submit" value="新規作成">
		</div>
	</form>
	<p>
			<a href="./admin">商品管理画面に戻る</a>
		</p>
</body>
</html>