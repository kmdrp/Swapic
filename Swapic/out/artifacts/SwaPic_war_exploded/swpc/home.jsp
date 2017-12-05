
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String room_no = request.getParameter("room_no");
%>
<html>
<head>
    <title>Swapic</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body{
            background-color: aliceblue;
        }
        #sp_container{
            width: 1200px;
            background-color: #e3e3e3;
            height:90%;
            margin:1% auto 0%;
            border: 1px solid #9370db;

        }
        #sp_main{
            width: 900px;
            background-color: #f2fffa;
            float: left;
            height:100%;
        }
        #sp_side{
            border-left: 1px solid mediumpurple;
            width: 299px;
            background-color: mediumpurple;
            float: left;
            height:100%;
        }
        /*copyright*/
        #sp_cpr{
            width:1200px;
            height: 30px;
            margin: auto;
        }
        /* main */

        #main_pic{
            width: 100%;
            height:75%;
            background-color: white;
        }
        #main_info{
            width: 100%;
            height: 25%;
            background-color: #131722;
            display: table;
        }
        #main_me{
            width: 50%;height:100%;
            background-color: white;
            float: left;
        }
        #img_me {
            width: 100%;
            height: 100%;
           /* z-index: 1;*/
    /*        filter: blur(15px);
            -webkit-filter: blur(15px);
            -moz-filter: blur(15px);
            -o-filter: blur(15px);*/
        }
        .before_img {
            width: 100%;
            height: 100%;
            filter: blur(15px);
            -webkit-filter: blur(15px);
            -moz-filter: blur(15px);
            -o-filter: blur(15px);
        }
        #main_you{
            width: 50%;
            height: 100%;
            background-color: white;
            float: left;
        }
        .textStyle{
            color: black;
            font-size: 13pt;
            text-align: center;
            height: 25%;
            width: 100%;
            text-align: center;
        }
        .info_you{
            width: 33%;
            height: 100%;
            float: left;
            border-left:0.5px solid mediumpurple;
        }
        .info_{
            width: 33%;
            height: 100%;
            float: left;
            border-left:0.5px solid mediumpurple;
        }
        .info_me{
            width: 33%;
            height: 100%;
            float: left;
        }
        .separated{
            border-top:1px solid mediumpurple;
        }
        /*#info_label{ vertical-align: middle;
          display: table-cell;}
        #info_upload{ vertical-align: middle;
          display: table-cell;}
        #info_steal{ vertical-align: middle;
          display: table-cell;}
        #info_face{ vertical-align: middle;
          display: table-cell;}
    */
        /*side*/

        #side_chat{
            width: 100%;
            height: 60%;
            background-color: mediumpurple;
        }
        #side_info {
            width: 100%;
            height: 30%;
            background-color: #131722;
            color:purple;
        }
        #roomInfo, #userInfo{
            width: 100%;
            height: 99%;
        }
        .mytable{
            border-collapse: collapse;
            width:100%;
            height:100%;
            text-align:center;
        }
        .mytable th,.mytable td{color:white;font-weight: bold; border:1px solid #9370db;}
        .table_cen{
            width: 200px;
        }
        #side_func{
            width: 100%;
            height:8%;
            background-color: white;
        }
        #chat_content{
            width:95%;
            height: 90%;
            margin: auto;
            background-color: #131722;
            color: white;
            font-size:14px;
            margin-top: 3%;
        }
        #chat_input{
            width: 95%;
            height: 9%;
            margin: auto;
            margin-top: 3px;
            background-color: #131722;
            color: white;
            border: none;
        }
        #msg{
            float:left;
            width: 80%;
            height: 100%;
            background-color: #131722;
            color: white;
            font-size:15px;
            border:1px solid mediumpurple;
        }
        #msg:focus{
            outline:none;
        }
        #btn_send{
            font-size: 16px;
            float:left;
            background-color: #131722;
            width: 20%;
            height: 100%;
            color: white;
            border: 1px solid mediumpurple;
        }
        #btn_send:focus{
            outline:none;
        }
        #btn_send:hover{
            background-color: #142c64;
            color:mediumpurple;
        }
        .btn_func{
            font-size: 15pt;
            color: mediumpurple;
            width: 30%;
            margin-left: 2.5%;
            height: 100%;
            float:left;
            border: none;
            background-color: #131722;
        }
        .btn_func:hover{
            color:white;
        }
        .btn_func:disabled{
            color: white;
        }
        #func_file{
            width: 100%;
            height: 50%;
            border-top: 0.5px solid white;
            background-color: mediumpurple;
        }
        #func_btn{
            width: 100%;
            height: 50%;
            background-color: mediumpurple;
        }
        #file{
            color:white;
            font-size:13px;
        }

    </style>
    <script>

        window.onload=function(){
            var main_me = document.getElementById("main_me");
            var img_me = document.getElementById("img_me");
            var reader;
            var file = document.getElementById("file");
            var btn_upload = document.getElementById("btn_upload");
            var btn_swap = document.getElementById("btn_swap");
            var savPath="/Users/keemmaang/Swapic/SwaPic/web/images/";
            var filename;
            var imgSrc;
            var json;
            var jsonObj ;
            var fileSrc;
            file.multiple=false;
            file.onchange = function () {
                var file1=file.files[0];
                var check= fileCheck(file1);

                if(check){
                    alert(file1.name+" 파일이 업로드 되었습니다");
                    reader = new FileReader();
                    reader.readAsDataURL(file.files[0]);

                    reader.onload=function() {
                        img_me.src = reader.result;
                        imgSrc = reader.result;
                    }
                    btn_upload.disabled=false;
                }
            }

            btn_upload.onclick=function () {
                var form1 = document.getElementById("form1");
                var url = "/upload.do";
                var formData=new FormData(form1);
                //넘길때 방 번호 , 파일 이름 , 보낸 사람아이디

                $.ajax({
                    url:url,
                    type:"POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    success: [function (result) {
                        alert("!");
                        img_me.style.filter = "blur(20px)";
                        img_me.src = "http://180.66.116.97:8888/swpc/images/1.jpg";

                    }],
                    error:function () {
                        alert(" error ");
                    }
                  /*  complete:function () {
                        btn_swap.disabled = false;
                        var up_status = document.getElementById("up_status");
                        up_status.innerText = "업로드완료";

                    }*/
                });
            }
            btn_swap.onclick=function () {
                var img_me = document.getElementById("img_me");
                img_me.src = savPath + filename;
                main_me.appendChild(img_me);
            }
        }
        function fileCheck(file) {
            var maxSize=1024*1024;
            var fileSize=0;
            var browser = navigator.appName;
            var fileSizetoPrint=file.size/1000;
            if(browser=="Microsoft Internet Explorer"){
                var oas = new ActiveXObject("Scripting.FileSysytemObject");
                fileSize=oas.getFile(file.value).size;
            }else{
                fileSize = file.size;
            }
            var fileExt = file.name.split(".")[file.name.split(".").length-1];

            if(fileExt!="jpeg"&&fileExt!="jpg"&&fileExt!="JPG"&&fileExt!="JPG"&&fileExt!="PNG"&&fileExt!="png"){
                alert("파일 확장자는 .jpeg 혹은 .jpg 만 가능합니다");
                return false;
            }
            if(fileSize>maxSize) {
                alert("파일크기:"+parseInt(fileSizetoPrint)+"KB 입니다 업로드 최대용량: 500KB");
                return false;
            }
            return true;
        }
        function callback_img(imgSource) {
            var img_me = document.getElementById("img_me");
            img_me.src = imgSource;
        }

    </script>
</head>
<body>
<nav>
    <jsp:include page="/inc/header.jsp"/>
</nav>
<!--전체 화면 -->
<div id="sp_container">
    <!-- 사진 업로드 되서 보여주는 메인화면-->
    <div id="sp_main">
        <div id="main_pic" style="background-color: #e3e3e3">
            <div id="main_me">
                <img id="img_me" width="200px" height="100px" />

            </div>
            <div id="main_you" >

            </div>
        </div>
        <div id="main_info">
            <table class="mytable">
                <tr>
                    <th colspan="3" style="color:mediumpurple;">사진 정보</th>
                </tr>
                <tr>
                    <th>&nbsp;&nbsp;&nbsp;</th>
                    <th class="table_cen">업로드 상태</th>
                    <th>&nbsp;&nbsp;&nbsp;</th>
                </tr>
                <tr>
                    <th></th>
                    <th class="table_cen">도용 여부</th>
                    <th></th>
                </tr>
                <tr>
                    <th>&nbsp;&nbsp;&nbsp;</th>
                    <th class="table_cen">얼굴 인식</th>
                    <th>&nbsp;&nbsp;&nbsp;</th>
                </tr>
            </table>

        </div>

    </div>

    <!-- 사이드 창 ( 채팅 , 유저 정보 , 업로드 /교환 버튼)-->
    <div id="sp_side">
        <!-- 채팅 창-->
        <div id="side_chat">
            <div id="chat_content"></div>
            <div id="chat_input">
                <div id="input">
                    <input type="text" id="msg" name="msg"/>
                </div>
                <button id="btn_send">send</button>
            </div>
        </div>

        <!-- 유저 정보-->
        <div id="side_info">
            <div id="roomInfo">
                <table class="mytable">
                    <tr >
                        <th colspan="2" style="color:mediumpurple;">방 정보</th>
                    </tr>
                    <tr>
                        <td>방번호</td>
                        <td> 1031</td>
                    </tr>
                    <tr>
                        <td>방장</td>
                        <td> Pringles</td>
                    </tr>
                    <tr>
                        <td>user2</td>
                        <td> Swingchips</td>
                    </tr>
                    <tr>
                        <td>인원수</td>
                        <td>2</td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td>1234</td>
                    </tr>
                </table>
         </div>
    </div>

        <!-- 업로드 , 교환 버튼 , 방 나가기 버튼 -->
        <div id="side_func">
            <form id="form1" method="post" enctype="multipart/form-data">
                <div id="func_file">
                    <input type="file" id="file" name="file" size="10" />
                </div>
                <div id="func_btn">
                    <input type="button" class="btn_func" id="btn_upload" value="upload" disabled>
                    <button class="btn_func" id="btn_swap" disabled>교환</button>
                    <button class="btn_func" id="btn_bye">나가기</button>
                </div>
                <input type="text" name="room_no" id="room_no" value="<%=room_no%>" hidden>
            </form>
        </div>
    </div>
</div>
<div id="sp_cpr">
    Copyright © 2017 Swapic. by keemdrop.
</div>
<%--<svg version="1.1" xmlns="http://www.w3.org/2000/svg">
  <filter id="blurr">
    <feGaussianBlur stdDeviation="8" />
  </filter>--%>
</svg>
</body>
</html>
