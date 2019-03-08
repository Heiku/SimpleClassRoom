<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>关于</title>
    <script src="${request.contextPath}/plugin/layui/layui.js"></script>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css">
    <style>
        .top-operation {
            background-color: #F5F5F5;
            height: 35px;
            display: flex;
        }

        .top-operation div {
            flex: 1;
            line-height: 35px;
        }

        .content div {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<#assign me = "Juila Smith">
<#include "home/header.ftl">
<div class="layui-container">
    <div class="row content" style="margin-top: 20px;background-color: #F5F5F5;padding: 20px">
        <div>项目名称：</div>
        <div>项目作者：</div>
        <div>作者学号：</div>
        <div>作品简介：</div>
        <div>这个是一个在线拍卖平台</div>
    </div>

</body>
</html>