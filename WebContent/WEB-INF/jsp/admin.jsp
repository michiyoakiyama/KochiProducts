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
<meta charset="UTF-8">
<title>商品管理</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="./stylesheets/style.css">
</head>
<body>
	<h1>商品管理</h1>

	<a href="./new_product">新規追加</a>

	<c:if test="${products == null || products.size() == 0}">
		<p>商品はありません。</p>
	</c:if>
	<c:if test="${products != null && products.size() > 0}">
		<table class="product_table">
			<thead>
				<tr>
					<th>名前</th>
					<th>金額</th>
					<th>在庫数</th>
					<th>説明</th>
					<th>画像</th>
					<th>ステータス</th>
					<th>カテゴリー</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${products}">
					<tr>
						<td>${product.name }</td>
						<td>${product.price }</td>
						<td>${product.stock }</td>
						<td>${product.description }</td>
						<td><img class="product_image" src="./images/${product.image }" /></td>
						<td>${product.status }</td>
						<td>${product.category }</td>
						<td>
							<a href="./edit_product?id=${product.id }">商品情報を編集</a>
							<form method="post" action="./delete_product">
								<input type="hidden" name="id" value="${product.id}">
								<input type="submit" value="削除">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</body>
</html>