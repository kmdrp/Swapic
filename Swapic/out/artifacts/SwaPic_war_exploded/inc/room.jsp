<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String room_no = request.getParameter("room_no");
    String title = request.getParameter("title");
    String owner = request.getParameter("owner");
    String password = request.getParameter("password");
    String member = request.getParameter("member");
    String regdate = request.getParameter("regdate");
    regdate = regdate.substring(0, 9);

%>
<html>
<head>
    <title>Title</title>
    <style>

        #room{
            width:100%;
            height:100%;
            margin-top: 1px;
            padding-top:7px;
        }
        .room_con{
            height:100%;
            float:left;
            text-align: center;
        }
    </style>
    <script>

    </script>
</head>
<body>
<div id="room">
    <div class="room_con" id="attr_no" style="width:10%"><%=room_no%></div>
    <div class="room_con" id="attr_title" style="width:45%"><%=title%></div>
    <div class="room_con" id="attr_owner" style="width:25%"><%=owner%></div>
    <div class="room_con" id="attr_member" style="width:5%"><%=member%>/2</div>
    <div class="room_con" id="attr_pwd" style="width:5%"><%=password%></div>
    <div class="room_con" id="attr_" style="width:10%"><%=regdate%>2</div>
</div>

</body>
</html>
