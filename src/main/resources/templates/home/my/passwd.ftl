<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="${request.contextPath}/plugin/layui/layui.js"></script>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css">
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">原来的密码</label>
        <div class="layui-input-block">
            <input type="password" name="oldPassword" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">重复密码</label>
        <div class="layui-input-block">
            <input type="password" name="dpassword" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>
    layui.use('form', function () {
        var form = layui.form;
        var $ = layui.jquery;

        form.render();
        form.on('submit(submit)', function (data) {
            console.log(data);
            $.ajax({
                url: '${request.contextPath}/auth/upPassword/',
                type: 'post',
                data: data.field,
                success: function (data) {
                    if (data.code === 10015) {
                        layer.msg('修改成功', {
                            time: 1500,
                            icon: 1,
                        }, function () {
                            <#--window.location.href = '${request.contextPath}/admin/address/list';-->
                        });
                    } else {
                        layer.msg('修改失败' + data.msg, {
                            time: 1500,
                            icon: 1,
                        })
                    }
                }
            });
            return false;
        });
    })

</script>
</body>
</html>