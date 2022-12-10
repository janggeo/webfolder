<%@ page import="com.example.new2.data.Data" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.ConnectionString" %>
<%@ page import="com.mongodb.MongoClientSettings" %>
<%@ page import="com.mongodb.ServerApi" %>
<%@ page import="com.mongodb.ServerApiVersion" %>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.example.new2.data.DataDAO" %><%--
  Created by IntelliJ IDEA.
  User: jo-eunji
  Date: 2022/11/13
  Time: 6:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<html>
<head>
  <link rel="stylesheet" href="/style/menu.css" type="text/css">
  <script src="https://kit.fontawesome.com/35a0ae4dcc.js" crossorigin="anonymous"></script>
    <title>products</title>
</head>
<body>
<center><span style = " font-family: 'Anton-Regular'; font-size:3.0em;  color: green; line-height: 1.5em">
      <br/>
      <i class="fa-solid fa-seedling"></i>
      <a href='index.jsp'>VEGGIE MEAL</a>

      <i class="fa-solid fa-seedling"></i>
      <br/>
      </span>
    <span style="font-size: 1.0em; line-height: 1.5em">
      <a>베 지  밀</a>
        </span>
</center>
<br/>

<nav role="navigation">
  <ul id="main-menu">
      <li><a>비건인증</a>
      <ul id="sub-menu">
        <li><a href='intro.jsp'>인증소개&절차</a></li>
        <li><a style = "color: red" href='products.jsp'>제품소개</a></li>
      </ul>
    </li></ul>

  <ul id="main-menu">
      <li><a href='restaurant.jsp'>비건식당</a></li>
  </ul>

  <ul id="main-menu">
    <li><a href='board.jsp'>게시판</a></li>
  </ul>

  <ul id="main-menu">
    <li><a href="#">마이페이지</a></li>
  </ul>
</nav>


<div class="container">
    <h3>카테고리</h3>
    <hr>
    <form method="post" action="bbs.jsp">
        <input type="checkbox" name="item" value="화장품">화장품
        <input type="checkbox" name="item" value="의약외품 등">의약외품
        <input type="checkbox" name="item" value="생활용품">생활용품
        <input type="checkbox" name="item" value="식품(건강기능,수입 포함)">식품
        <input type="checkbox" name="item" value="원료">원료
        <br><br>
        <input type="submit" value="확인">
    </form>
    <div class="row">
        <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; ">image</th>
                <th style="background-color: #eeeeee; text-align: center;">id</th>
                <th style="background-color: #eeeeee; text-align: center;">category</th>
                <th style="background-color: #eeeeee; text-align: center;">company</th>
            </tr>
            </thead></table>
        <tbody>
        <tr>
            <%
                String[] value = request.getParameterValues("item");
            %>
            <%List<Data> data = dao.getList(value);%>
            <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
                <%
                    System.out.println(data.size());
                    for(int i=0;i<data.size();i++){
                %>
                <tr>
                    <th style="background-color: #eeeeee; "><a href = "datainfo.jsp?id=<%=data.get(i).getId()%>"><img width="40" height="40" src=<%=data.get(i).getImg().get(0)%>></a></th>
                    <th style="background-color: #eeeeee; text-align: right;"><%=data.get(i).getId()%></th>
                    <th style="background-color: #eeeeee; text-align: right;"><%=data.get(i).getCategory()%></th>
                    <th style="background-color: #eeeeee; text-align: right;"><%=data.get(i).getName()%></th>
                </tr>
                <%}%>

            </table>
        </tr>
        </tbody>
    </div>

    <a href="write.jsp" class="btn btn-primary pull-right"></a>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</body>
</html>
