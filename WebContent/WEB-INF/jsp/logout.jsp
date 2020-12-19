<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
html {
	height: 100%;
}

body {
	margin: 0;
	padding: 0;
	height: 100%;
}

body>.box {
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
	background:
		url(http://localhost:8080/KochiProducts/images/autumn_fruits.jpg)
		center repeat;
	background-size: cover;
	height: 100%;
	min-height: 100%;
}
.signout_title {
	color: white;
	text-align: center;
	font-family: "MS Pゴシック";
	font-weight: bold;
	margin: 30p;
}
.text-center {
	color: white;
}
</style>



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
<title>ログアウト</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

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
					<li class="nav-item"><a class="nav-link" href="./login">ログイン</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="jumbotron">
		<h1 class="signout_title">SIGN OUT</h1>
	</div>
</body>
</html>