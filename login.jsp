<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--만약에 안되면 <meta "UTF-8"> -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/login.css" type="text/css">
	<script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
	<meta name="viewport" content="width=device-width",intial-scale="1">

<meta http-equiv = "Content.Type" content = "text/html; charset= UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale="1">
<%--<link rel = "stylesheet" href = "style/bootstrap.css">--%>
<title>Veggie Meal</title>
</head>
<body>
<h1>
	<i class="fa-solid fa-seedling"></i>
	<a href='index.jsp'>VEGGIE MEAL</a>
	<i class="fa-solid fa-seedling"></i></h1>

<br/>

<nav role="navigation">
	<ul id="main-menu">
		<li><a>비건인증</a>
			<ul id="sub-menu">
				<li><a href='intro.jsp'>인증소개&절차</a></li>
				<li><a href='data.jsp'>제품소개</a></li>
			</ul>
		</li></ul>

	<ul id="main-menu">
		<li><a href='restaurant.jsp'>비건식당</a></li>
	</ul>

	<ul id="main-menu">
		<li><a href="VeganWebSite.jsp">게시판</a></li>
	</ul>

	<ul id="main-menu">
		<li><a href="login.jsp">마이페이지</a>
			<ul id="sub-menu">
				<li><a href='login.jsp'>로그인</a></li>
				<li><a href='join.jsp'>회원가입</a></li>
			</ul></li>
	</ul>
</nav>
</br></br></br></br></br></br>
<hr width = "90%" color = "black">

	
	<div class = "container" style="align-content: center; alignment: center">
		<div class = "col-lg-4"></div>
		<div class = "col-lg-4">
			<div class = "jumbotron" style = "padding-top: 20px;">
				<form method = "post" action="loginAction.jsp">
					<h3 style = "text-align: center;">로그인 화면</h3>
					<div class = "form-group">
						<input type = "text" class = "form-control" placeholder = "아이디" name = "userID" maxlength = "20"> 
					</div>
					
					<div class = "form-group">
						<input type = "password" class = "form-control" placeholder = "비밀번호" name = "userPassword" maxlength = "20"> 
					</div>
					<input type = "submit" class = "btn btn-primary form-control" value = "로그인">
				</form>
			</div>
		</div>
		<div class = "col-lg-4"></div>
	</div>
	
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>