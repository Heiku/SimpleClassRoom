<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${request.contextPath}/css/orderDetail.css" media="all">
    <script type="text/javascript" src="${request.contextPath}/plugin/layui/layui.js"></script>
    <script type="text/javascript" src="${request.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>


<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-12">
            <div class="layui-card" style="margin-top: 20px">
                <div id="odPcName" class="layui-card-header"><span id="username" class="left">订单详情</span><span class="right">订单号:<span id="sn"></span></span></div>
                <div class="layui-card-body">
                    <div id="orders" class="layui-row">

                    </div>
                </div>
            </div>
        </div>

    </div>


</div>


<script>
    layui.use([ 'layer',  'element'], function() {
        var $ = layui.$;

        var id = getParam('id');
        var sn = getParam('sn');
        $('#sn').text(sn);
        // 订单的详情数据
        var orders = [];
        $.ajax({
            type: 'get',
            url: '${request.contextPath}/order/listbyorderid?id=' + id ,
            success: function (res) {
                orders = res.data;
                console.log(orders);
                $('#orders').empty();
                orders.forEach(function(item) {

                    $('#orders').append(
                            '<div class="layui-col-xs4" style="padding: 0 20px">' +
                            '<div class="layui-card" style="margin-top: 20px ">' +
                            '<div id="odPcName" class="layui-card-header  layui-bg-green" title="'+ item.productName +'">'+ item.productName + '</div>' +
                            '<div class="layui-card-body">' +
//                            '<div class="image">' +
//                            '<img width="100%" height="100%" src="'+item.productPic+'">' +
//                            '</div>' +
                            '<div class="item">' +
                            '<label class="title">商品单价</label>' +
                            '<p class="detail">￥'+item.productPrice+'</p>' +
                            '</div>' +
                            '<div class="item">' +
                            '<label class="title">商品数量</label>' +
                            '<p class="detail">' + item.amount + '份</p>' +
                            '</div>' +
                            '<div class="item">' +
                            '<label class="title">商品总价格</label>' +
                            '<p class="detail">￥'+ (item.amount * item.productPrice) +'</p>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>'
                    );
                })
            }
        })


        // 获取url上的参数
        function getParam(paramName) {
            paramValue = "", isFound = !1;
            if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
                arrSource = unescape(this.location.search).substring(1, this.location.search.length).split("&"), i = 0;
                while (i < arrSource.length && !isFound) arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++
            }
            return paramValue == "" && (paramValue = null), paramValue
        }

    })
</script>
</body>
</html>