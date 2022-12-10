<%--
  Created by IntelliJ IDEA.
  User: jo-eunji
  Date: 2022/11/15
  Time: 12:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/style/main.css" type="text/css">
    <link rel="stylesheet" href="/style/menu.css" type="text/css">
    <script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/menu.css" type="text/css">
    <title>board</title>

</head>
<body>
<h1>
    <br>
    <i class="fa-solid fa-seedling"></i>
    <a href='index.jsp'>VEGGIE MEAL</a>
    <i class="fa-solid fa-seedling"></i></h1>

<br/>

<nav role="navigation">
        <li><a>비건인증</a>
            <ul id="sub-menu">
                <li><a href='intro.jsp'>인증소개&절차</a></li>
                <li><a href='products.jsp'>제품소개</a></li>
            </ul>
        </li></ul>

        <li><a href='restaurant.jsp'>비건식당</a></li>
    </ul>

        <li><a style = "color: red" href="board.jsp">게시판</a></li>
    </ul>

        <li><a href="#">마이페이지</a></li>
    </ul>
</nav>
<br><br><br><br><br><br>
<hr width = "90%" color = "black">

<div align="right">
    <tr>
        <td><a href="writeForm.do">글쓰기</a></td>
    </tr>
</div>

<table style="border: 1px solid white; height: 500px; width: 1300px; background-color: lightyellow; background-size: cover; padding: 30px">
        <th align="left">번호</th> <th align="left" >제목</th> <th align="left">작성자 ID</th> <th align="left">작성일</th> <th align="left">조회수</th>
    <c:if test="${totCnt > 0 }">
        <c:forEach var="board" items="${list }">
            <tr>
                <td class="right" width="100">${startNum }</td>
                <td class="left" width=100>
                    <c:if test="${board.readcount > 20}">
                        <img src='images/hot.gif'>
                    </c:if>
                    <c:if test="${board.re_level > 0}">
                        <img src='images/level.gif' width="${board.re_level*10}">
                        <%--       	board.re_level  ${board.re_level} --%>
                        <img src='images/re.gif'>
                    </c:if>
                    <a href='content.do?num=${board.num}&pageNum=${currentPage}'>
                            ${board.subject}</a>
                </td>
                <td class="left" width=100>${board.writer}</td>
                <td class="left" width=100>${board.reg_date}</td>
                <td class="left" width=100>${board.readcount}</td>
            </tr>
            <c:set var="startNum" value="${startNum - 1 }" />
        </c:forEach>
    </c:if>
    <c:if test="${totCnt == 0 }">
        <tr>
            <td colspan=7>데이터가 없음</td>
        </tr>
    </c:if>
</table>

<div style="text-align: center;">
    <c:if test="${startPage > blockSize }">
        <a href='list.do?pageNum=${startPage-blockSize}'>[이전]</a>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <a href='list.do?pageNum=${i}'>[${i}]</a>
    </c:forEach>
    <c:if test="${endPage < pageCnt }">
        <a href='list.do?pageNum=${startPage+blockSize}'>[다음]</a>
    </c:if>
</div>
</body>
</html>
