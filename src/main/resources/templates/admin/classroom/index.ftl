<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>教室管理</title>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${request.contextPath}/plugin/layui/layui.all.js"></script>
    <script type="text/javascript" src="${request.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
    <button class="layui-btn layui-btn-sm" id="add">添加</button>
    <div class="layui-tab layui-tab-brief">
        <div class="layui-tab-content">
            <div class="layui-input-inline" style="margin-lfet: 50px">
                <div class="layui-form">
                    <select name="type"  lay-filter="type" id="type">
                        <option value="0">机房</option>
                        <option value="1">多媒体教室</option>
                        <option value="2">礼堂</option>
                        <option value="3">普通教室</option>
                    </select>
                </div>
            </div>
            <table id="data" lay-filter="table">
        </div>
    </div>
</table>
<script>
    layui.use(['table','form'], function () {
        var $ = layui.jquery;
        var table = layui.table
                ,form = layui.form;

        //第一个实例
        table.render({
            elem: '#data'
            , height: 500
            , url: '${request.contextPath}/api/classroom/' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                , {field: 'name', title: '教室名', minWidth: 120}
                , {field: 'number', title: '容纳人数', minWidth: 200, sort: true}
                , {field: 'type', title: '类型', minWidth: 200, sort: true,templet:"#Number"}
                , {field: 'status', title: '状态', minWidth: 200,templet:"#Status"}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#toolbar'}
            ]]
        });

        // 教室类型筛选
        form.on('select(type)', function (data) {
            table.reload('table', {
                where: {
                    type: data.value
                }
            });
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
                        url: '${request.contextPath}/api/classroom/' + data.id,
                        type: 'delete',
                        success: function (data) {
                            alert("删除成功");
                        }
                    })
                });
            }
            <#--else if (layEvent === 'update') {-->
                <#--window.location.href = '${request.contextPath}/api/classroom/update?studentId=' + data.studentId;-->
            <#--}-->
        });

        //监听顶部添加按钮
        $("#add").click(function () {
            window.location.href = '${request.contextPath}/admin/classroom/add';
        })
    });

</script>

<script type="text/html" id="toolbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="delete">删除</button>
        <#--<button class="layui-btn layui-btn-sm" lay-event="update">编辑</button>-->
    </div>
</script>
<script type="text/html" id="Status">
    {{#  if(d.status == 0){ }}
    未使用
    {{# } else if(d.status == 1){ }}
    已被申请（未通过）
    {{# }  else if(d.status == 2){ }}
    申请已通过
    {{#  } else { }}
    状态错误
    {{#  } }}
</script>
<script type="text/html" id="Number">
    {{#  if(d.type == 0){ }}
    机房
    {{# } else if(d.type == 1){ }}
    多媒体教室
    {{# } else if(d.type == 2){ }}
    礼堂
    {{# } else if(d.type == 3){ }}
    普通教室
    {{#  } else { }}
    状态错误
    {{#  } }}
</script>
<script type="text/html" id="Teacher">
    {{ d.teacher.name}}
</script>
</body>
</html>