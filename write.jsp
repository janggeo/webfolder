<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<!--만약에 안되면 <meta "UTF-8"> -->
<meta http-equiv = "Content.Type" content = "text/html; charset= UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale="1">
<link rel = "stylesheet" href = "style/bootstrap.css">
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
		<li><a href="write.jsp">게시판</a></li>
	</ul>

	<ul id="main-menu">
		<li><a href="login.jsp">마이페이지</a></li>
	</ul>
</nav>

</br></br></br></br></br></br>
<hr width = "90%" color = "black">

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class = "navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button" class = "navbar-toggle collapsed"
				data-toggle = "collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded = "false">
				<!--아이콘 바 세 줄 의 -->
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				</button>
				<a class = "navbar-brand" href = "main.jsp">Veggie Meal</a>
		</div>
		<div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
			<ul class = "nav navbar-nav">
				<li><a href = "main.jsp">메인</a></li>
				<li class = "active"><a href = "VeganWebSite.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null){
			%>
			<ul class = "nav navbar-nav navbar-right">
				<li class = "dropdow">
					<a href = "#" class = "dropdown-toggle"
						data-toggle = "dropdown" role = "button" aria-haspopup = "true"
						aria-expended = "false">접속하기<span class = "caret"></span></a>
						<ul class = "dropdown-menu">
							<li><a href = "login.jsp">로그인</a></li>
							<li><a href = "join.jsp">회원가입</a></li>	
						</ul>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class = "nav navbar-nav navbar-right">
				<li class = "dropdow">
					<a href = "#" class = "dropdown-toggle"
						data-toggle = "dropdown" role = "button" aria-haspopup = "true"
						aria-expended = "false">회원관리<span class = "caret"></span></a>
						<ul class = "dropdown-menu">
							<li><a href = "logoutAction.jsp">로그아웃</a></li>
						</ul>
				</li>
			</ul>
			<%			
				}
					
			%>
		</div>
	</nav>	
	
	<div class = "container">
		<div class = "row">
		<form method = "post" action = "writeAction.jsp">
		<table class = "table table-striped" style = "text-align; cente; border; 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan ="2" style = "backgroud-color: #eeeeee; text-align; center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type = "text" class  = "form-control" placeholder = "글 제목" name = "boardTitle" maxlength = "50"></td>
					</tr>
					<tr>
						<td><textarea class  = "form-control" placeholder = "글 내용" name = "boardContent" maxlength = "2048" style = "height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type = "submit" class = "btn btn-primary pull-right" value = "글쓰기">
		</form>
			
		</div>
	</div>
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>