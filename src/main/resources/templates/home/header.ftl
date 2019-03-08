<script src="${request.contextPath}/plugin/layui/layui.all.js"></script>
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
</style>
<div class="layui-row top-operation">
    <div style="flex: 10"></div>
    <#--<div class="search">-->
    <#--<button class="layui-btn" style="height: 30px;line-height: 30px">搜索</button>-->
    <#--</div>-->
    <#if Session.user?exists>
        <div><a href="${request.contextPath}/home/my">个人中心</a></div>
    <#else>
        <div class="login">
            <button onclick="showLogin()" class="layui-btn" style="height: 30px;line-height: 30px">登陆</button>
        </div>
    </#if>
    <div></div>
    <div></div>
    <#--<div><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=627865816&site=qq&menu=yes">联系客服<img border="0" src="http://wpa.qq.com/pa?p=2:627865816:52" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></div>-->
    <#--<div><a href="#" onclick="javascript:addFavorite2()" rel=sidebar>收藏夹</a></div>-->
</div>
<div class="layui-header layui-row">
    <div style="height: 130px;background: url(${request.contextPath}/images/logo2.jpg) center center no-repeat #c3203b;">
    </div>
</div>
<div class="layui-container">
    <div class="layui-row" style="margin-top: 75px">
        <ul class="layui-nav">
            <li class="layui-nav-item"><a href="">最新热拍</a></li>
            <li class="layui-nav-item">
                <a href="${request.contextPath}/home/index">首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">分类</a>
                <dl class="layui-nav-child">
                    <#if Session.SESSION_HEARD.category?exists>
                        <#list Session.SESSION_HEARD.category as item>
                            <dd><a href="${request.contextPath}/home/categoryList?id=${item.pctId}">${item.pctName}</a>
                            </dd>
                        </#list>
                    </#if>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${request.contextPath}/home/foreshow">预告</a></li>
            <li class="layui-nav-item"><a href="${request.contextPath}/home/about">关于</a></li>
        </ul>
    </div>
</div>

<#--登陆框-->
<div id="loginContent" style="display: none">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="account" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码框</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="loginForm">立即提交</button>
                <#--<button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
                <button type="button" onclick="showRegister()" class="layui-btn layui-btn-primary register">注册</button>
            </div>
        </div>
    </form>
</div>
<#--注册框-->
<div id="registerContent" style="display: none">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="account" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码框</label>
            <div class="layui-input-inline">
                <input type="password" id="password" name="password" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">重复密码</label>
            <div class="layui-input-inline">
                <input type="password" id="dpassword" name="dpassword" required lay-verify="required"
                       placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="registerForm">立即提交</button>
            </div>
        </div>
    </form>
</div>

<script>
    ;!function () {
        var layer = layui.layer;
        var $ = layui.jquery;
        var element = layui.element;
        var form = layui.form;

        element.render();

        form.on('submit(registerForm)', function (data) {
            console.log(data);
            if (data.field.password === data.field.dpassword) {
                $.ajax({
                    url: '${request.contextPath}/auth/homeDoRegister/',
                    type: 'post',
                    data: data.field,
                    success: function (data) {
                        console.log(data);
                        if (data.code === 10012) {
                            layer.msg('创建成功', {
                                time: 1500,
                                icon: 1,
                            }, function () {
                                window.location.href = '${request.contextPath}/home/index';
                            });
                        } else {
                            layer.msg(data.msg, {
                                time: 1500,
                                icon: 1,
                            })
                        }
                    }
                });
            } else {
                layer.msg("两次输入的密码不一致", {
                    time: 1500,
                    icon: 1,
                })
            }
            return false;
        });

        form.on('submit(loginForm)', function (data) {
            console.log(data);
            $.ajax({
                url: '${request.contextPath}/auth/homeDoLogin/',
                type: 'post',
                data: data.field,
                success: function (data) {
                    console.log(data);
                    if (data.code === 10009) {
                        layer.msg('登陆成功', {
                            time: 1500,
                            icon: 1,
                        }, function () {
                            window.location.reload();
                        });
                    } else {
                        layer.msg('登陆失败' + data.msg, {
                            time: 1500,
                            icon: 1,
                        })
                    }
                }
            });
            return false;
        });

        window.showLogin = function () {
            layer.open({
                type: 1,
                title: '登陆',
                shadeClose: true,
                content: $('#loginContent').html()
            })
        };
        window.showRegister = function () {
            console.log("注册按钮");
            layer.close(layer.index);
            layer.open({
                type: 1,
                title: '注册',
                shadeClose: true,
                content: $('#registerContent').html()
            })
        };
        $(".search").click(function () {
            layer.open({
                title: '搜索'
                , content: '<input type="text" \>'
            });
        });
        window.addFavorite2 = function () {
            var url = window.location || 'http://www.w3cschool.cn';
            var title = document.title;
            var ua = navigator.userAgent.toLowerCase();
            if (ua.indexOf("360se") > -1) {
                alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
            } else if (ua.indexOf("msie 8") > -1) {
                window.external.AddToFavoritesBar(url, title); //IE8
            } else if (document.all) {
                try {
                    window.external.addFavorite(url, title);
                } catch (e) {
                    alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
                }
            } else if (window.sidebar) {
                window.sidebar.addPanel(title, url, "");
            } else {
                alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
            }
        }
    }();

</script>