<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            margin:0px;
        }
        #nav{
            width:100%;
            height:5%;
            background-color: mediumpurple;
        }
        #container{
            width:80%;
            margin: auto;
        }
        #logo{
            width: 50%;
            height: 100%;
            float: left;
        }
        #logo_text{
            font-size: 27pt;
            color:white;
            background-color: mediumpurple;
            border: none;
        }
        #func{
            width: 50%;
            height: 100%;
            float: right;
        }
        .h_btn{
            float: right;
            margin-top: 13px;
            color: white;
            border: none;
            font-size: 12pt;
            background-color: mediumpurple;
        }
    </style>
</head>
<body>
    <div id="nav">
        <div id="container">
            <a href="localhost:8888/"><div id="logo">
                <input type="text" id="logo_text" value="SwaPic.com"readonly>
            </div></a>
            <div id="func">
                <button class="h_btn" id="btn_mypage">mypage</button>
                <button class="h_btn" id="btn_logout">Logout</button>
            </div>
        </div>
    </div>

</body>
</html>
