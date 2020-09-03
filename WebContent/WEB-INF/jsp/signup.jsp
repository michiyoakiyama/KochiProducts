<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>おすすめ高知</title>
</head>
<body>
	<header>
	  <nav class="navbar navbar-expand-sm navbar-light bg-light">
	    <a class="navbar-brand" href="./product">おすすめ高知</a>
	    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#headerNav" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="ナビゲーションの切替">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="headerNav">
	      <ul class="navbar-nav mr-auto">
	        <li class="nav-item">
	          <a class="nav-link" href="./signup">サインアップ</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="./login">ログイン</a>
	        </li>
	      </ul>
	    </div>
	  </nav>
	</header>
	<h1>ユーザー登録</h1>
	<hr>
	<c:if test="${errors != null && errors.size() > 0}">
		<c:forEach var="error" items="${errors}">
			<p class="error"><c:out value="${error}" /></p>
		</c:forEach>
	</c:if>
	<form method="post">
	  <label for="name">ユーザ名：</label>
	  <input type="text" name="name" id="name" /><br />
	  <label for="password">パスワード：</label>
	  <input type="password" name="password" id="password" /><br />
	  <input type="submit" value="ユーザー登録" />
	</form>
	</body>
</html>