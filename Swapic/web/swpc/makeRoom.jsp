<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //String userId = (String)session.getAttribute("userId");
    String userId = "admin";
%>
<html>
<head>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <title>방 만들기</title>
    <style>
        html{
            overflow: hidden;
        }
        #main{
            background-color: #d3b1ff;
            width:250px;
            margin: auto;
            height: 150px;
        }
        table{
            margin: auto;
        }

    </style>

    <script>
        var url = "/newRoom.do";
        var form2;
        var roomNo;
        window.onload=function () {
            form2 = document.getElementById("form2");

            // result가 ok 면 확인창 띄워주고 받아온 방정보 가지고 방입장 function(방번호){location.href='/swapic/방번호'}, 팝업종료
            document.getElementById("btn_send").onclick=function () {
                var title=$("#title").val();
                var password=document.getElementById("password").value;
                var userId="<%=userId%>";
                $.ajax({
                 url:url,
                 type:"POST",
                 data:{
                     'title':title,
                     'owner':userId,
                     'password':password
                 },
                 dataType: 'json',
                 success:[ function (result) {
                     var json = JSON.stringify(result);
                     var jObj = JSON.parse(json);
                     roomNo = jObj.room_no;
                     window.close();
                 }],
                 error:function () {
                    alert(" error ");
                 }
                });

            };
        }

       /* function send1() {
            //alert(params);
        }*/
        window.onunload=function () {
            window.opener.enterRoom(roomNo);

        }
    </script>
</head>
<body>
<div id="main">
<form id="form2" >
    <table>
        <tr>
            <th colspan="2">방만들기</th>
        </tr>

        <tr>
            <td>방제목</td>
            <td><input type="text" name="title" id="title">
            </td>
        </tr>
        <tr>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td colspan="2"></td>
        </tr>
        <tr>
            <!-- 비번 네자리 숫자로만 무조건 -->
            <td>비밀번호</td>
            <td><input type="password" name="password" id="password">
            </td>
        </tr>
        <tr>
            <td></td>
            <td><input type="button" value="확인" style="float:right;" onclick="send1()" id="btn_send">
            </td>
        </tr>
    </table>
</form>
</div>
</body>
</html>
