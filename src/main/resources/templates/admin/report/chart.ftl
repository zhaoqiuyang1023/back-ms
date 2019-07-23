<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>通用报表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all"/>
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all"/>
    <link rel="stylesheet" href="${base}/static/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>


<div class="layui-col-xs10">
    <fieldset class="layui-elem-field">
        <legend>报表</legend>
        <div class="layui-field-box">
            <form class="layui-form" id="chartForm">

                <div class="layui-inline" style="margin-left: 15px">
                    <label>报表:</label>
                    <div class="layui-input-inline">
                        <select name="reportName" id="reportName">
                            <option value="" selected="true">请选择报表</option>
                            <option value="dailyUserRegister">每日用户注册数</option>
                            <option value="dailyConsignerRegister">每日委托用户注册数</option>
                            <option value="dailyConsigneeRegister">每日代理用户注册数</option>
                            <option value="totalUserRegister">总用户注册数</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline" style="margin-left: 15px">
                    <label>时间段:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="s_beginDate" id="beginDate" lay-verify="date"
                               autocomplete="off" class="layui-input">
                    </div>
                    <span>-</span>
                    <div class="layui-input-inline">
                        <input type="text" name="s_endDate" id="endDate" lay-verify="date"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn" lay-submit="" lay-filter="chartForm">查询</a>
                </div>
            </form>
        </div>
    </fieldset>

    <div class="row">
        <div id="container" style="height: 500px"></div>
        <script type="text/javascript" src="${base}/static/js/jquery.min.js"></script>
        <script type="text/javascript" src="${base}/static/js/echarts.min.js"></script>
        <script type="text/javascript" src="${base}/static/layui/layui.js"></script>
        <script>
            layui.use(['layer', 'form', 'table', 'laydate'], function () {
                var layer = layui.layer,
                        $ = layui.jquery,
                        form = layui.form,
                        laydate = layui.laydate,
                        table = layui.table,
                        setting = {};

                var beginDate = laydate.render({//渲染开始时间选择
                    elem: '#beginDate', //通过id绑定html中插入的start
                    type: 'date',
                    max: "2099-12-31",//设置一个默认最大值
                    done: function (value, dates) {
                        endDate.config.min = {
                            year: dates.year,
                            month: dates.month - 1, //关键
                            date: dates.date,
                            hours: 0,
                            minutes: 0,
                            seconds: 0
                        };
                    }
                });

                var endDate = laydate.render({//渲染结束时间选择
                    elem: '#endDate',//通过id绑定html中插入的end
                    type: 'date',
                    min: "1970-1-1",//设置min默认最小值
                    done: function (value, dates) {
                        beginDate.config.max = {
                            year: dates.year,
                            month: dates.month - 1,//关键
                            date: dates.date,
                            hours: 0,
                            minutes: 0,
                            seconds: 0
                        }
                    }
                });


                form.on("submit(chartForm)", function (data) {
                    var reportName = $("#reportName").val();
                    var beginDate = $("#beginDate").val();
                    var endDate = $("#endDate").val();

                    if (!reportName) {
                        layer.msg("请选择报表");
                        return false;
                    }
                    if (!beginDate || !endDate) {
                        layer.msg("请选择起止时间");
                        return false;
                    }

                    var dom = document.getElementById("container");
                    var myChart = echarts.init(dom);
                    $.get('${base}/admin/report/list', {
                        reportName: reportName,
                        beginDate: beginDate,
                        endDate: endDate
                    }).done(function (res) {
                        myChart.setOption({
                            tooltip: {
                                show: true,
                                trigger: 'axis',
                                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            xAxis: {
                                type: 'category',
                                data: res.data.timeList
                            },
                            yAxis: {
                                type: 'value'
                            },
                            series: [{
                                data: res.data.countList,
                                type: 'bar',
                                name: '',
                                markPoint: {
                                    data: [
                                        {type: 'max', name: '最大值'},
                                        {type: 'min', name: '最小值'}
                                    ]
                                }
                            }]
                        });
                    });

                    return false;
                });

            });
        </script>
    </div>
</div>

</body>
</html>