<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.example.new2.veganwebsite.VeganwebsiteDAO" %>
<%@ page import = "com.example.new2.veganwebsite.Veganwebsite" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<!--만약에 안되면 <meta "UTF-8"> -->
<meta http-equiv = "Content-Type" content = "text/html; charset= UTF-8">
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
	} else{
		if(request.getParameter("boardTitle") == null || request.getParameter("boardContent") == null
			|| request.getParameter("boardTitle").equals("") || request.getParameter("boardContent").equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			} else{
				VeganwebsiteDAO veganwebsiteDAO = new VeganwebsiteDAO();
				int result = veganwebsiteDAO.update(boardID, request.getParameter("boardTitle"),request.getParameter("boardContent"));
			
				if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
					
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'VeganWebSite.jsp'");
					script.println("</script>");
				}
			}		
		}
		
	%>
</body>
</html>