<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${request.contextPath}/plugin/layui/layui.js"></script>
    <script type="text/javascript" src="${request.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
<button class="layui-btn layui-btn-sm" id="add">添加</button>
<table id="data" lay-filter="table">
</table>

<div id="addAddress" style="display: none;">
    <fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;padding-top: 30px;">
        <legend>添加用户地址</legend>
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">用户</label>
                <div class="layui-input-block">
                    <input type="text" value="${Session.user.account}" disabled placeholder="请输入" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮编</label>
                <div class="layui-input-block">
                    <input type="text" name="zipCode" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">省份</label>
                <div class="layui-input-block">
                    <input type="text" name="province" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">城市</label>
                <div class="layui-input-block">
                    <input type="text" name="city" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">区/县</label>
                <div class="layui-input-block">
                    <input type="text" name="area" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">详细地址</label>
                <div class="layui-input-block">
                    <input type="text" name="specificAddress" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">是否默认</label>
                <div class="layui-input-block">
                    <input type="radio" name="isDefault" value="0" title="是" checked="">
                    <input type="radio" name="isDefault" value="1" title="否">
                </div>
            </div>
            <input type="hidden" name="userId" value="${Session.user.id}">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="addAddressForm">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </fieldset>
</div>
<script>
    layui.use(['table', 'layer', 'form'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        //第一个实例
        table.render({
            elem: '#data'
            , height: 500
            , url: '${request.contextPath}/api/address/userId/${Session.user.id}' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 60, sort: true, fixed: 'left'}
                // ,{field: 'userId', title: '用户ID', width:80}
                , {field: 'phone', title: '联系电话', width: 120}
                , {field: 'zipCode', title: '邮编', width: 100, sort: true}
                , {field: 'province', title: '省份', width: 100, sort: true}
                , {field: 'city', title: '城市', width: 100}
                , {field: 'area', title: '区/县', width: 100}
                , {field: 'specificAddress', title: '具体地址', width: 120, sort: true}
                , {
                    field: 'isDefault',
                    title: '默认',
                    width: 60,
                    templet: "<div>{{#  if(d.isDefault == 0){ }}<div>否</div>{{#  } else { }}<div>是</div>{{#  } }}</div>"
                }
                , {field: 'modifyTime', title: '修改时间', sort: true}
                , {field: 'createDate', title: '创建时间', sort: true}
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#toolbar'}
            ]]
        });

        //监听行工具事件
        table.on('tool(table)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url: '${request.contextPath}/api/address/' + data.id,
                        type: 'delete',
                        success: function (data) {
                            alert("删除成功");
                        }
                    })
                });
            } else if (layEvent === 'update') {
                window.location.href = '${request.contextPath}/admin/address/update?id=' + data.id;
            }
        });

        var indexLayer;

        //监听顶部添加按钮
        $("#add").click(function () {
            layer.open({
                type: 1,
                title: '添加地址',
                shadeClose: true,
                content: $('#addAddress').html(),
                success: function (layero, index) {
                    indexLayer = index;
                }
            })
        });
        form.render();
        form.on('submit(addAddressForm)', function (data) {
            console.log(data);
            $.ajax({
                url: '${request.contextPath}/api/address/',
                type: 'post',
                data: data.field,
                success: function (data) {
                    if (data.success === true) {
                        layer.msg('创建成功', {
                            time: 1500,
                            icon: 1,
                        }, function () {
                            <#--window.location.href = '${request.contextPath}/admin/address/list';-->
                        });
                        layer.close(indexLayer);
                    } else {
                        layer.msg('创建失败' + data.msg, {
                            time: 1500,
                            icon: 1,
                        })
                    }
                }
            });
            return false;
        });
    });

</script>

<script type="text/html" id="toolbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="delete">删除</button>
        <button class="layui-btn layui-btn-sm" lay-event="update">编辑</button>
    </div>
</script>
</body>
</html>