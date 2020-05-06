<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>酒店营营业额</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    
    <script src="https://gw.alipayobjects.com/os/lib/antv/g2/3.4.10/dist/g2.min.js"></script>

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
<style type="text/css">
    .mdui-btn{
        margin-right: 5px;
    }
</style>

<body class="mdui-theme-primary-light-blue mdui-theme-accent-blue">
<h2 class="mdui-text-color-theme">酒店营业额</h2>
<div id="content">
    <div id="tableArea">
        <table id="table">
<body>

    <!-- 创建图表容器 -->
    <div id="c1"></div>
    <script>
        
        const chart = new G2.Chart({ // 指定图表容器 ID
            container: 'c1', 
            width: 600,
            height: 300 
        });
        // Step 2: 载入数据源
        chart.source(data);
        chart.interval().position('hotelname*money').color('money')
        chart.render();//输出图表
    </script>
</body>
</table>
    </div>
</div>
</body>
<script>
    $("#btn").click(function () {
        $.ajax({
            url:"servlet/HandlerServlet",//后端路径
            type:"post",
            data:{},
            dataType:"json",
            error:function () {
                console.log("ajax请求数据失败！");
            },
            success: function (data) {
                //浏览器把接受到的json数据作为js对象，可通过.调用属性
                var info = "酒店名称"+data.hotelname + ",营业额：" + data.money;
                $("#show").text(info);
                console.log(data);
            }
        })
    });
</script>
</html>