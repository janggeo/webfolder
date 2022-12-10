<?xml version="1.0" encoding="UTF-8"?>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.example.new2.data.Data" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=utf-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="com.example.new2.data.Data" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.example.new2.data.DataDAO" %>
<%@ page import="com.example.new2.data.Data" %>
<%@ page import="com.mongodb.ConnectionString" %>
<%@ page import="com.mongodb.MongoClientSettings" %>
<%@ page import="com.mongodb.ServerApiVersion" %>
<%@ page import="com.mongodb.ServerApi" %>

<%

    ConnectionString connectionString = new ConnectionString("mongodb+srv://jeonghwan:wlsdlstk6%21@vegandata.696tu4w.mongodb.net/?retryWrites=true&w=majority");
    MongoClientSettings settings = MongoClientSettings.builder()
            .applyConnectionString(connectionString)
            .serverApi(ServerApi.builder()
                    .version(ServerApiVersion.V1)
                    .build())
            .build();
    MongoClient mongoClient = MongoClients.create(settings);
    DataDAO dao = new DataDAO(mongoClient);

%>
<!DOCTYPE html>
<html>
<head>
    <%--휴대폰이든 노트북이든 디바이스 크기에 맞춰 화면을 보여준다.--%>
    <meta name="viewport" content="width=device-width",intial-scale="1">
    <link rel="stylesheet" href="/style/main.css">
    <link rel="stylesheet" href="/style/menu.css" type="text/css">
    <script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
    <title>
        Project 01
    </title>

    <style>
        h1{
            background-image: url("/images/2.jpg");
            background-size: cover;
        }
    </style>

</head>

<body>
<center><span style = " font-family: 'Anton-Regular'; font-size:3.0em;  color: green; line-height: 1.5em">
        <br/>
        <i class="fa-solid fa-seedling"></i>
        <a href='index.jsp'>VEGGIE MEAL</a>

        <i class="fa-solid fa-seedling"></i>
        <br/>
        </span>
    <span style="font-family: GmarketSansTTFMedium;font-size: 1.5em; line-height: 1.5em">
        <a>베 지  밀</a>
          </span>
</center>
<br/>

<nav role="navigation">
    <ul id="main-menu">
        <li><a>비건인증</a>
            <ul id="sub-menu">
                <li><a href='intro.jsp'>인증소개&절차</a></li>
                <li><a href='products.jsp'>제품소개</a></li>
            </ul>
        </li></ul>

    <ul id="main-menu">
        <li><a href='restaurant.jsp'>비건식당</a></li>
    </ul>

    <ul id="main-menu">
        <li><a href="board.jsp">게시판</a></li>
    </ul>

    <ul id="main-menu">
        <li><a href="#">마이페이지</a></li>
    </ul>
</nav>
<%
    int id = Integer.parseInt(request.getParameter("id"));
%>
<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
    <%List<Data> data = dao.getList(id);%>
    <%
        //System.out.println(data.size());
        int productsize = data.get(0).getProduct().size();
        //int imgsize = data.get(0).getImg().size();
        System.out.println("productsize"+productsize);
        for(int j=0; j<productsize; j++){
    %>
    <tr>
        <th style="background-color: #eeeeee; "><img width="40" height="40" src=<%=data.get(0).getImg().get(j+1)%>></th>
        <th style="background-color: #eeeeee; text-align: right;"><%=data.get(0).getProduct().get(j)%></th>
        <%--    <th style="background-color: #eeeeee; text-align: right;"><%=data.get(i).getCategory()%></th>--%>
        <%--    <th style="background-color: #eeeeee; text-align: right;"><%=data.get(i).getName()%></th>--%>
    </tr>
    <%
        }%>
</table>


</body>

</html>