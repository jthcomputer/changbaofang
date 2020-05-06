<%--
  Created by IntelliJ IDEA.
  User: 王浩伟
  Date: 2020/3/30
  Time: 0:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>酒店预定</title>
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

    <script src="https://cdn.bootcss.com/moment.js/2.24.0/moment-with-locales.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


</head>
<style type="text/css">
    .mdui-btn{
        margin-right: 5px;
    }
    .newone{
        height: 100px;
    }
</style>

<body class="mdui-theme-primary-light-blue mdui-theme-accent-blue">
<h2 class="mdui-text-color-theme">酒店预定</h2>
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

<div id="xiugai" class="mdui-dialog">
    <div class="mdui-dialog-content">
        <div class="mdui-dialog-title">酒店预定信息</div>
        <div>
            <form action="" id="xiugai_form">
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店ID</label>
                    <input class="mdui-textfield-input" type="text" id="xhotelid" name="xhotelid" readonly/>

                </div>
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店名称</label>
                    <input class="mdui-textfield-input" type="text" id="xhotelname" name="xhotelname" readonly />

                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">所在城市</label>
                    <input class="mdui-textfield-input" type="text" id="xhotelcity" name="xhotelcity"  readonly/>

                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店类型</label>
                    <input class="mdui-textfield-input" type="text" id="xhoteltype" name="xhoteltype"  readonly />

                </div>
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店星级</label>
                    <input class="mdui-textfield-input" type="text" id="xhotelstar" name="xhotelstar" readonly>
                </div>


                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店详细地址</label>
                    <input class="mdui-textfield-input" type="text" id="xhotellocal" name="xhotellocal" readonly>
                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店介绍</label>
                    <input class="mdui-textfield-input" type="text" id="xhotelindex" name="xhotelindex" readonly>
                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">联系方式</label>
                    <input class="mdui-textfield-input" type="text" id="xhotelcall" name="xhotelcall" readonly>
                </div>


        <div class="row">
            <div class='col-sm-6'>
                <div class="form-group">
                    <label>选择入住时间：</label>
                    <!--指定 date标记-->
                    <div class='input-group date' id='datetimepicker1'>
                        <input type='text' class="form-control" id="hotelchecktime"/>
                        <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
                    </div>
                </div>
            </div>
            <div class='col-sm-6'>
                <div class="form-group">
                    <label>选择离店时间：</label>
                    <!--指定 date标记-->
                    <div class='input-group date' id='datetimepicker2'>
                        <input type='text' class="form-control" id="hotelleavetime"/>
                        <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
                    </div>
                </div>
            </div>
        </div>
            </form>
        </div>
</div>

    <div class="mdui-dialog-actions">
        <button class="mdui-btn mdui-ripple" onclick="shedule2()">预定</button>
        <button class="mdui-btn mdui-ripple" mdui-dialog-close>关闭</button>
    </div>

    </div>













</body>

<script>
    var $$=mdui.JQ;
    var xiugai=new mdui.Dialog("#xiugai");
    var detailDialog=new mdui.Dialog("#record");
    window.operateEvents={
        "click .getdetail":function(index,value,row){
            getdetail(row.hotelid)
        },
        "click .shedule":function(index,value,row){
            shedule(row.hotelid)
        }
    }





    $("#table").bootstrapTable({
        url: 'servlet/HotelServlet',         //请求后台的URL（*）
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
        uniqueId: "hotelid",                     //每一行的唯一标识，一般为主键列
        showExport: true,                     //是否显示导出
        exportDataType: "basic",
        columns: [ {
            field:'hotelid',
            title:'#',
            align:'center'

        },{
            field:'hotelname',
            title:'酒店名称',
            align:'center'


        },{
            field:'hotelcity',
            title:'所在城市',
            align:'center'


        },{
            field:'hoteltype',
            title:'酒店类别' ,
            align:'center'

        },{
            field:'hotelstar',
            title:'星级',
            align:'center'
        },{
            field:'hotelstatus',
            title:'状态',
            align:'center',
            formatter:stapanduan
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
            '<button class="mdui-btn mdui-color-theme-accent mdui-ripple shedule">预定酒店</button>',

        ].join('')
    }




    function rm() {
        $(".myimg").remove();
    }

    function stapanduan(value,row,index){

        switch(row.hotelstatus){
            case "0":
                return ['<span>可入住</span>'].join('');
                break;

            case "1":
                return ['<span>满员</span>'].join('');
                break;



        }
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

    function shedule(hotelid){
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
                $$("#xhotelid").val(data.hotelid);
                $$("#xhotelname").val(data.hotelname);
                $$("#xhotelcity").val(data.hotelcity);
                $$("#xhoteltype").val(data.hoteltype);
                $$("#xhotelstar").val(data.hotelstar);
                $$("#xhotellocal").val(data.hotellocal);
                $$("#xhotelindex").val(data.hotelindex);
                $$("#xhotelcall").val(data.hotelcall);

                xiugai.open();
            }
        })

    }
    var userid = JSON.parse(sessionStorage.getItem("userid"))
    console.log(userid)

    function shedule2(){
        $$.ajax({
            url:"servlet/OrderServlet",
            method:"post",
            dataType:"json",
            data:{
                type:1,
                order_userid:userid,
                order_hotelid:$("#xhotelid").val(),
                order_checktime:$("#hotelchecktime").val(),
                order_leavetime:$("#hotelleavetime").val(),
            },
            success: function(data) {
                $$("#submit").removeAttr("disabled");
                mdui.snackbar({
                    message: '预定成功',
                    position: 'right-top'
                });
                history.go(0)
            },
            fail:function() {
                $$("#submit").removeAttr("disabled");
                mdui.snackbar({
                    message: '预定失败',
                    position: 'right-top'
                });
            }
        })
    }


    $(function () {
        var picker1 = $('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn'),
            //minDate: '2016-7-1'
        });
        var picker2 = $('#datetimepicker2').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        //动态设置最小值
        picker1.on('dp.change', function (e) {
            picker2.data('DateTimePicker').minDate(e.date);
        });
        //动态设置最大值
        picker2.on('dp.change', function (e) {
            picker1.data('DateTimePicker').maxDate(e.date);
        });
    });
</script>

</html>
