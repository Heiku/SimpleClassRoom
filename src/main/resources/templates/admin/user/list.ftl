<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${request.contextPath}/plugin/layui/layui.all.js"></script>
    <script type="text/javascript" src="${request.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
<button class="layui-btn layui-btn-sm" id="add">添加</button>
<table id="data" lay-filter="table">
</table>
<script>
    layui.use('table', function () {
        var $ = layui.jquery;
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#data'
            , height: 500
            , url: '${request.contextPath}/api/user/' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 60, sort: true, fixed: 'left'}
                , {field: 'account', title: '用户名', width: 120}
                , {field: 'name', title: '姓名', width: 100}
                , {field: 'sex', title: '性别', width: 80, sort: true}
                , {field: 'age', title: '年龄', width: 80, sort: true}
                , {field: 'phone', title: '电话', width: 80}
                , {field: 'email', title: '邮箱', width: 80}
                , {field: 'balance', title: '余额', width: 80, sort: true}
                , {field: 'remark', title: '备注', width: 120}
                , {field: 'modifyTime', title: '更新时间',}
                , {field: 'createTime', title: '创建时间', sort: true}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#toolbar'}
            ]]
        });

        //监听行工具事件
        table.on('tool(table)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url: '${request.contextPath}/api/user/' + data.id,
                        type: 'delete',
                        success: function (data) {
                            alert("删除成功");
                        }
                    })
                });
            } else if (layEvent === 'update') {
                window.location.href = '${request.contextPath}/admin/user/update?id=' + data.id;
            }
        });

        //监听顶部添加按钮
        $("#add").click(function () {
            window.location.href = '${request.contextPath}/admin/user/add';
        })
    });

</script>

<script type="text/html" id="toolbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="delete">删除</button>
        <button class="layui-btn layui-btn-sm" lay-event="update">编辑</button>
    </div>
</script>
</body>
</html>