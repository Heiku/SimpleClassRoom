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
<form class="layui-form" action="" lay-filter="form">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="account" placeholder="请输入" autocomplete="off" class="layui-input">
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
    <div class="layui-form-item layui-form-text">
        <div class="layui-inline">
            <label class="layui-form-label">余额</label>
            <div class="layui-input-block">
                <input type="number" name="balance" id="balance" autocomplete="off" class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-inline">
            <button type="button" id="inBalance">充值</button>
        </div>
    </div>
    <input type="hidden" name="id">
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<div id="balanceContent" style="display: none">
    <div>
        <div style="display: flex">
            <#--选择支付方式-->
            <div style="flex: 1;margin: 5%">
                <img src="http://hearfile.oss-cn-hangzhou.aliyuncs.com/u%3D1842135483%2C2612978228%26fm%3D26%26gp%3D0.jpg"
                     width="200px" height="auto" alt="">
                <div class="layui-input-block">
                    <input type="radio" name="payType" title="支付宝支付">
                </div>
            </div>
            <div style="flex: 1;margin: 5%">
                <img src="http://hearfile.oss-cn-hangzhou.aliyuncs.com/u%3D1968952788%2C3225364308%26fm%3D11%26gp%3D0.jpg"
                     width="200px" height="auto" alt="">
                <div class="layui-input-block">
                    <input type="radio" name="payType" title="微信支付">
                </div>
            </div>
        </div>
        <div>
            <form class="layui-form" action="" lay-filter="payForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">金额</label>
                    <div class="layui-input-inline">
                        <input type="number" name="money" id="money" required lay-verify="required" placeholder="请输入金额"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    //Demo
    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        var index = layer.load(1);
        var $ = layui.jquery;
        var moneyValue = 0;
        var balance = 0;
        $.ajax({
            url: '${request.contextPath}/api/user/${Session.user.id}',
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
                        <#--window.location.href = '${request.contextPath}/admin/user/list';-->
                    });
                }
            });
            return false;
        });

        $('#money').blur(function () {
            console.log($(this).val());
            moneyValue = $(this).val();
        });

        $('#inBalance').click(res = > {
            console.log("充值按钮");
        layer.open({
            type: 1,
            title: '充值',
            shadeClose: true,
            content: $('#balanceContent'),
            area: ['600px', '300'],
            btn: ['充值', '取消'],
            yes: function (index, layero) {
                layer.close(index);
                form.render();
                //获取余额
                balance = $('#balance').val();
                balance = Number(moneyValue) + Number(balance);
                //弹出支付二维码
                layer.open({
                    type: 1,
                    content: "<img src='http://hearfile.oss-cn-hangzhou.aliyuncs.com/f6deb23b25629dba6f7701a3ad8c0fa2.png' width='200px' height='auto'>",
                    shadeClose: true,
                    btn: '确定',
                    yes: function (index, layero) {
                        //增加余额
                        $.ajax({
                            url: '${request.contextPath}/api/user/${Session.user.id}',
                            type: 'put',
                            data: {
                                balance: balance
                            },
                            success: function (data) {
                                console.log(data);
                                $('#balance').val(balance);
                                layer.close(index);
                            }
                        });
                    }
                })
            },
            btn2: function (index, layero) {
                layer.close(index);
            }
        });
        form.render();
    })
    });
</script>