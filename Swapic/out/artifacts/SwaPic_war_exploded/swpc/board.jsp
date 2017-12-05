<%@ page import="java.util.ArrayList" %>
<%@ page import="db.dto.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 20개 까지 짤라서 페이지 해야함 근데 페이징이 먼저가아님-->
<%

    ArrayList list = (ArrayList) request.getAttribute("list");
    final int pageSize=20;
    final int block=10;
    int currentPage=1;
    if(request.getParameter("currentPage")!=null){
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
        System.out.println(" currentPage: " +Integer.parseInt(request.getParameter("currentPage")));
    }
    int totalRecord = list.size();
    int startRecord=(currentPage-1)*pageSize;
    int endRecord=startRecord+pageSize;
    if(endRecord>totalRecord) endRecord = totalRecord;

    int startPage = ((currentPage - 1) / block) + 1;
    int endPage = startPage + block - 1;
    int totalPage = (totalRecord + (pageSize - 1)) / pageSize;

    if(endPage>totalPage) endPage = totalPage;

%>


<html>
<head>
    <title>Board</title>
    <style>
        body{
            background-color: aliceblue;
        }
        #center{
            width:800px;
            height:790px;
            margin: auto;
            background-color: #d3b1ff;
        }
        #space{
            width:100%;
            height: 100px;
            background-color: aliceblue;
        }
        #attr{
            width:100%;
            height: 40px;
            background-color: white;
        }
        #line{
            width: 100%;
            height:5px;
            background-color: mediumpurple;
        }
        #attr_con{
            width: 100%;
            height:35px;
            background-color: #f0d0ff;
        }
        .attr_con{
            font-weight:bold;
            height:100%;
            text-align:center;
            float:left;
            margin-top:10px;
        }
        #roomDiv{
            width:100%;
            height:30px;
            background-color: white;
        }
        #finderDiv{
            width: 100%;
            height: 32px;
            margin-top: 10px;
        }
        #finder1{
            float: left;
            width:180px;
            height: 22px;
            margin-left:325px;
            border:4px solid mediumpurple;
        }
        #finder{
            float: left;
            width:150px;
            height:20px;
            margin-top: 1px;
            border:none;
        }
        #finder:focus{
            outline:none;
        }
        #btn_search{
            float: left;
            width:30px;
            height: 22px;
            background-color: mediumpurple;
        }

        .textBtn{
            text-decoration: none;
            color:black;
        }
        .textBtn:hover{
            color:#377cff;
            font-weight: bold;
        }
        #makediv{
            float: right;
            width:100px;
            height: 32px;
            background-color: mediumpurple;
        }
        #makeRoom{
            background-color: mediumpurple;
            color:white;
            font-weight: bold;
            text-align:center;
            width: 100px;
            height: 20px;
            margin-top: 6px;
        }
        #search_img{
            margin-top: -2px;
        }
    </style>
    <script id="scripts1">
        window.onload=function(){
            var makeBtn = document.getElementById("makediv");
            var searchBtn = document.getElementById("btn_search");
            var searchImg = document.getElementById("search_img");

            makeBtn.onmouseover=function(){
                makeBtn.style.backgroundColor = "#377cff";
                document.getElementById("makeRoom").style.backgroundColor = "#377cff";
            }
            makeBtn.onmouseout=function(){
                makeBtn.style.backgroundColor = "mediumpurple";
                document.getElementById("makeRoom").style.backgroundColor = "mediumpurple";
            }
            searchBtn.onmouseover=function(){
                searchImg.src = "/swpc/images/search_h.png";
            }
            searchBtn.onmouseout=function () {
                searchImg.src = "/swpc/images/search_p.png";
            }
        }
        function touch(content){
            content.style.backgroundColor = "#377cff";
            content.style.color="white";
        }
        function mouseOut(content) {
            content.style.backgroundColor = "white";
            content.style.color="black";
        }
        function enter(num) {
            // 방입장 처리
            // 방인원 꽉차면 못드감 안차있으면 비번 누르게
            alert(num);
        }
        function room_search(){
            alert("room searching,...");
        }
        function makeRoom(){
            var ppURL = "/swpc/makeRoom.jsp";
            var ppOption = "width=370,height=360,toolbar=no,resizable=no,status=yes,scrollbars=no,left=20,top=200";
            window.open(ppURL,"",ppOption);
        }
        function enterRoom(room_no){
            if(room_no!=undefined){
                window.location.href = "/room.do?room_no="+room_no;
            }
        }

    </script>
</head>

<body>
<nav>
    <jsp:include page="/inc/header.jsp"/>
</nav>
<div id="center">
    <div id="space">
    </div>

    <div id="attr">
        <div id="line">

        </div>
        <div id="attr_con">
            <div class="attr_con" id="attr_no" style="width:10%">번호</div>
            <div class="attr_con" id="attr_title" style="width:45%">제목</div>
            <div class="attr_con" id="attr_owner" style="width:25%">방장</div>
            <div class="attr_con" id="attr_member" style="width:5%">인원</div>
            <div class="attr_con" id="attr_pwd" style="width:5%">비번</div>
            <div class="attr_con" id="attr_date" style="width:10%">날짜</div>
        </div>
    </div>

    <div id="board" >
        <%
            for(int i=startRecord;i<endRecord;i++){
                Room room = (Room)list.get(i);

        %>
        <div id="roomDiv" onclick="enter(<%=room.getRoom_num()%>)" onmouseout="mouseOut(this)" onmouseover="touch(this)" >
            <jsp:include page="/inc/room.jsp">
                <jsp:param name="room_no" value="<%=room.getRoom_num()%>"/>
                <jsp:param name="title" value="<%=room.getTitle()%>"/>
                <jsp:param name="owner" value="<%=room.getOwner()%>"/>
                <jsp:param name="member" value="<%=room.getMember()%>"/>
                <jsp:param name="password" value="<%=room.getPassword()%>"/>
                <jsp:param name="regdate" value="<%=room.getDate()%>"/>
            </jsp:include>

         </div>
        <%}%>
    </div>
    <div id="board_controller" style="text-align:center;background-color: white;border:4px solid #d3b1ff;">
        <a href="/board" class="textBtn">처음</a> &nbsp; <a href="/board.do?currentPage=<%if(currentPage-1>=1){out.print(currentPage-1);}else{out.print(1);}%>" class="textBtn">이전 &nbsp;</a>
        <%for(int a=startPage;a<=endPage;a++){%>
        &nbsp; <a href="/board.do?currentPage=<%=a%>" class="textBtn"<%if(currentPage==a){%>style="color:red;font-weight:bold;"<%}%>><%=a%></a> &nbsp;<%}%>
        &nbsp; <a href="/board.do?currentPage=<%=currentPage+1%>" class="textBtn">다음</a> &nbsp; <a href="/board.do?currentPage=<%=totalPage%>" class="textBtn">끝</a>

    </div>
    <div id="finderDiv">
        <div id="finder1">
            <input type="text" id="finder" placeholder=" 방 번호 검색">
            <div id="btn_search" onclick="room_search()"><img id="search_img" src="/swpc/images/search_p.png" style="width:30px;height:25px;"/></div>
        </div>
        <div id="makediv" onclick="makeRoom()">
            <div id="makeRoom">방 만들기</div>
        </div>
    </div>
    <div>
        Copyright © 2017 Swapic. by keemdrop.
    </div>
</div>
</body>
</html>
