<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>房源管理</title>
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
<h2 class="mdui-text-color-theme">房源管理</h2>
<div id="content">
    <div id="tableArea">
        <table id="table"></table>
    </div>
</div>

<div id="record" class="mdui-dialog">
    <div class="mdui-dialog-content">
        <div class="mdui-dialog-title">房源详细信息</div>
        <div>
            <form action="" id="detail_form">
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">房源名称</label>
                    <input class="mdui-textfield-input" type="text" id="sellname" name="sellname" readonly/>

                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">所在城市</label>
                    <input class="mdui-textfield-input" type="text" id="sellcity" name="sellcity" readonly required/>
                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店状态</label>
                    <input class="mdui-textfield-input" type="text" id="sellstatus" name="sellstatus" readonly/>
                </div>
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店详细地址</label>
                    <input class="mdui-textfield-input" type="text" id="selllocal" name="selllocal" readonly/>
                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">酒店介绍</label>
                    <input class="mdui-textfield-input" type="text" id="sellindex" name="sellindex" readonly/>
                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">联系方式</label>
                    <input class="mdui-textfield-input" type="text" id="sellcall" name="sellcall" readonly/>
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
        <div class="mdui-dialog-title">房源详细信息</div>
        <div>
            <form action="" id="xiugai_form">
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">房源ID</label>
                    <input class="mdui-textfield-input" type="text" id="xsellid" name="xsellid" readonly/>

                </div>
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">房源名称</label>
                    <input class="mdui-textfield-input" type="text" id="xsellname" name="xsellname" />

                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">所在城市</label>
                    <input class="mdui-textfield-input" type="text" id="xsellcity" name="xsellcity"  />

                </div>
                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">房源详细地址</label>
                    <input class="mdui-textfield-input" type="text" id="xselllocal" name="xselllocal" >
                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">房源介绍</label>
                    <input class="mdui-textfield-input" type="text" id="xsellindex" name="xsellindex" >
                </div>

                <div class="mdui-textfield">
                    <label class="mdui-textfield-label">房源方式</label>
                    <input class="mdui-textfield-input" type="text" id="xsellcall" name="xsellcall" >
                </div>

            </form>
        </div>

    </div>
    <div class="mdui-dialog-actions">
        <button class="mdui-btn mdui-ripple" onclick="update2()">修改</button>
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
            getdetail(row.sellid)
        },
        "click .update":function(index,value,row){
            update(row.sellid)
        },
        "click .delete":function(index,value,row){
            deleteSubmit(row.sellid)
        }
    }


    $("#table").bootstrapTable({
        url: 'servlet/SellServlet',         //请求后台的URL（*）
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
        uniqueId: "selllid",                     //每一行的唯一标识，一般为主键列
        showExport: true,                     //是否显示导出
        exportDataType: "basic",
        columns: [ {
            field:'sellid',
            title:'#',
            align:'center'


        },{
            field:'sellname',
            title:'房源名称',
            align:'center'


        },{
            field:'sellcity',
            title:'所在城市',
            align:'center'


        },{
            field:'sellstatus',
            title:'状态',
            align:'center',
            formatter:getsellroomnum666
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

            '<button class="mdui-btn mdui-color-theme-accent mdui-ripple getdetail">查看房源具体信息</button>',
            '<button class="mdui-btn mdui-color-theme-accent mdui-ripple update">修改房源信息</button>',
            '<button class="mdui-btn mdui-color-theme-accent mdui-ripple delete">删除房源</button>'
        ].join('')
    }

    function gethotleroomnum1(sellid){
        var hotleroomnum;

        $$.ajax({
            url:"servlet/SellServlet",
            method:"get",
            dataType:"json",
            data:{
                sellid:sellid,
                type:1
            },
            async: false,
            success:function(data){
            	sellroomnumaa=data.sellroomnum;

            }});

        return sellnameaa;
    }
    function  sellleroomnum666(value,row,index) {
        var name=getsellroomnum1(row.order_sellid);

        return ['<span>'+sellroomnum+'</span>'].join('');

    }

    function sellSubmit(sellid) {

        mdui.dialog({
            title: '删除房源',
            content: '您想要删除房源吗？',
            buttons: [
                {
                    text: '取消'
                },
                {
                    text: '确认',
                    onClick: function(inst){
                        console.log(sellid)

                        mdui.snackbar({
                            message: '删除中...',
                            position: 'right-top'
                        });
                        $$.ajax({
                            method: 'post',
                            url: 'servlet/SellServlet',
                            dataType: "json",
                            data:{
                            	sellid:sellid,
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

    function getdetail(sellid){
        $$.ajax({
            url:"servlet/SellServlet",
            method:"get",
            dataType:"json",
            data:{
                sellid:sellid,
                type:1
            },
            success:function(data){
                console.log(data)
                $$("#sellname").val(data.sellname);
                $$("#sellcity").val(data.sellcity);

                switch(data.sellstatus){
                    case "0":
                        $$("#sellstatus").val("未卖出");
                        break;
                    case "1":
                        $$("#sellstatus").val("已卖出");
                        break;
                }

                $$("#selllocal").val(data.selllocal);
                $$("#sellindex").val(data.sellindex);
                $$("#sellcall").val(data.sellcall);

                detailDialog.open();
            }
        })}

    function update(sellid){
        $$.ajax({
            url:"servletSellServlet",
            method:"get",
            dataType:"json",
            data:{
                sellid:sellid,
                type:1
            },
            success:function(data){
                console.log(data)
                $$("#xsellid").val(data.sellid);
                $$("#xsellname").val(data.sellname);
                $$("#xsellcity").val(data.sellcity);
                $$("#xselllocal").val(data.selllocal);
                $$("#xsellindex").val(data.sellindex);
                $$("#xsellcall").val(data.sellcall);

                xiugai.open();
            }
        })
    }
    function update2(){
        $$.ajax({
            method: 'post',
            url: 'servlet/SellServlet',
            dataType: "json",
            data:{
                type:3,
                sellid:$("#xsellid").val(),
                sellname:$("#xsellname").val(),
                sellcity:$("#xsellcity").val(),
                selllocal:$("#xselllocal").val(),
                sellindex:$("#xsellindex").val(),
                sellcall:$("#xsellcall").val(),
            },
            success: function (data) {
                $$("#submit").removeAttr("disabled");
                mdui.snackbar({
                    message: '修改成功',
                    position: 'right-top'
                });
                history.go(0)
            },
            fail:function () {
                $$("#submit").removeAttr("disabled");
                mdui.snackbar({
                    message: '修改失败',
                    position: 'right-top'
                });
            }

        })}
</script>
</html>