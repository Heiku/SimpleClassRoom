<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单中心</title>
    <script src="${request.contextPath}/plugin/layui/layui.js"></script>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css">
</head>
<body>
<table id="data" lay-filter="table">
</table>
<#if Session.user??>
    <#assign userId = Session.user.id >
<#else>
    <#assign userId = "0" >
</#if>
<div id="comment" style="display: none;">
    <form class="layui-form" action="" lay-filter="form" style="margin: 5%">
        <div class="layui-form-item">
            <label class="layui-form-label">评价</label>
            <div class="layui-input-block">
                <textarea required lay-verify="required" lay-filter="content" name="content"
                          class="layui-textarea"></textarea>
            </div>
        </div>
    </form>
</div>

<script>
    layui.use(['table', 'layer', 'form'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        //评论内容
        var commentContent = "";
        var hadComment = false;
        var layer = layui.layer;
        var form = layui.form;
        form.render();

        //第一个实例
        table.render({
            elem: '#data'
            , height: 500
            , url: '${request.contextPath}/order/listByUserId?userId=${Session.user.id}' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 60, sort: true, fixed: 'left'}
                , {field: 'orederNumber', title: '订单号', width: 140, sort: true}
                , {field: 'userName', title: '用户名', width: 80}
                , {field: 'transactionPrice', title: '成交价', width: 80}
                , {field: 'productName', title: '商品名', width: 100, sort: true}
                , {field: 'auctionDuration', title: '拍卖时长', width: 100}
                , {
                    field: 'orderStatus',
                    title: '订单状态',
                    width: 120,
                    id: "orderStatus",
                    templet: "<div>{{#  if(d.orderStatus == 0){ }}<div>待付款</div>{{#  } else if(d.orderStatus == 1) { }}<div>已付款</div>{{#  } else if(d.orderStatus == 2) { }}<div>配送中</div>{{#  } else if(d.orderStatus == 4) { }}<div>送达</div>{{#  } else { }}<div>无</div>{{#  } }}</div>"
                }
                , {field: 'modifyTime', title: '更新时间', width: "140"}
                , {field: 'createDate', title: '创建时间', sort: true, width: "140"}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#toolbar', width: "120"}
            ]]
        });

        // form.on('select(content)', function(data){
        //     console.log(data);
        // });

        //监听行工具事件
        table.on('tool(table)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'pay') {
                layer.confirm('确定支付？', function (index) {
                    layer.close(index);
                    //向服务端发送修改订单状态指令
                    $.ajax({
                        url: '${request.contextPath}/order/alterorderstatus',
                        type: 'post',
                        data: {
                            "id": data.id,
                            "orderstatus": 1
                        },
                        success: function (data) {
                            alert("支付成功");
                        }
                    })
                });
            } else if (layEvent === 'detail') {
                window.location.href = '${request.contextPath}/home/my/orderDetail?id=' + data.id
            } else if (layEvent === 'comment') {
                layer.open({
                    type: 1,
                    title: '评价',
                    shadeClose: true,
                    content: $('#comment').html(),
                    area: ['600px', '300'],
                    btn: ['确定', '取消'],
                    success: function (layero, index) {
                        //查找是否有相应的评价
                        $.ajax({
                            url: '${request.contextPath}/order/auctioncomment/getByAuctionId',
                            type: 'get',
                            data: {
                                "auctionId": data.auctionId
                            }, success: res = > {
                            if(res.code === 0)
                        {
                            hadComment = true;
                            $('.layui-textarea').val(res.data.content);
                            $('.layui-textarea').prop("readonly", true)
                        }
                    else
                        {
                            hadComment = false;
                        }
                    }
                    })

                        $('.layui-textarea').bind('input propertychange', function () {
                            commentContent = $(this).val();
                        })
                    },
                    yes: function (index, layero) {
                        if (hadComment) {
                            layer.close(index);
                        } else {
                            $.ajax({
                                url: '${request.contextPath}/order/auctioncomment/add',
                                type: 'post',
                                data: {
                                    "userId":${userId},
                                    "customerName": "${Session.user.name}",
                                    "auctionId": data.auctionId,
                                    "content": commentContent
                                },
                                success: function (data) {
                                    console.log(data);
                                    if (data.code === 0) {
                                        layer.msg('评价成功', {
                                            time: 3000,
                                            icon: 1,
                                        }, function () {
                                            window.location.reload();
                                        });
                                    } else {
                                        layer.msg('评价失败' + data.data, {
                                            time: 3000,
                                            icon: 1,
                                        })
                                    }
                                    layer.close(index);
                                }
                            });
                        }
                    }, btn2: function (index, layero) {
                        layer.close(index);
                    }
                });
                form.render();
            }
        });

    });

</script>

<script type="text/html" id="toolbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="detail">查看</button>
        {{# if(d.orderStatus==0){ }}
        <button class="layui-btn layui-btn-sm" lay-event="pay">付款</button>
        {{# } else if(d.orderStatus == 4) { }}
        <button class="layui-btn layui-btn-sm" lay-event="comment">评价</button>
        {{# } }}
    </div>
</script>

</body>
</html>