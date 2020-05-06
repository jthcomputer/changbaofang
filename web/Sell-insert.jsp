<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>添加房源</title>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

    <link href="https://cdn.bootcss.com/mdui/0.4.3/css/mdui.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/mdui/0.4.3/js/mdui.min.js"></script>

    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
</head>

<style type="text/css">


    body{
        align-content: center;
    }

    .mylabel{
        padding-top: 30px;
        padding-left: 20px;
        font-size: 20px;
    }

    #BasicInfo{
        border-radius: 15px;
        margin: 0 auto;
        align-content: center;
        width: 800px;
    }

    #ConInfo{
        padding-top: 15px;
        border-radius: 15px;
        margin: 30px auto;
        align-content: center;
        width: 800px;
    }

    #PhotoInfo{
        padding-top: 15px;
        border-radius: 15px;
        margin: 30px auto;
        align-content: center;
        width: 800px;
    }

    .mdui-textfield{
        margin-right: 40px;
        margin-left: 40px;
    }

    .Separate{
        padding-bottom: 30px;
    }

    #addImg{
        margin-left: 15px;
    }

    #submitButton{
        text-align: center;
        margin-bottom: 30px;
    }

    .uploadArea{
        padding: 20px;
    }
</style>

<body class="mdui-theme-primary-light-blue mdui-theme-accent-blue">

<h2 class="mdui-text-color-theme" >添加房源</h2>


<div id="content">

    <form  id="form" >

        <div id="BasicInfo" class="mdui-shadow-5">

            <div id="basicInfoLabel" class="mylabel" >房源信息</div>


            <div class="mdui-textfield">
                <label class="mdui-textfield-label">房源ID</label>
                <input class="mdui-textfield-input required" type="text" id="sellid" name="sellid"  required/>
                <div class="mdui-textfield-error">此项不能为空</div>
            </div>

            <div class="mdui-textfield">
                <label class="mdui-textfield-label">房源名称</label>
                <input class="mdui-textfield-input required" type="text" id="sellname" name="sellname" required/>
                <div class="mdui-textfield-error">此项不能为空</div>
            </div>
            <div class="mdui-textfield">
                <label class="mdui-textfield-label">所在城市</label>
                <input class="mdui-textfield-input required" type="text" id="sellcity" name="sellcity" required/>
                <div class="mdui-textfield-error">此项不能为空</div>
            </div>
            <div class="mdui-textfield">
                <label class="mdui-textfield-label">房源介绍</label>
                <input class="mdui-textfield-input required" type="text" id="sellindex" name="sellindex" required/>
                <div class="mdui-textfield-error">此项不能为空</div>
            </div>
            <div class="mdui-textfield">
                <label class="mdui-textfield-label">联系方式</label>
                <input class="mdui-textfield-input required" type="text" id="sellcall" name="sellcall" required/>
                <div class="mdui-textfield-error">此项不能为空</div>
            </div>
            <div class="Separate"></div>
        </div>
    </form>

    <div id="submitButton">
        <button id="submit" class="mdui-btn mdui-color-theme-accent mdui-ripple" onclick="infoSubmit()" >提交</button>
    </div>


</div>

</body>

<script>
    var $$=mdui.JQ;
    function infoSubmit() {
        $$("#submit").attr("disabled","true");
        mdui.snackbar({
            message: '上传中...',
            position: 'right-top'
        });
        $$.ajax({
            method: 'POST',
            url: 'servlet/SellServlet',
            dataType: "json",
            data:{
                type:2,
                sellid:$("#selllid").val(),
                sellname:$("#sellname").val(),
                sellcity:$("#sellcity").val(),
                
                sellindex:$("#selllindex").val(),
                sellcall:$("#sellcall").val(),
                sellstatus:0
            },
            success: function (data) {
                $$("#submit").removeAttr("disabled");
                mdui.snackbar({
                    message: '提交成功',
                    position: 'right-top'
                });
            },
            fail:function () {
                $$("#submit").removeAttr("disabled");
                mdui.snackbar({
                    message: '提交失败',
                    position: 'right-top'
                });
            }
        });
    }
</script>
</html>