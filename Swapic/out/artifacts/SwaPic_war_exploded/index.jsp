
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Swapic</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body{
      background-color: #e3e3e3;
    }

    #sp_container{
      width: 1200px;
      background-color: #e3e3e3;
      height:90%;
      margin:1% auto 0%;
      border: 1px solid cornflowerblue;

    }
    #sp_main{
      width: 800px;
      background-color: antiquewhite;
      float: left;
      height:100%;
    }
    #sp_side{
      border-left: 1px solid cornflowerblue;
      width: 399px;
      background-color: darkslateblue;
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
    background-color: lightcyan;
    display: table;
  }
  #main_me{
    width: 50%;height:100%;
    background-color: antiquewhite;
    float: left;
  }
  #img_me {
    width: 100%;
    height: 100%;
    z-index: 1;
    /*filter: blur(8px);
    -webkit-filter: blur(8px);
    -moz-filter: blur(8px);
    -o-filter: blur(8px);*/
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
      border-left:0.5px solid cornflowerblue;
    }
    .info_{
      width: 33%;
      height: 100%;
      float: left;
      border-left:0.5px solid cornflowerblue;
    }
    .info_me{
      width: 33%;
      height: 100%;
      float: left;
    }
    .separated{
      border-top:1px solid cornflowerblue;
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
      background-color: aliceblue;
    }
    #side_info {
      width: 100%;
      height: 30%;
      background-color: cornflowerblue;
      color:white;
    }
    #side_func{
      width: 100%;
      height:10%;
      background-color: white;
    }
    #chat_content{
      width:90%;
      height: 90%;
      margin: auto;
      background-color: white;
    }
    #chat_input{
      width: 90%;
      height: 9%;
      margin: auto;
      background-color: azure;

    }
    #msg{
      float:left;
      width: 80%;
      height: 100%;

    }
    #btn_send{
      float:left;
      width: 20%;
      height: 100%;
    }
    .btn_func{
      font-size: 15pt;
      color: cornflowerblue;
      width: 30%;
      margin-left: 2.5%;
      height: 100%;
      float:left;
      border: none;
      background-color: white;
    }
    .btn_func:hover{
      background-color: aquamarine;
    }
    .btn_func:disabled{
      color: #cdcdcd;
    }
  #func_file{
    width: 100%;
    height: 50%;
    border-top: 0.5px solid white;
    background-color: cornflowerblue;
  }
    #func_btn{
      width: 100%;
      height: 50%;
      background-color: white;
    }

  </style>
  <script>
    window.onload=function(){
        var main_me = document.getElementById("main_me");
        var file = document.getElementById("file");
        var btn_upload = document.getElementById("btn_upload");
        var btn_swap = document.getElementById("btn_swap");
        var savPath="/Users/keemmaang/Swapic/SwaPic/web/images/";
        var filename="";
        file.multiple=false;
        file.onchange = function () {
           var file1=file.files[0];
            var check= fileCheck(file1);
            if(check){
                alert(file1.name+" 파일이 업로드 되었습니다");
                btn_upload.disabled=false;
                btn_upload.type = "submit";

            }
        }
        btn_upload.onclick=function () {
            var form1 = document.getElementById("form1");
            var url = "/upload";
            var formData=new FormData();
            formData.append("data", file.files[0]);

            //넘길때 방 번호 , 파일 이름 , 보낸 사람아이디

            $.ajax({
                url: url,
                data: formData,
                enctype: "multipart/form-data",
                processData: false,
                contentType: false,
                type: 'POST',
                dataType: 'json',
                success: function (result) {

                    var json = JSON.stringify(result);
                    var jsonObj = JSON.parse(json);
                    filename = jsonObj.filename;
                    var savPath=jsonObj.savPath;
                    console.log("this is test path : " );


                    //업로드한 이미지 들어오는 부분
                },
                complete:function () {
                    btn_swap.disabled = false;
                    var up_status = document.getElementById("up_status");
                    up_status.innerText = "업로드완료";

                }
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
          <img src="#" id="img_me" />

        </div>
        <div id="main_you" >

        </div>
      </div>
      <div id="main_info">
        <div class="separated textStyle" id="info_label">
          <div class="textStyle info_me"></div>
          <div class="textStyle info_">ID</div>
          <div class="textStyle info_you"></div>
        </div>
        <div class="textStyle separated" id="info_upload">
          <div class="textStyle info_me" id="up_status"></div>
          <div class="textStyle info_">업로드 상태</div>
          <div class="textStyle info_you"></div>
        </div>
        <div class="textStyle separated" id="info_steal">
          <div class="textStyle info_me"></div>
          <div class="textStyle info_">도용여부</div>
          <div class="textStyle info_you"></div>
        </div>
        <div class="textStyle separated" id="info_face">
          <div class="textStyle info_me"></div>
          <div class="textStyle info_">얼굴인식</div>
          <div class="textStyle info_you"></div>
        </div>

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
        유저정보
      </div>

      <!-- 업로드 , 교환 버튼 , 방 나가기 버튼 -->
      <div id="side_func">
        <form id="form1">
        <div id="func_file">
            <input type="file" id="file" name="file" size="10" />
        </div>
        <div id="func_btn">
          <button class="btn_func" id="btn_upload" disabled>upload</button>
          <button class="btn_func" id="btn_swap" disabled>교환</button>
          <button class="btn_func" id="btn_bye">나가기</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <div id="sp_cpr">
      @Copyright by keemdrop
  </div>
  <%--<svg version="1.1" xmlns="http://www.w3.org/2000/svg">
    <filter id="blurr">
      <feGaussianBlur stdDeviation="8" />
    </filter>--%>
  </svg>
  </body>
</html>
