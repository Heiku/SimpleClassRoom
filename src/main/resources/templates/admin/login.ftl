<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <#--<link rel="shortcut icon" href="<%=request.getContextPath()%>/x-admin/favicon.ico" type="image/x-icon" />-->
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${request.contextPath}/plugin/x-admin/css/font.css">
    <link rel="stylesheet" href="${request.contextPath}/plugin/x-admin/css/xadmin.css">
    <script type="text/javascript" src="${request.contextPath}/plugin/layui/layui.all.js"></script>
    <script type="text/javascript" src="${request.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>

</head>
<body class="login-bg">

<div class="login">
    <div class="message">商品后台管理系统</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form">
        <input name="account" placeholder="用户名" autocomplete="off" type="text" lay-verify="account" class="layui-input" value="admin">
        <hr class="hr15">
        <input name="password" lay-verify="password" placeholder="密码" autocomplete="off" type="password"
               class="layui-input" value="111111">
        <hr class="hr15">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20">
    </form>
</div>


<script>
    var layer;
    $(function () {
        layui.use(['form', 'layer'], function () {
            var form = layui.form;
            form.verify({
                account: function (v) {
                    if (v.trim() == '') {
                        return "用户名不能为空";
                    }
                }
                , password: function (v) {
                    if (v.trim() == '') {
                        return "密码不能为空";
                    }
                }
            });

            form.render();
        });
        layer = layui.layer;
        form.on('submit(login)', function (data) {
            $.ajax({
                url: '${request.contextPath}/auth/homeDoLogin',
                type: 'post',
                data: $('forms').serialize(),
                success: function (data) {
                    if (data.success) {
                        layer.msg('登陆成功', {
                            time: 1500,
                            icon: 1,
                        }, function () {
                            window.location.href = '${request.contextPath}/admin/index';
                        });
                    }

                }
            });
            return false;
        });
        <#--var msg = '${message}';-->
        <#--if (msg.trim() != "") {-->
            <#--layer.msg(msg, {icon: 5, anim: 6, offset: 't'});-->
        <#--}-->
    })

    if (window != top)
        top.location.href = location.href;
</script>


<!-- 底部结束 -->
</body>
</html>