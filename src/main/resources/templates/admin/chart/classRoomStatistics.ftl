<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>订单统计</title>
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
</div>
<script type="text/javascript" src="${request.contextPath}/plugin/echart/echart.min.js"></script>
<script>
    layui.use('', function () {
        var $ = layui.$;



        $.ajax({
            type: 'get',
            url: contextPath + '/api/chart/',
            dataType: "json",
            success: function (res) {
                console.log(res.data);
                var datas = res.data;
                pie(datas, '教室利用率统计')
            }
        })
        // 渲染列表
        var pie = function(datas ,text) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));

            // 指定图表的配置项和数据
            var option = {
                title : {
                    text: text,
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    type: 'scroll',
                    orient: 'vertical',
                    right: 10,
                    top: 20,
                    bottom: 20,
                    data:   datas.x,
                    selected: data.selected
                },
                series : [
                    {
                        name: '利用率',
                        type: 'pie',
                        radius : '55%',
                        center: ['40%', '50%'],
                        data:   datas.y,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };


            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }


    });

</script>
</body>
</html>
