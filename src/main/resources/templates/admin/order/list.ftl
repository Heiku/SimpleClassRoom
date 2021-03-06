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
                , {field: 'roomName', title: '教室名', minWidth: 180}
                , {field: 'useFor', title: '用途', minWidth: 100}
                , {field: 'timeStr', title: '课节', sort: true, minWidth: 180}
                , {field: 'type', title: '教室类型', sort: true, minWidth: 180,templet:'#Type'}
                , {field: 'status', title: '教室状态', minWidth: 200,templet:"#Status"}
                , {field: 'student', title: '申请人', sort: true, minWidth: 180,templet:'#Student'}
                , {field: 'teacher', title: '辅导员', sort: true, minWidth: 180,templet:'#Teacher'}
                , {field: 'admin', title: '教保', sort: true, minWidth: 180,templet:'#Admin'}
                ,{field:'createTime', title: '创建时间',width:200, templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                ,{field:'modifyTime', title: '修改时间',width:200, templet: "<div>{{layui.util.toDateString(d.modifyTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
//                 ,{fixed: 'right',title:'操作', align:'center', toolbar: '#toolbar',width:180}
            ]]
        });


    });

</script>
<script type="text/html" id="Status">
    {{#  if(d.status == 0){ }}
    未审批
    {{# } else if(d.status == 1){ }}
    辅导员已审批
    {{# }  else if(d.status == 2){ }}
    教保已审批
    {{# }  else if(d.status == 3){ }}
    审批失败
    {{#  } else { }}
    状态错误
    {{#  } }}
</script>
<script type="text/html" id="Type">
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
<script type="text/html" id="Student">
    {{ d.student.name}}
</script>
<script type="text/html" id="Teacher">
    {{ d.teacher.name}}
</script>
<script type="text/html" id="Admin">
    {{ d.admin.name}}
</script>
</body>
</html>