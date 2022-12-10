<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "com.example.new2.veganwebsite.Veganwebsite" %>
<%@ page import = "com.example.new2.veganwebsite.VeganwebsiteDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content.Type" content = "text/html; charset= UTF-8">
<meta name = "viewport" content = "width = device-width", initial-scale="1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>Veggie Meal</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
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
	%>
	<nav class = "navbar navbar-default">
		<div class = "navbar-header">
			<button type = "button" class = "navbar-toggle collapsed"
				data-toggle = "collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded = "false">
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
			<table class = "table table-striped" style = "text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr> 
						<th colspan ="3" style = "backgroud-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr> 
						<td style = "width: 20%;">글 제목</td>
						<td colspan="2"><%= veganwebsite.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td> 
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan = "2"><%= veganwebsite.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan = "2"><%= veganwebsite.getBoardDate().substring(0, 11) + veganwebsite.getBoardDate().substring(11, 13) + "시 " + veganwebsite.getBoardDate().substring(14,16) + "분"  %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan = "2" style = "min-height: 200px; text-align: Left;"><%= veganwebsite.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href = "VeganWebSite.jsp" class = "btn btn-primary">목록</a>
			<%
				if( (userID != null) && (userID.equals(veganwebsite.getUserID()))){
			%>
					<a href = "update.jsp?boardID=<%= boardID %>" class = "btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "deleteAction.jsp?boardID=<%= boardID %>" class = "btn btn-primary">삭제</a>
			<%
				}
			%>			
		</div>
	</div>
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>