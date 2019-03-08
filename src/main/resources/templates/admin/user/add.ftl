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
    <legend>添加用户信息</legend>
    <form class="layui-form" lay-filter="form">
        <div class="layui-form-item">
            <label class="layui-form-label">学生号</label>
            <div class="layui-input-block">
                <input type="text" name="studentId" placeholder="请输入学生号" autocomplete="off" class="layui-input">
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
                <input type="radio" name="gender" value="男" title="男" checked="">
                <input type="radio" name="gender" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">院系</label>
            <div class="layui-input-block">
                <input type="text" name="faculty" placeholder="请输入院系" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">专业方向</label>
            <div class="layui-input-block">
                <input type="text" name="subject" placeholder="请输入专业方向" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">辅导员</label>
            <div class="layui-input-block">
                <select name="teacherId"  id="teacherId">

                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</fieldset>
<script>
    layui.use('form', function () {
        var form = layui.form;
        //表单初始化(如果不初始化，会出现部分控件无效的情况)
        form.render();

        // 渲染辅导员
        $.ajax({
            url: '${request.contextPath}/api/user/teacher',
            type: 'get',
            success: function (res) {
                $('#teacherId').empty();
                if (res.success && res.data) {
                    var data = res.data;
                    data.forEach(function(item) {
                        $('#teacherId').append('<option value="' + item.teacherId + '">' + item.name + '</option>');
                    })
                }
                form.render();
            }
        });

        form.on('submit(submit)', function (data) {
            $.ajax({
                url: '${request.contextPath}/api/user/',
                type: 'post',
                data: data.field,
                success: function (data) {
                    layer.msg('创建成功', {
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