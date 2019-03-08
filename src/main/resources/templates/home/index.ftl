<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>随缘在线拍卖网</title>
    <style>
        .hot-list td:nth-child(2) {
            text-align: right;
        }

        .goods {
            display: flex;
            flex: 3;
            background-color: #f6f6f6;
            margin-bottom: 20px;
        }

        .goods div:nth-child(2) {
            flex: 2;
            margin: 20px;
            font-size: 22px;
            font-weight: bold;
        }

        .goods div:nth-child(2) p:nth-child(2) {
            margin-top: 10px;
            font-size: 14px;
            font-weight: normal;
        }

        .goods div:nth-child(2) p:nth-child(3) {
            font-size: 14px;
            color: #c11f3a;
            margin-top: 30px;
        }

        .goods div button {
            margin-top: 0;
            margin-bottom: 0;
            flex: 1;
            height: 80px;
            line-height: 30px
        }
    </style>
</head>
<body>
<#include "home/header.ftl">
<div class="layui-container">
    <div class="layui-row" style="margin-top: 2%">
        <div style="padding: 20px; background-color: #F2F2F2;">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md9">
                    <div class="layui-card">
                        <div class="layui-carousel" id="test1">
                            <div carousel-item>
                                <#list data.banner as item>
                                    <div><img src="${item.picture}" width="100%" height="100%">
                                    </div>
                                </#list>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md3">
                    <table class="layui-table" lay-skin="line">
                        <tbody class="hot-list">
                        <#list data.auction as item>
                            <tr>
                                <td>
                                    <a href="${request.contextPath}/home/goodsDetail?id=${item.id}">${item.productName}</a>
                                </td>
                                <td>${item.beginTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            </tr>
                        </#list>
                        </tbody>

                    </table>
                </div>
            </div>

        </div>
    </div>

    <div class="layui-row" style="margin-top: 2%">
        <div style="padding: 20px; background-color: #F2F2F2;">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">拍卖流程</div>
                        <div class="layui-card-body">
                            <img width="100%" src="${request.contextPath}/images/liucheng.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="layui-row" style="margin-top: 2%">
        <div style="padding: 20px; background-color: #F2F2F2;">
            <div class="layui-row layui-col-space15">
                <#--left-->
                <div class="layui-col-md9">
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-header">今日特拍</div>
                                <div class="layui-card-body">
                                    <#list data.auction as item>
                                        <a href="${request.contextPath}/home/goodsDetail?id=${item.id}">
                                            <div class="goods">
                                                <div style="flex: 3;margin: 0 auto;"><img src="${item.pictrue}"
                                                                                          alt="" width="auto"
                                                                                          height="220px"></div>
                                                <div style="flex: 2">
                                                    <p>${item.productName}</p>
                                                    <p>送拍机构 多家商家联合选送</p>
                                                    <p><b id="time${item.id}">距离结束还有:</br></b></p>
                                                </div>
                                                <div style="flex: 1">
                                                    <button class="layui-btn">${item.counts}次</br>出价</button>
                                                </div>
                                            </div>
                                        </a>
                                    </#list>
                                    <#--<div class="goods">-->
                                    <#--<div style="flex: 3"><img src="${request.contextPath}/images/product/2.jpg"-->
                                    <#--alt=""></div>-->
                                    <#--<div style="flex: 2">-->
                                    <#--<p>智瑞老酒优惠</p>-->
                                    <#--<p>送拍机构 智瑞商贸有限公司</p>-->
                                    <#--<p><b>距离结束还有:</br>00 时 21 分 35 秒</b></p>-->
                                    <#--</div>-->
                                    <#--<div style="flex: 1">-->
                                    <#--<button class="layui-btn">201次</br>出价</button>-->
                                    <#--</div>-->
                                    <#--</div>-->
                                    <#--<div class="goods">-->
                                    <#--<div style="flex: 3"><img src="${request.contextPath}/images/product/3.jpg"-->
                                    <#--alt=""></div>-->
                                    <#--<div style="flex: 2">-->
                                    <#--<p>翡翠1元起拍，无保留价</p>-->
                                    <#--<p>送拍机构 多家商家联合选送</p>-->
                                    <#--<p><b>距离结束还有:</br>00 时 21 分 35 秒</b></p>-->
                                    <#--</div>-->
                                    <#--<div style="flex: 1">-->
                                    <#--<button class="layui-btn">201次</br>出价</button>-->
                                    <#--</div>-->
                                    <#--</div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <#--right-->
                <div class="layui-col-md3">
                    <div class="layui-row">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-header">公告</div>
                                <div class="layui-card-body">
                                    <marquee>
                                        <div>
                                            拍卖平台一直要求和鼓励商家合规合理经营，通过优质拍品、专业运营、积极服务等取得好的效果，但部分拍卖商家的不合理行为，不仅影响了消费者权益，也影响拍卖品牌形象及消费者对平台的信任。因此平台将对商家严重影响买家体验的行为从重处理，除按《随缘拍卖平台管理规范》执行外，结合具体案例，由相关部门评估确定是否清退商家，若评估确认清退商家，则执行清退。
                                        </div>
                                    </marquee>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    ;!function () {
        var carousel = layui.carousel;
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
        });
        <#list data.auction as item>
        $(function () {
            countDown${item.id}(${(item.stopTime?long)?replace(",","")});
        });

        //带天数的倒计时
        function countDown${item.id}(times) {
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
                $('#time${item.id}').html("距结束还有:</br> " + day + "天：" + hour + "小时：" + minute + "分钟：" + second + "秒")
                times--;
            }, 1000);
            if (times <= 0) {
                clearInterval(timer);
            }
        };
        </#list>
    }();
</script>
</body>
</html>