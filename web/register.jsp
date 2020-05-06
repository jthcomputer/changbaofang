<%--
  Created by IntelliJ IDEA.
  User: 王浩伟
  Date: 2020/3/29
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
<head>
    <title>注册</title>


    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>

    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
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
        left: 0;
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
    #qwe{
        margin-top: 15px;
    }




</style>

<body class="mdui-theme-primary-black mdui-theme-accent-blue">

    <div id="loginFrame" class="mdui-shadow-24">
        <div id="logo"></div>
        <div id="title" class="mdui-text-color-theme " >
            <div id="mainTitle">长包房酒店管理</div>
            <div id="qwe">欢迎注册！</div>
        </div>



        <div id="wenben">
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">email</i>
                <label class="mdui-textfield-label">账户</label>
                <input class="mdui-textfield-input required" type="text" id="userid" name="userid" required/>
                <div class="mdui-textfield-error">账户不能为空</div>
            </div>

            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">account_circle</i>
                <label class="mdui-textfield-label">用户名</label>
                <input class="mdui-textfield-input required" type="text" id="username" name="username" required/>
                <div class="mdui-textfield-error">用户名不能为空</div>
            </div>
            <!-- 浮动标签、多行文本框 -->
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">lock</i>
                <label class="mdui-textfield-label">密码</label>
                <input class="mdui-textfield-input required" type="password" id="password" name="password" required/>
                <div class="mdui-textfield-error">密码不能为空</div>
            </div>
            <div>

                <select class="mdui-select mdui-center" id="usertype"  name="usertype">
                    <option value="1" selected>用户</option>
                    <option value="0">管理员</option>

                </select>
            </div>
            <div id="anniu">
                <button id="login" onclick="register123()" class="mdui-btn mdui-center mdui-btn-icon mdui-color-grey-200 mdui-ripple"><i class="mdui-icon material-icons">done</i></button>
            </div>

        </div>





    </div>

</body>
    <script>
        var $$=mdui.JQ;
        function register123() {
            $$.ajax({
                method:'GET',
                url:'servlet/UserServlet',
                dataType: "json",
                data:{
                    type:3,
                    userid:$("#userid").val(),
                    username:$("#username").val(),
                    password:$("#password").val(),
                    usertype:$("#usertype").val()

                },
                success:function (data) {
                    window.location.href="login.jsp";

                },
                error:function(data){
                    mdui.alert("注册失败！")
                }

            })
        }
    </script>




</html>


