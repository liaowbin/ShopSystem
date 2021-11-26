<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>乐淘 - 后台管理</title>
    <%@ include file="common/resource.jsp" %>
</head>
<body>
    
    <%@ include file="common/aside.jsp"%>
    <!-- 主体 -->
    <div class="main">
        <div class="container-fluid">
            
            <%@ include file="common/header.jsp"%>
            
            <!-- 个人资料 -->
            <div class="body dashboard">
                <div class="row survey">
                    <div class="col-xs-3">
                        <div class="cell user">
                            <i class="fa fa-user"></i>
                            <span>用户数量</span>
                            <h5>236</h5>
                        </div>
                    </div>
                    <div class="col-xs-3">
                        <div class="cell th">
                            <i class="fa fa-th"></i>
                            <span>分类数量</span>
                            <h5>12</h5>
                        </div>
                    </div>
                    <div class="col-xs-3">
                        <div class="cell money">
                            <i class="fa fa-money"></i>
                            <span>商品数量</span>
                            <h5>11.11</h5>
                        </div>
                    </div>
                </div>
                <div class="chart">
                    <div id="main" style="width: 600px;height:400px;"></div>
                </div>
            </div>
        </div>
    </div>
    <script src="admin/assets/echarts/echarts.min.js"></script>
    <script>

        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: 'ECharts 入门示例'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);

    </script>
</body>
</html>