<%--
  Created by IntelliJ IDEA.
  User: 王浩伟
  Date: 2020/3/29
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>长包房酒店管理</title>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>


</head>
<style type="text/css">
    #content{
        margin-top: 30px;
        /* display: table-cell;
         vertical-align: top;*/
    }
    #frame{
        height: 650px;
        width: 100%;
    }
</style>
<body class="mdui-drawer-body-left mdui-appbar-with-toolbar  mdui-theme-primary-light-blue" >
<header class="mdui-appbar  mdui-appbar-fixed">
    <div class="mdui-toolbar mdui-color-blue-300 ">
        <a href="javascript:;" class="mdui-btn mdui-btn-icon mdui-container"  id="toggle"><i class="mdui-icon material-icons">menu</i></a>
        <span class="mdui-typo-title">长包房酒店管理</span>
        <div class="mdui-toolbar-spacer"></div>
        <a > <i class="mdui-icon material-icons">&#xe853;</i><span id="uname"></span></a>
        <a href="login.jsp" mdui-tooltip="{content: '注销'}" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">&#xe879;</i></a>
        <a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>
    </div>
</header>
<div class="mdui-drawer" id="main-drawer">
    <div class="mdui-list" mdui-collapse="{accordion: true}" style="margin-bottom: 76px;">
        <div class="mdui-collapse-item ">
            <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-blue">near_me</i>
                <div class="mdui-list-item-content">我的酒店</div>
                <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
            <div class="mdui-collapse-item-body mdui-list">
                <a onclick="switich('hotel-insert.jsp')" class="mdui-list-item mdui-ripple ">添加酒店</a>
                <a onclick="switich('hotel-list.jsp')" class="mdui-list-item mdui-ripple ">酒店管理</a>
                <a onclick="switich('hotel-orderlist.jsp')" class="mdui-list-item mdui-ripple">酒店订单</a>
                <a onclick="switich('hotel-money.jsp')" class="mdui-list-item mdui-ripple">酒店营业额</a>
 	            <a onclick="switich('user-comment.jsp')" class="mdui-list-item mdui-ripple">查看用户评价</a>
                <a onclick="switich('personal.jsp')" class="mdui-list-item mdui-ripple">个人中心</a>
            </div>
        </div>
    </div>


    <div class="mdui-list" mdui-collapse="{accordion: true}" style="margin-bottom: 76px;">
        <div class="mdui-collapse-item ">
            <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                <i class="mdui-list-item-icon mdui-icon material-icons mdui-text-color-blue">near_me</i>
                <div class="mdui-list-item-content">用户管理</div>
                <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
            </div>
           
            <div class="mdui-collapse-item-body mdui-list">
                <a onclick="switich('hotel-userpoints.jsp')" class="mdui-list-item mdui-ripple ">用户积分</a>
                <a onclick="switich('hotel-usercomplaints.jsp')" class="mdui-list-item mdui-ripple ">用户投诉</a>
            </div>
        </div>
    </div>

</div>



</div>
<div id="content" class="mdui-container">
    <iframe name="frame" id="frame"  src="" frameborder="0" scrolling="auto" >
        您的浏览器不支持HTML5，请升级浏览器再试
    </iframe>
</div>
</body>
<script>
    var $$=mdui.JQ;
    var username = JSON.parse(sessionStorage.getItem("username"))
    var userid = JSON.parse(sessionStorage.getItem("userid"))
    console.log(username)
    $("#uname").html(username);
    function switich(url) {
        $$("#frame").attr('src',url);
    }
</script>

</html>