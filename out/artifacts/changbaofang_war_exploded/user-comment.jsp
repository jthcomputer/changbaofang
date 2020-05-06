<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>用户评价</title>
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
        <div class="wrapper wrapper-content">
        
   	  	<form class="form-horizontal" action ="<c:url value='/UserServlet?act=forUpdatePersonal' />" method="post">
    <input type="hidden" name="userid" value="${userNow.userId}" />
    <html>

  <meta name="viewport" content="width=device-width">
  <title>用户评价</title>
  <link rel="stylesheet" href="//www.mdui.org/source/dist/css/mdui.min.css"/>
</head>
<body>
<body class="mdui-theme-primary-light-blue mdui-theme-accent-blue">
<h2 class="mdui-text-color-theme">评价详情</h2>

<div class="mdui-container">
  <div class="mdui-panel" mdui-panel>
    <div class="mdui-panel-item">
      <div class="mdui-panel-item-header">first</div>
      <div class="mdui-panel-item-body">
        <p>First comment</p>
        <p>First comment</p>
        <p>First comment</p>
        <p>First comment</p>
        <p>First comment</p>
        <p>First comment</p>
      </div>
    </div>
    <div class="mdui-panel-item">
      <div class="mdui-panel-item-header">Second</div>
      <div class="mdui-panel-item-body">
        <p>Second comment</p>
        <p>Second comment</p>
        <p>Second comment</p>
        <p>Second comment</p>
        <p>Second comment</p>
        <p>Second comment</p>
      </div>
    </div>
    <div class="mdui-panel-item">
      <div class="mdui-panel-item-header">Third</div>
      <div class="mdui-panel-item-body">
        <p>Third comment</p>
        <p>Third comment</p>
        <p>Third comment</p>
        <p>Third comment</p>
        <p>Third comment</p>
        <p>Third comment</p>
      </div>
    </div>
  </div>
</div>
 <div class="mdui-dialog-actions">

        <button class="mdui-btn mdui-ripple" mdui-dialog-close>关闭</button>
    </div>
<script src="//www.mdui.org/source/dist/js/mdui.min.js"></script>
</body>
</html>
    
