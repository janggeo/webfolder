<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "com.example.new2.veganwebsite.Veganwebsite" %>
<%@ page import = "com.example.new2.veganwebsite.VeganwebsiteDAO" %>
<!DOCTYPE html>
<html>
<head>
<!--만약에 안되면 <meta "UTF-8"> -->
<meta http-equiv = "Content.Type" content = "text/html; charset= UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale="1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>Veggie Meal</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int boardID = 0;
		if(request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if(boardID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'VeganWebSite.jsp'");
			script.println("</script>");
		}	
		
		Veganwebsite veganwebsite = new VeganwebsiteDAO().getVeganwebsite(boardID);
		if(!userID.equals(veganwebsite.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'VeganWebSite.jsp'");
			script.println("</script>");
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
		</div>
	</nav>	
	
	<div class = "container">
		<div class = "row">
		<form method = "post" action = "updateAction.jsp?boardID=<%= boardID %>">
		<table class = "table table-striped" style = "text-align; cente; border; 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan ="2" style = "backgroud-color: #eeeeee; text-align; center;">게시판 글 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type = "text" class  = "form-control" placeholder = "글 제목" name = "boardTitle" maxlength = "50" value="<%= veganwebsite.getBoardTitle() %>"></td>
					</tr> 
					<tr>
						<td><textarea class  = "form-control" placeholder = "글 내용" name = "boardContent" maxlength = "2048" style = "height: 350px;"><%= veganwebsite.getBoardContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type = "submit" class = "btn btn-primary pull-right" value = "글수정">
		</form>
			
		</div>
	</div>
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>