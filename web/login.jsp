<%--
  Created by IntelliJ IDEA.
  User: 王浩伟
  Date: 2020/3/29
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>登录</title>


    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>


    <!-- Compiled and minified JavaScript -->
</head>

<style type="text/css">

    body {
        background-image: url("images/login.jpg");
        background-size: cover;
        background-repeat: no-repeat;
        background-size: 100% 100%;
    }

    #loginFrame{
        width: 400px;
        height: 500px;
        /*实现居中 这几个属性都要去设置！↓*/
        margin: auto;
        position: absolute;
        top: 0;
        bottom: 0;
        left: 800px;
        right: 0;
        /*实现居中 这几个属性都要去设置！↑*/
        background-color: white;
        opacity: 0.85;
    }


    #title{
        text-align: center;
        font-weight: 400;
    }

    #mainTitle{
        margin-top: 15px;
        font-size: 35px;
    }
    #subTitle{
        margin-top: 15px;
        font-size: 20px;
    }
    #wenben{
        margin-top: 10px;
        width: 80%;
        margin-left: 30px;
    }
    #anniu{
        margin-top: 10px;
    }
    #copyRight{
        margin-top: 65px;
        font-size: 10px;
        color: #757575;
        text-align: center;
    }
    #zhuce{
        margin-top: 25px;
    }





</style>

<body class="mdui-theme-primary-black mdui-theme-accent-blue">
<div id="loginFrame" class="mdui-shadow-24">
    <div id="logo"></div>
    <div id="title" class="mdui-text-color-theme" >
        <div id="mainTitle">长包房</div>
        <div id="123">酒店管理</div>
    </div>

    <div id="wenben">
        <div class="mdui-textfield mdui-textfield-floating-label">
            <i class="mdui-icon material-icons">account_circle</i>
            <label class="mdui-textfield-label">账户</label>
            <input class="mdui-textfield-input required" type="text" id="userid" name="userid"  required/>
            <div class="mdui-textfield-error">用户名不能为空</div>
        </div>

        <!-- 浮动标签、多行文本框 -->
        <div class="mdui-textfield mdui-textfield-floating-label">
            <i class="mdui-icon material-icons">lock</i>
            <label class="mdui-textfield-label">密码</label>
            <input class="mdui-textfield-input required" type="password" id="password" name="password"  required/>
            <div class="mdui-textfield-error">密码不能为空</div>
        </div>


        <div id="anniu">
            <button id="login" onclick="login123()"  class="mdui-btn mdui-center mdui-btn-icon mdui-color-grey-200 mdui-ripple"><i class="mdui-icon material-icons">done</i></button>
        </div>

    </div>


    <div id="zhuce" class="mdui-center" style="width: 180px"><a href="register.jsp">还没有帐号？立刻注册！</a></div>

    <div id="copyRight" >
        © 2020 whw<br>
    </div>



</div>
</body>
<script>
    var $$=mdui.JQ;
    function login123() {
        $$.ajax({
            method:'GET',
            url:'servlet/UserServlet',
            dataType: "json",
            data:{
                type:1,
                userid:$("#userid").val(),
                password:$("#password").val()
            },
            success:function (data) {
                console.log(111)
                console.log(data)

                sessionStorage.setItem("username",JSON.stringify(data.username));
                sessionStorage.setItem("userid",JSON.stringify(data.userid));
                switch (data.usertype) {
                    case "0":
                        window.location.href="adminindex.jsp";
                        break;
                    case "1":
                        window.location.href="userindex.jsp";
                        break;

                }
            },
            error:function(data){
                mdui.alert("用户名或密码错误！")
            }




        })
    }

</script>





</html>

