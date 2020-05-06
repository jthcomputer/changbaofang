<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>用户积分</title>
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
<style type="text/css">
    .mdui-btn{
        margin-right: 5px;
    }
</style>

<body class="mdui-theme-primary-light-blue mdui-theme-accent-blue">
<h2 class="mdui-text-color-theme">用户积分</h2>
<div id="content">
    <div id="tableArea">
        <table id="table"></table>
    </div>
</div>

<div id="record" class="mdui-dialog">
    <div class="mdui-dialog-content">
        <div class="mdui-dialog-title">用户积分</div>
        <div>
            <form action="" id="detail_form">
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">积分</label>
                    <input class="mdui-textfield-input" type="text" id="userpoints" name="hotelname" readonly/>

                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">用户名</label>
                    <input class="mdui-textfield-input" type="text" id="userid" name="userid" readonly  required/>

            </form>
        </div>


    </div>
    <div class="mdui-dialog-actions">

        <button class="mdui-btn mdui-ripple" mdui-dialog-close>关闭</button>
    </div>
</div>




</body>

<script>
    var $$=mdui.JQ;

    var detailDialog=new mdui.Dialog("#record");
    window.operateEvents={
        "click .getdetail":function(index,value,row){
            getdetail(row.order_hotelid)
        }

    }





    $("#table").bootstrapTable({
        url: 'servlet/OrderServlet?order_usertype=abc',         //请求后台的URL（*）
        method: 'GET',                      //请求方式（*）
        toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortOrder: "asc",                   //排序方式
        //    queryParams: oTableInit.queryParams,//传递参数（*）
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        smartDisplay:true,
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 9,                       //每页的记录行数（*）
        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
        search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        // showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "order_id",                     //每一行的唯一标识，一般为主键列
        showExport: true,                     //是否显示导出
        exportDataType: "basic",
        columns: [ {
            field:'order_id',
            title:'序号',
            align:'center'
        },{
            field:'order_userid',
            title:'用户名' ,
            align:'center',
            formatter:getusername666            
        },{
        	field:'order_userpoints',
            title:'积分',
            align:'center',
            formatter:getuserpoints666
        },{
            field: 'operation',
            title: '操作',
            align: 'center',
            events:operateEvents,//给按钮注册事件
            formatter:addFunctionAlty//表格中增加按钮
        }
        ]
    })
    
    function addFunctionAlty(){
        return[

            '<button class="mdui-btn mdui-color-theme-accent mdui-ripple update">修改</button>',
            '<button class="mdui-btn mdui-color-theme-accent mdui-ripple delete">删除</button>'


        ].join('')
    }
    
    function deleteSubmit(userpoints) {

        mdui.dialog({
            title: '删除酒店',
            content: '确定删除？',
            buttons: [
                {
                    text: '取消'
                },
                {
                    text: '确认',
                    onClick: function(inst){
                        console.log(hotelid)

                        mdui.snackbar({
                            message: '删除中...',
                            position: 'right-top'
                        });
                        $$.ajax({
                            method: 'post',
                            url: 'servlet/HotelServlet',
                            dataType: "json",
                            data:{
                                hotelid:hotelid,
                                type:1
                            },
                            success: function (data) {
                                $$("#submit").removeAttr("disabled");
                                mdui.snackbar({
                                    message: '删除成功',
                                    position: 'right-top'
                                });
                                history.go(0)
                            },
                            fail:function () {
                                $$("#submit").removeAttr("disabled");
                                mdui.snackbar({
                                    message: '删除失败',
                                    position: 'right-top'
                                });
                            }
                        });

                    }
                }
            ]
        });
    };
    
    
    function update(userpoints){
        $$.ajax({
            url:"servlet/OneHotelServlet",
            method:"get",
            dataType:"json",
            data:{
                hotelid:hotelid,
                type:1
            },
            success:function(data){
                console.log(data)
                $$("userpoints").val(data.hotelid);
                xiugai.open();
            }
        })

    }

    
    function getuserpoints1(userpoints){
        var userpointsaa;

        $$.ajax({
            url:"servlet/OneHotelServlet",
            method:"get",
            dataType:"json",
            data:{
            	userpoints:userpoints,
                type:1
            },
            async: false,
            success:function(data){
            	userpointsaa=data.userpoints;

            }});

        return hotelnameaa;
    }
    function  getuserpoints666(value,row,index) {
        var name=getuserpoints1(row.order_userpoints);

        return ['<span>'+name+'</span>'].join('');

    }

    function getusername1(userid){
        var usernameaa;
        $$.ajax({
            url:"servlet/UserServlet",
            method:"get",
            dataType:"json",
            data:{
                userid:userid,
                type:2
            },
            async: false,
            success:function(data){
                usernameaa=data.username;
                console.log(usernameaa)
            }});

        return usernameaa;
    }
    
    function  getusername666(value,row,index) {
        var name123=getusername1(row.order_userid);

        return ['<span>'+name123+'</span>'].join('');

    }
    
    
</script>

</html>
