<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="${request.contextPath}/plugin/layui/layui.js"></script>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css">
</head>
<body>
<form class="layui-form" action="" lay-filter="form">
    <div class="layui-form-item">
        <div class="layui-input-block">
            <img class="layui-upload-img" id="img" width="150" height="150"
                 src="${data.detail.productPicture}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" disabled value="${data.detail.userName}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单号</label>
        <div class="layui-input-block">
            <input type="text" disabled value="${data.detail.orederNumber}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品名</label>
        <div class="layui-input-block">
            <input type="text" disabled value="${data.detail.transactionPrice}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">拍卖时长</label>
        <div class="layui-input-block">
            <input type="text" disabled value="${data.detail.auctionDuration}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单状态</label>
        <div class="layui-input-block">
            <input type="text" disabled
                   value="<#if data.detail.orderStatus = 0>待付款<#elseif data.detail.orderStatus = 1>已付款<#elseif data.detail.orderStatus = 2>配送中<#elseif data.detail.orderStatus = 3>送达<#else>交易完成</#if>"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">拍卖时长</label>
        <div class="layui-input-block">
            <input type="text" disabled value="${data.detail.auctionDuration}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <textarea name="desc" disabled
                      class="layui-textarea">联系电话：${data.address.phone}地址：${data.address.province+data.address.city+data.address.area+data.address.specificAddress}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" type="button" onclick="javascript:history.back()" lay-filter="submit">返回</button>
        </div>
    </div>
</form>
</body>
</html>