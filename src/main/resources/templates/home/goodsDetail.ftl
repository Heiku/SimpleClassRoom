<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>详情</title>
    <script src="${request.contextPath}/plugin/layui/layui.js"></script>
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css">
    <style>
        .hot-list td:nth-child(2) {
            text-align: right;
        }

        .top-operation {
            background-color: #F5F5F5;
            height: 35px;
            display: flex;
        }

        .top-operation div {
            flex: 1;
            line-height: 35px;
        }

        .content-p {
            margin-bottom: 15px;
            margin-left: 20px;
            font-size: 18px;

        }

        .content p:nth-child(4) {
            margin-left: 65px;
        }

        .price {
            display: flex;
            border: 2px solid #f2f2f2;
            margin-left: 10px;
            margin-right: 30px;
        }

        .price p {
            flex: 1;
            margin: 10px;
        }

        .bid-history div {
            margin-bottom: 10px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<#include "home/header.ftl">
<#if Session.user??>
    <#assign userId = Session.user.id >
<#else>
    <#assign userId = "0" >
</#if>

<div class="layui-container">
    <div class="layui-row" style="margin-top: 2%">
        <div style="padding: 20px;border:2px solid #f2f2f2 ">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md9" style="border-right: 2px solid #f2f2f2">
                    <div><label style="font-weight: bold;font-size: 22px">${data.auctionDetail.productName}</label>
                    </div>
                    <div class="layui-row" style="margin-top: 30px">
                        <#--图片-->
                        <div class="layui-col-md5">
                            <div class="layui-carousel" id="test1">
                                <div carousel-item>
                                    <div>
                                        <img src="${data.auctionDetail.pictrue}" width="100%"
                                             height="100%">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <#--内容-->
                        <div class="layui-col-md7 content">
                            <p class="content-p">当前价:
                                <block style="font-size:25px;color: red">${data.auctionDetail.currentPrice}</block>
                                元 出价人：Y9720
                            </p>
                            <p class="content-p" id="endTime"></p>
                            <p class="content-p">出价: <input class="layui-form-item" type="number" id="price"
                                                            value="${data.auctionDetail.currentPrice +data.auctionDetail.priceRate}"
                                                            min="${data.auctionDetail.currentPrice +data.auctionDetail.priceRate}">
                            </p>
                            <p class="content-p" id="menu-content">
                                <#if Session.user?exists>
                                    <#if data.depositPaid??&&data.depositPaid=false>
                                        <button id="pay" class="layui-btn layui-btn-danger"
                                                onclick="depositPaid(${data.auctionDetail.id})"> 提交保证金
                                        </button>
                                    <#elseif data.depositPaid??&&data.depositPaid=true>
                                        <button id="bid" class="layui-btn layui-btn-danger"
                                                onclick="bid(${data.auctionDetail.id})"> 出价
                                        </button>
                                    <#else>
                                        <button class="layui-btn layui-btn-danger" onclick="showLogin()"> 请先登陆</button>
                                    </#if>
                                <#else>
                                    <button class="layui-btn layui-btn-danger" onclick="showLogin()"> 请先登陆</button>
                                </#if>
                            </p>
                            <div class="price">
                                <div>
                                    <p>起 拍 价 : ¥${data.auctionDetail.startingPrice}</p>
                                    <p>保 证 金 : ¥${data.auctionDetail.cautionMoney}</p>
                                </div>
                                <div>
                                    <p>加价幅度 : ¥${data.auctionDetail.priceRate}</p>
                                    <p>竞价周期 : ${data.auctionDetail.auctionDuration}天</p>
                                </div>
                                <div>
                                    <p>类 型 : 拍卖</p>
                                    <p>优先购买权人 : 无</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md3 bid-history">
                    <div><label>出价记录</label></div>
                    <#if (data.auctionBid?size=0)>
                        <div>暂无出价记录</div>
                    </#if>
                    <#list data.auctionBid as item>
                        <div>出价金额：${item.bidMoney}出价时间：${item.bidTime?datetime}</div>
                    </#list>
                </div>
            </div>
        </div>
    </div>
    <#--详情-->
    <div class="layui-row" style="margin-top: 2%">
        <div style="padding: 20px;border:2px solid #f2f2f2 ">
            <div class="layui-card">
                <div class="layui-card-header">详情</div>
                <div class="layui-card-body">
                    ${data.auctionDetail.description}
                </div>
            </div>
        </div>
    </div>
</div>

<div id="selectAddress" style="display: none">
    <form class="layui-form" lay-filter="form" style="margin: 5%">
        <div class="layui-form-item">
            <label class="layui-form-label">用户地址</label>
            <div class="layui-input-block">
                <select name="addressId" class="layui-form-select" lay-filter="address" id="addressSelectOption"
                        lay-filter="selectAddress">
                </select>
            </div>
        </div>
        <div id="addressDetail">

        </div>
    </form>
</div>

<script>
    ;!function () {
        var carousel = layui.carousel;
        var element = layui.element;
        var layer = layui.layer;
        var $ = layui.jquery;
        var form = layui.form;
        var addressId;
        form.render();
        //建造实例
        carousel.render({
            elem: '#test1'
            , width: '100%' //设置容器宽度
            , arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });

        form.on('select(selectAddress)', function (data) {
            addressId = data.value;
            return false;
        });

        //监听出价变化
        $("#price").blur(function () {
            if ($(this).val() <${data.auctionDetail.currentPrice +data.auctionDetail.priceRate}) {
                $("#price").val(${data.auctionDetail.currentPrice +data.auctionDetail.priceRate});
                layer.msg('不得低于“当前价”加“加价幅度”', {
                    time: 3000,
                    icon: 1,
                })
            }
        });

        //缴纳保证金
        window.depositPaid = function (auctionId) {
            layer.confirm('是否缴纳保证金？', {
                btn: ['是', '否']
            }, function (index, layero) {
                layer.close(index);
                $("#addressSelectOption").append("<#list data.address as item><option value = '${item.id}'>联系电话：${item.phone}&nbsp|&nbsp地址：${item.province+item.city+item.area+item.specificAddress}</option></#list>");
                <#if data.address[0]??>addressId = ${data.address[0].id}</#if>
                    //更新下拉菜单
                    form.render();
                layer.open({
                    type: 1,
                    title: '选择收货地址',
                    shadeClose: true,
                    content: $('#selectAddress').html(),
                    area: ['600px', '500px'],
                    btn: ['确定', '取消'],
                    yes: function (index, layero) {
                        //发起缴费
                        $.ajax({
                            url: '${request.contextPath}/api/auctionbid/pay',
                            type: 'post',
                            data: {
                                "userId":${userId},
                                "auctionId": auctionId,
                                "addressId": addressId
                            },
                            success: function (data) {
                                console.log(data);
                                if (data.code === 0) {
                                    layer.msg('缴纳成功', {
                                        time: 1500,
                                        icon: 1,
                                    }, function () {
                                        $('#pay').attr("style", "display:none;");
                                        $('#menu-content').append('<button id="bid" class="layui-btn layui-btn-danger"> 出价</button>');
                                        window.location.reload();
                                    });
                                }
                                layer.close(index);
                            }
                        });
                        return false;// 开启该代码可禁止点击该按钮关闭
                    },
                    btn2: function (index, layero) {
                        //取消交付定金
                        layer.close(index);
                    }
                });
                form.render();

            }, function (index) {
                layer.close(index);
            });

        };

        //出价
        window.bid = function (auctionId) {
            let price = $("#price").val();
            layer.confirm('是否出价' + price + '元？', {
                btn: ['是', '否']
            }, function (index, layero) {
                $.ajax({
                    url: '${request.contextPath}/api/auctionbid/bid',
                    type: 'post',
                    data: {
                        "userId":${userId},
                        "auctionId": auctionId,
                        "price": price
                    },
                    success: function (data) {
                        console.log(data);
                        if (data.code === 0) {
                            layer.msg('出价成功', {
                                time: 3000,
                                icon: 1,
                            }, function () {
                                window.location.reload();
                            });
                        } else {
                            layer.msg('出价失败' + data.data, {
                                time: 3000,
                                icon: 1,
                            })
                        }
                        layer.close(index);
                    }
                });
            }, function (index) {
                layer.close(index);
            });

        };


        $(function () {
            countDown(${(data.auctionDetail.stopTime?long)?replace(",","")});
        });

        //带天数的倒计时
        function countDown(times) {
            var timer = null;
            // times /= 1000;
            timer = setInterval(function () {
                var day = 0,
                    hour = 0,
                    minute = 0,
                    second = 0;//时间默认值
                let now = new Date().getTime();
                let gapTime = (times - now) / 1000;
                if (times > 0) {
                    day = Math.floor(gapTime / (60 * 60 * 24));
                    hour = Math.floor(gapTime / (60 * 60)) - (day * 24);
                    minute = Math.floor(gapTime / 60) - (day * 24 * 60) - (hour * 60);
                    second = Math.floor(gapTime) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                }
                if (day <= 9 && day >= 0) day = '0' + day;
                if (hour <= 9) hour = '0' + hour;
                if (minute <= 9) minute = '0' + minute;
                if (second <= 9) second = '0' + second;
                //
                // console.log(day + "天:" + hour + "小时：" + minute + "分钟：" + second + "秒");
                $('#endTime').html("距结束: " + day + "天：" + hour + "小时：" + minute + "分钟：" + second + "秒")
                times--;
            }, 1000);
            if (times <= 0) {
                clearInterval(timer);
            }
        };
    }();
</script>

</body>
</html>