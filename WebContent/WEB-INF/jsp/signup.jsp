<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>HAPPY FRUITS</title>
<!-- style.cssを追加 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
html{
	height:100%;
}
body{
	margin: 0;
	padding: 0;
	height:100%;
}
body > .box {
	height: auto;
}
.navbar-light .navbar-brand.logo {
	font-size: 35px;
	font-weight: bold;
}
.nav-item {
	margin-top: 10px;
}
 .jumbotron {
	 background:url(http://localhost:8080/KochiProducts/images/autumn_fruits.jpg) center repeat;
	 background-size: cover;
	 height:100%;
	 min-height:100%;
 }
 p {
	padding-top: 12px;
}
.signup_title {
	color: white;
	text-align: center;
	font-family: "MS Pゴシック";
	font-weight: bold;
	margin: 30p;
}

.signup-container {
	background-color: white;
	width: 600px;
	padding: 30px;
	margin: 0 auto;
	text-align: center;
}

label {
	margin: 0px;
}

input {
	width: 80%;
	height: 50px;
	margin-bottom: 10px;
}

.necessary-item {
	color: red;
	font-size: 85%;
}

.signup-button {
	margin-top: 20px;
	width: 30%;
	height: 50px;
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
	    <p>高知から旬の果物をお届け</p>
	  </nav>
	</header>
	<div class="jumbotron">
	<h1 class="signup_title ">SIGN UP</h1>
	<div class="signup-container">
	<c:if test="${errors != null && errors.size() > 0}">
		<c:forEach var="error" items="${errors}">
			<p class="error"><c:out value="${error}" /></p>
		</c:forEach>
	</c:if>
	<form method="post">
	  <label for="name">ユーザ名 <span class="necessary-item">必須</span></label><br />
	  <input type="text" name="name" id="name" placeholder="ユーザ名" autocomplete="off"/><br />
	  <label for="name">メールアドレス <span class="necessary-item">必須</span></label><br />
	  <input type="email" name="mail" id="mail" placeholder="メールアドレス"><br />
	  <label for="password">パスワード <span class="necessary-item">必須</span></label><br />
	  <input type="password" name="password" id="password" placeholder="パスワード"/><br />
	  <input class="signup-button" type="submit" value="登録する" />
	  </div>
	</form>
	</div>
	</body>
</html>