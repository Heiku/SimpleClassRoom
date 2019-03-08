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
            , url: '${request.contextPath}/order/list' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'sn', title: '订单号', width: 200}
                , {field: 'customerAddress', title: '地址', width: 180, templet:"#addressId"}
                , {field: 'status', title: '订单状态', width: 100, templet: '#orderStatus'}
                , {field: 'paymentMoney', title: '实际支付金额', sort: true, width: 180}
                , {field: 'payTime', title: '支付时间', sort: true, width: 180}
                , {field: 'deliveryTime', title: '配送时间', sort: true, width: 180}
                , {field: 'remarks', title: '用户备注', sort: true, minWidth: 180}
                 ,{fixed: 'right',title:'操作', align:'center', toolbar: '#toolbar',width:180}
            ]]
        });


        //监听行工具事件
        table.on('tool(table)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'detail') {
                layer.open({
                    type: 2,
                    title: '订单详情',
                    maxmin: true,
                    shadeClose: true, //点击遮罩关闭层
                    area: ['100%', '100%'],
                    content: '${request.contextPath}/order/detail?id='+ data.id + '&sn=' + data.sn
                });
            }else if (layEvent === 'show') {
                layer.confirm('确定商品已经发货？', function (index) {
                    //向服务端发送删除指令
                    $.ajax({
                        url: '${request.contextPath}/order/confirmorder',
                        type: 'post',
                        data: {'orderid': data.id},
                        success: function (data) {
                            layer.msg(data.msg)
                        }
                    })
                });
            }
        });

    });

</script>
<script type="text/html" id="toolbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="detail">查看详情</button>
        <button class="layui-btn layui-btn-sm" lay-event="show">确认发货</button>
    </div>
</script>

<script type="text/html" id="auditStatus">
    {{#  if(d.auditStatus == 0){ }}
    未审核
    {{#  } else { }}
    已审核
    {{#  } }}
</script>

<script type="text/html" id="orderStatus">
    {{#  if(d.status == 0){ }}
    待付款
    {{#  } else if(d.status == 10){ }}
    已付款
    {{#  } else if(d.status == 20){ }}
    已发货
    {{#  } else if(d.status == 30){ }}
    交易成功
    {{#  } else if(d.status == 40){ }}
    交易取消
    {{#  }else { }}
    状态错误
    {{#  } }}
</script>

<script type="text/html" id="addressId">
    {{ d.customerAddress.province+" "+d.customerAddress.city+" "+d.customerAddress.area+" "+d.customerAddress.specificAddress}}
</script>
</body>
</html>