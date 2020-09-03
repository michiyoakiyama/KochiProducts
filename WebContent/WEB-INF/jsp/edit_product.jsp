<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品情報の編集</title>
</head>
<body>
	<h1>商品情報の編集</h1>

	<form method="post">
		<div>
			<label> 名前: <input type="text" name="name" value="${product.name }">
			</label>
		</div>
		<div>
			<label> 価格: <input type="text" name="price" value="${product.price }">
			</label>
		</div>
		<div>
			<label> 在庫数: <input type="text" name="stock" value="${product.stock }">
			</label>
		</div>
		<div>
			<label>
				説明: <br>
				<textarea name="description">${product.description }</textarea>
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
		 <input type="hidden" name="file_name" value="${product.image}">
		<div>
			<input type="submit" value="更新">
		</div>
	</form>
	<p>
			<a href="./admin">商品管理画面に戻る</a>
		</p>
</body>
</html>

