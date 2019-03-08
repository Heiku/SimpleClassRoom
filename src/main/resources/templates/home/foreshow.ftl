<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>预告</title>
    <script src="${request.contextPath}/plugin/layui/layui.js"></script>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css">
</head>
<body>
<#include "home/header.ftl">
<div class="layui-container">
    <div class="row" style="background-color: #F2F2F2;padding: 20px;margin-top: 20px">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-header">即将拍卖</div>
                    <div class="layui-card-body">
                        <div class="layui-row">
                            <#list data.auction as item>
                                <div class="layui-col-md4">
                                    <div class="layui-card">
                                        <a href="${request.contextPath}/home/goodsDetail?id=${item.id}">
                                            <div class="layui-card-body">
                                                <img src="${item.picture}" width="100%">
                                                ${item.productName}<br>
                                                ${item.description?substring(0,30)}
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </#list>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>