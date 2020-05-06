<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
<body class="mdui-theme-primary-indigo mdui-theme-accent-blue">
    <title>个人中心</title>
    <script src="js/jquery-3.3.1.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.js"></script>


    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">
    <script src="js/mdui.min.js"></script>



    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.js"></script>
    <!-- Latest compiled and minified Locales -->
    <script src="https://unpkg.com/bootstrap-table@1.14.2/dist/locale/bootstrap-table-zh-CN.min.js"></script>


</head>
</head>
<style type="text/css">
    .mdui-btn{
        margin-right: 5px;
    }
</style>

   
    <body>
     <div class="wrapper wrapper-content">
        
   	  	 <form class="form-horizontal" action ="<c:url value='/UserServlet?act=updatePersonal' />" method="post"> 
    <input type="hidden" name="userid" value="${userNow.userId}" />

      <div id="wenben">
           <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">email</i>
                    <label class="mdui-textfield-label">账户</label>
                    <input class="mdui-textfield-input" type="text" id="userid" name="userid" readonly/>

                </div>

            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">account_circle</i>
                <label class="mdui-textfield-label">用户名</label>
                <input class="mdui-textfield-input required" type="text" id="username" name="username" />
                <div class="mdui-textfield-error">用户名不能为空</div>
            </div>
            <!-- 浮动标签、多行文本框 -->
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="mdui-icon material-icons">lock</i>
                <label class="mdui-textfield-label">密码</label>
                <input class="mdui-textfield-input required" type="password" id="password" name="password" />
                <div class="mdui-textfield-error">密码不能为空</div>
            </div>
            <div>
             <button type="submit" class="mdui-btn mdui-center mdui-btn mdui-color-theme-accent  mdui-ripple update">保存用户名及密码</button> 

    </div>

    </body>
    <script>
    var $$=mdui.JQ;
    function update() {
        $$.ajax({
            method:'POST',
            url:'servlet/UserServlet',
            dataType: "json",
            data:{
               
                username:$("#username").val(),
                password:$("#password").val()
            },
     	success: function (data){
    	if(data.code == 200){
    	mdui.alert("更新成功了");
    	}else{
    	alert(data.message);
    	}
    	},
    	error:function (data) {

    	mdui.alert("更新失败！")
    	}

    	});
    	}

</script>
    
    <html>