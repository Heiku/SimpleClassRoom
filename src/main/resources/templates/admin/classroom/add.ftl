<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加教室</title>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${request.contextPath}/plugin/layui/layui.all.js"></script>
    <script type="text/javascript" src="${request.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;padding-top: 30px;">
    <legend>添加教室</legend>
    <form class="layui-form" lay-filter="form">
        <div class="layui-form-item">
            <label class="layui-form-label">教室名</label>
            <div class="layui-input-block">
                <input type="text" name="name" placeholder="请输入教室名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">容纳人数</label>
            <div class="layui-input-block">
                <input type="number"  name="number" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">教室类型</label>
            <div class="layui-input-block">
                <select name="type"  id="type">
                    <option value="0">机房</option>
                    <option value="1">多媒体教室</option>
                    <option value="2">礼堂</option>
                    <option value="3">普通教室</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">教室状态</label>
            <div class="layui-input-block">
                <select name="status"  id="status">
                    <option value="0">未使用</option>
                    <option value="1">已被申请（未通过）</option>
                    <option value="2">申请已通过</option>
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


        form.on('submit(submit)', function (data) {
            $.ajax({
                url: '${request.contextPath}/api/classroom/',
                type: 'post',
                data: data.field,
                success: function (data) {
                    layer.msg('创建成功', {
                        time: 1500,
                        icon: 1,
                    }, function () {
                        window.location.href = '${request.contextPath}/admin/classroom/index';
                    });
                }
            });
            return false;
        });
    });

</script>
</body>
</html>