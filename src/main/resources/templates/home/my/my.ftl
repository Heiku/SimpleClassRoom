<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
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

        .flex-box {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .left {
            flex: 1;
            border-right: 2px solid #ffffff;
            padding: 20px;
        }

        .left li {
            text-align: center;
            margin-bottom: 20px;
        }

        .right {
            flex: 8;
            margin: 20px;
            height: 600px;
            width: auto;
        }
    </style>
</head>
<body>
<#include "home/header.ftl">
<div class="layui-container">
    <div class="row flex-box" style="background-color: #F2F2F2;margin-top: 20px">
        <#--left-->
        <div class="left">
            <ul>
                <li><a href="javascript:;" onclick="selectTab('info')">个人信息</a></li>
                <li><a href="javascript:;" onclick="selectTab('order')">订单信息</a></li>
                <li><a href="javascript:;" onclick="selectTab('address')">地址信息</a></li>
                <li><a href="javascript:;" onclick="selectTab('passwd')">修改密码</a></li>
                <li><a href="javascript:;" onclick="selectTab('lgout')">退出登陆</a></li>
            </ul>
        </div>
        <#--right-->
        <div class="right">
            <iframe id="iframe-page-content" src="${request.contextPath}/home/my/info" width="100%" height="600px"
                    frameborder="no" border="0" marginwidth="0" marginheight=" 0" scrolling="auto"
                    allowtransparency="yes"></iframe>
        </div>
    </div>

</body>
</html>
<script>
    ;!function () {
        var carousel = layui.carousel;
        var element = layui.element;
        var layer = layui.layer;
        var $ = layui.jquery;
        //建造实例
        carousel.render({
            elem: '#test1'
            , width: '100%' //设置容器宽度
            , arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
        $(".search").click(function () {
            layer.open({
                title: '搜索'
                , content: '<input type="text" \>'
            });
        })

        window.selectTab = function (res) {
            if (res === "lgout") {
                //   执行退出操作
                window.location.href = '${request.contextPath}/home/my/lgout';
            } else {
                $("#iframe-page-content").attr('src', "${request.contextPath}/home/my/" + res);
            }
        }
    }();

</script>