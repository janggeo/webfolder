<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-09-30
  Time: 오전 1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.mongodb.ConnectionString" %>
<%@ page import="com.mongodb.MongoClientSettings" %>
<%@ page import="com.mongodb.ServerApi" %>
<%@ page import="com.mongodb.ServerApiVersion" %>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.example.new2.data.DataDAO" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.example.new2.data.Map" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=utf-8" language="java"
         pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
        .wrap * {padding: 0;margin: 0;}
        .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
        .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
        .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
        .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
        .info .close:hover {cursor: pointer;}
        .info .body {position: relative;overflow: hidden;}
        .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
        .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
        .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
        .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
        .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
        .info .link {color: #5085BB;}
    </style>
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
                <li><a href='data.jsp'>제품소개</a></li>
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
<h3>카테고리</h3>
<hr>
<form method="post" action="restaurant.jsp">
    <label >지역</label>
    <select  name="region" id="region" size="1">
        <option value="">선택</option>
        <option value="seoul">서울</option>
        <option value="gyeonggi">경기</option>
        <option value="bu_ul_geong">부울경</option>
        <option value="daegu">대구</option>
        <option value="gwangju_jeon">광주_전라</option>
        <option value="daejeon_chung">대전_충청</option>
        <option value="jeju_kangwon">제주_강원</option>
    </select>
    <input type="submit" value="확인" style="margin-left:50px">
</form>
<%--<form method="post" action="restaurant.jsp">
        <input type="checkbox" name="item" value="seoul" >서울
        <input type="checkbox" name="item" value="gyeonggi">경기
        <input type="checkbox" name="item" value="bu_ul_geong">부울경
        <input type="checkbox" name="item" value="daegu">대구
        <input type="checkbox" name="item" value="gwangju_jeon">광주_전라
        <input type="checkbox" name="item" value="daejeon_chung">대전_충청
        <input type="checkbox" name="item" value="jeju_kangwon">제주_강원
        <br><br>
        <input type="submit" value="확인">
    </form>--%>

<%
    String region = request.getParameter("region");
    ConnectionString connectionString = new ConnectionString("mongodb+srv://jeonghwan:wlsdlstk6%21@vegandata.696tu4w.mongodb.net/?retryWrites=true&w=majority");
    MongoClientSettings settings = MongoClientSettings.builder()
            .applyConnectionString(connectionString)
            .serverApi(ServerApi.builder()
                    .version(ServerApiVersion.V1)
                    .build())
            .build();
    MongoClient mongoClient = MongoClients.create(settings);
    System.out.println(region);
    DataDAO dao = new DataDAO(mongoClient,region);
%>


<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb2273b5c733520c556bf71ae2fec18e"></script>
    <script>
        <%List<Map> mapdata = dao.getMap();%>

        let long;
        let lat;
        let name;
        let img;
        let address;
        let phone;
        let page;

        var mapContainer = document.getElementById('map'), // 지도의 중심좌표
            mapOption = {
                center: new kakao.maps.LatLng(37.55082390184424, 126.98889837934351), //지도의 중심좌표
                level: 1 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        var marker =[];
        var content =[];
        var overlay = [];

         <%for(int i=0;i<mapdata.size();i++) {%>
            long = <%=mapdata.get(i).getLatlong().get(0)%>;
            lat = <%=mapdata.get(i).getLatlong().get(1)%>;
            name = '<%=mapdata.get(i).getName()%>';
            img = '<%=mapdata.get(i).getImg()%>';
            address = '<%=mapdata.get(i).getAddress()%>';
            phone = '<%=mapdata.get(i).getPhone()%>';
            page = '<%=mapdata.get(i).getPage()%>';

            // 지도에 마커를 표시합니다
            marker[<%=i%>] = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(lat, long)
            });

<%--            <%--%>
<%--                System.out.println(mapdata.size());--%>
<%--               System.out.println(mapdata.get(i).getLatlong().get(0));--%>
<%--               System.out.println(mapdata.get(i).getLatlong().get(1));--%>
<%--                System.out.println(mapdata.get(i).getName());--%>
<%--                System.out.println(mapdata.get(i).getImg());--%>
<%--                System.out.println(mapdata.get(i).getAddress());--%>
<%--                System.out.println(mapdata.get(i).getPhone());--%>
<%--                   %>--%>
            content[<%=i%>] = '<div class="wrap">' +
                '    <div class="info">' +
                '        <div class="title">' +
                    name +
                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
                '        </div>' +
                '        <div class="body">' +
                '            <div class="img">' +
                '<img src= ' + img + ' width="73" height="70" alt="restaurant img"> ' +
                '           </div>' +
                '            <div class="desc">' +
                '                <div class="ellipsis">' + address + '</div>' +
                '                <div class="phone ellipsis">' + phone + '</div>' +
                '                <div><a href=' + page + ' target="_blank" class="link">홈페이지</a></div>' +
                '            </div>' +
                '        </div>' +
                '    </div>' +
                '</div>';


            // 마커 위에 커스텀오버레이를 표시합니다
            // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
            overlay[<%=i%>] = new kakao.maps.CustomOverlay({
                content: content[<%=i%>],
                map: map,
                position: marker[<%=i%>].getPosition()
            });


            // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
            kakao.maps.event.addListener(marker[<%=i%>], 'click', function () {
                overlay[<%=i%>].setMap(map);
            });

            // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
            function closeOverlay() {
                overlay[<%=i%>].setMap(null);
            }
        <%}%>

</script>
</body>
</html>
