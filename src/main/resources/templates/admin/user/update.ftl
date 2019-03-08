<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${request.contextPath}/plugin/layui/layui.all.js"></script>
    <script type="text/javascript" src="${request.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;padding-top: 30px;">
    <legend>修改用户信息</legend>
    <form class="layui-form" lay-filter="form">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="account" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked="">
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
                <input type="text" name="phone" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text" name="email" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input type="number" name="age" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">个人描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="remark" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
        <#--更新需要指定id-->
        <input type="hidden" name="id" value="">
    </form>
</fieldset>
<script>
    getQueryString = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    };

    layui.use('form', function () {
        var form = layui.form;
        var index = layer.load(1);
        $.ajax({
            url: '${request.contextPath}/api/user/' + getQueryString("id"),
            type: 'get',
            success: function (data) {
                //表单初始化
                form.val("form", data.data);
                form.render();
                //关闭加载
                layer.close(index);
            }, error: function (data) {
                layer.msg("加载失败", {
                    time: 1500,
                    icon: 2//1为成功，2为失败
                }, function () {
                    window.history.back(-1);
                })
            }
        });

        //提交
        form.on('submit(submit)', function (data) {
            $.ajax({
                url: '${request.contextPath}/api/user/' + data.field.id,
                type: 'put',
                data: data.field,
                success: function (data) {
                    layer.msg('修改成功', {
                        time: 1500,
                        icon: 1,
                    }, function () {
                        window.location.href = '${request.contextPath}/admin/user/list';
                    });
                }
            });
            return false;
        });
    });

</script>
</body>
</html>