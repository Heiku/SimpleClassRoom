<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>教保工作量统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="${request.contextPath}/plugin/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${request.contextPath}/plugin/layui/layui.js"></script>
    <script type="text/javascript" src="${request.contextPath}/plugin/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="layui-tab layui-tab-brief">

<#--<div class="layui-tab-content">-->
<#--<div class="layui-input-inline">-->
<#--<div class="layui-form">-->
<#--<select name="businessId"  lay-filter="businessId" id="businessId">-->
<#--<option value="">筛选商家</option>-->
<#--</select>-->
<#--</div>-->
<#--</div>-->
<#--</div>-->

    <div class="layui-card">
        <div class="layui-card-body" id="main" style="width:600px;height:400px; margin: 0 auto">
        </div>
    </div>
    <div class="layui-card">
        <div class="layui-card-body" id="teacher" style="width:600px;height:400px; margin: 0 auto">
        </div>
    </div>
</div>
<script type="text/javascript" src="${request.contextPath}/plugin/echart/echart.min.js"></script>
<script>
    layui.use('', function () {
        var $ = layui.$;

        var mian = document.getElementById('main');
        var teacher = document.getElementById('teacher');

        $.ajax({
            type: 'get',
            url: contextPath + '/api/chart/admin',
            dataType: "json",
            success: function (res) {
                console.log(res.data);
                var datas = res.data;
                pie(datas, '教保工作量统计',mian)
            }
        })

        $.ajax({
            type: 'get',
            url: contextPath + '/api/chart/teacher',
            dataType: "json",
            success: function (res) {
                console.log(res.data);
                var datas = res.data;
                pie(datas, '教师工作量统计',teacher)
            }
        })
        // 渲染列表
        var pie = function(datas ,text, id) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(id);

            // 指定图表的配置项和数据
            // 指定图表的配置项和数据
            var option = {
                title: {
                    x: 'center',
                    text: text
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c}"
                },
                xAxis: {
                    data: datas.xobj.xlist
                },
                yAxis: {},
                series: [{
                    name: '工作量',
                    type: 'bar',
                    itemStyle: {
                        normal: {
                            color: function (params) {
                                // build a color map as your need.
                                var colorList = [
                                    '#2ec7c9','#b6a2de','#5ab1ef','#ffb980'
                                ];
                                return colorList[params.dataIndex]
                            },
                            label: {
                                show: true,
                                position: 'top',
                                formatter: '{b}\n{c}'
                            }
                        }
                    },
                    data: datas.yobj.ylist
                }]
            };


            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }


    });

</script>
</body>
</html>
