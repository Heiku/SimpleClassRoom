<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单管理列表</title>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${request.contextPath}/plugin/layui/layui.js"></script>
    <script type="text/javascript" src="${request.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
<table id="data" lay-filter="table">
</table>
<script>
    layui.use(['table', 'layer'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;

        //第一个实例
        table.render({
            elem: '#data'
            , height: 500
            , url: '${request.contextPath}/api/order/' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                , {field: 'roomName', title: '教室名', width: 180, templet:"#addressId"}
                , {field: 'useFor', title: '用途', width: 100, templet: '#orderStatus'}
                , {field: 'classTime', title: '课节', sort: true, width: 180}
                , {field: 'type', title: '教室类型', sort: true, width: 180}
//                 ,{fixed: 'right',title:'操作', align:'center', toolbar: '#toolbar',width:180}
            ]]
        });


    });

</script>

</body>
</html>