<%--
  Created by IntelliJ IDEA.
  User: 王浩伟
  Date: 2020/4/16
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>我的订单</title>
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
<h2 class="mdui-text-color-theme">我的订单</h2>
<div id="content">
    <div id="tableArea">
        <table id="table"></table>
    </div>
</div>

<div id="record" class="mdui-dialog">
    <div class="mdui-dialog-content">
        <div class="mdui-dialog-title">酒店详细信息</div>
        <div>
            <form action="" id="detail_form">
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店名称</label>
                    <input class="mdui-textfield-input" type="text" id="hotelname" name="hotelname" readonly/>

                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">所在城市</label>
                    <input class="mdui-textfield-input" type="text" id="hotelcity" name="hotelcity" readonly required/>

                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店类型</label>
                    <input class="mdui-textfield-input" type="text" id="hoteltype" name="hoteltype" readonly  required/>

                </div>
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店星级</label>
                    <input class="mdui-textfield-input" type="text" id="hotelstar" name="hotelstar" readonly/>
                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店状态</label>
                    <input class="mdui-textfield-input" type="text" id="hotelstatus" name="hotelstatus" readonly/>
                </div>
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店详细地址</label>
                    <input class="mdui-textfield-input" type="text" id="hotellocal" name="hotellocal" readonly/>
                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店介绍</label>
                    <input class="mdui-textfield-input" type="text" id="hotelindex" name="hotelindex" readonly/>
                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">联系方式</label>
                    <input class="mdui-textfield-input" type="text" id="hotelcall" name="hotelcall" readonly/>
                </div>





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

    var userid = JSON.parse(sessionStorage.getItem("userid"))
    console.log(userid)
    var detailDialog=new mdui.Dialog("#record");
    window.operateEvents={
        "click .getdetail":function(index,value,row){
            getdetail(row.order_hotelid)
        },
        "click .deletebooking":function(index,value,row){
            deletebooking(row.order_id)
        }

    }





    $("#table").bootstrapTable({
        url: 'servlet/OrderServlet?order_userid='+userid,         //请求后台的URL（*）
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
            title:'#',
            align:'center'
        },{
            field:'order_userid',
            title:'入住人',
            align:'center',
            formatter:getusername666
        },{
            field:'order_hotelid',
            title:'酒店名称',
            align:'center',
            formatter:gethotelname666
        },{
            field:'order_checktime',
            title:'入住时间' ,
            align:'center'

        },{
            field:'order_leavetime',
            title:'离开时间',
            align:'center'
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

            '<button class="mdui-btn mdui-color-theme-accent mdui-ripple getdetail">查看酒店具体信息</button>',
            '<button class="mdui-btn mdui-color-theme-accent mdui-ripple deletebooking">取消预订</button>'


        ].join('')
    }




    function rm() {
        $(".myimg").remove();
    }
    function getdetail(hotelid){
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
                $$("#hotelname").val(data.hotelname);
                $$("#hotelcity").val(data.hotelcity);
                $$("#hoteltype").val(data.hoteltype);
                $$("#hotelstar").val(data.hotelstar);

                switch(data.hotelstatus){
                    case "0":
                        $$("#hotelstatus").val("可入住");
                        break;
                    case "1":
                        $$("#hotelstatus").val("满员");
                        break;
                }

                $$("#hotellocal").val(data.hotellocal);
                $$("#hotelindex").val(data.hotelindex);
                $$("#hotelcall").val(data.hotelcall);

                detailDialog.open();
            }
        })}

    function gethotelname1(hotelid){
        var hotelnameaa;

        $$.ajax({
            url:"servlet/OneHotelServlet",
            method:"get",
            dataType:"json",
            data:{
                hotelid:hotelid,
                type:1
            },
            async: false,
            success:function(data){
                hotelnameaa=data.hotelname;

            }});
        console.log(hotelnameaa)
        return hotelnameaa;
    }
    function  gethotelname666(value,row,index) {
        var name=gethotelname1(row.order_hotelid);

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
    function deletebooking(orderid) {

        mdui.dialog({
            title: '取消预订',
            content: '您想要取消预订吗？',
            buttons: [
                {
                    text: '取消'
                },
                {
                    text: '确认',
                    onClick: function(inst){
                        console.log(orderid)

                        mdui.snackbar({
                            message: '删除中...',
                            position: 'right-top'
                        });
                        $$.ajax({
                            method: 'post',
                            url: 'servlet/OrderServlet',
                            dataType: "json",
                            data:{
                                order_id:orderid,
                                type:2
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





</script>

</html>
