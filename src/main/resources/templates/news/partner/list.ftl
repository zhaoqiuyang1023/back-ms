<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>合作方列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../../static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all"/>
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all"/>
</head>
<body class="childrenBody">
<div class="layui-col-sm1">
    <div class="layui-inline">
        <a class="layui-btn layui-btn-normal" id="addNews"><i class="layui-icon">&#xe654;</i>添加</a>
    </div>
</div>
<div class="layui-form users_list">
    <table class="layui-table" id="newsTable" lay-filter="newsTable"></table>

    <script type="text/html" id="barOpt">

        <a class="layui-btn layui-btn-xs layui-anim layui-anim-scaleSpring" lay-event="edit" title="编辑">编辑</a>
        <a class="layui-btn layui-btn-xs layui-anim layui-anim-scaleSpring" lay-event="down" style="background-color: red" title="下架">删除</a>

    </script>
</div>
<#--<div id="page"></div>-->
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/tools.js"></script>
<script>
    layui.use(['layer', 'laytpl', 'form', 'jquery', 'table', 'laydate', 'element'], function () {
        var announce = null;
        var shelve = null;

        var layer = layui.layer,
            $ = layui.jquery,
            form = layui.form,
            table = layui.table;


        $("#addNews").on("click", function () {
            var addeditIndex = layer.open({
                title: "添加信息",
                type: 2,
                area: ['1920px', '1080px'],
                content: "${base}/partner/add",
                success: function () {

                }
            });
            layer.full(addeditIndex);
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function () {

            });
        });
        //监听工具条
        table.on('tool(newsTable)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                var editIndex = layer.open({
                    title: "编辑信息",
                    type: 2,
                    area: ['1920px', '1080px'],
                    content: "${base}/partner/edit/" + data.id,
                    success: function (layero, index) {
                        setTimeout(function () {
                            layer.tips('点击此处', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        }, 500);
                    }
                });
                layer.full(editIndex);
                //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
                $(window).resize(function () {
                    layer.full(editIndex);
                });
            }

            if (obj.event === 'down') {

                layer.confirm("你确定要删除吗？", {btn: ['是的,我确定', '我再想想']},
                    function () {
                        $.post("${base}/partner/down/" + data.id, function (res) {
                            if (res.success) {
                                table.reload('newsTable', {
                                    where: {

                                    }
                                    , page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                                layer.close();
                                layer.msg("删除成功，请重新刷新", {time: 1000}, function () {

                                });
                            } else {
                                layer.msg(res.message);
                            }
                        });
                    }
                )
            }


        });

        var t = {
            elem: '#newsTable',
            url: '/partner/list',
            method: 'post',
            where: {
                announce: announce
            },
            page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                groups: 7, //只显示 1 个连续页码
                first: "首页", //显示首页
                last: "尾页", //显示尾页
                limits: [3, 10, 20, 30]
            },
            cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            cols: [[
                {field: 'name', title: '媒体名称', align: 'left', width: '30%'},
                {field: 'website', title: '链接', width: '30%'},
                {field: 'dateCreate', title: '创建时间', width: '15%'},
                {field: 'dateUpdate', title: '最后编辑时间', width: '15%'},
                {fixed: 'right', title: '操作', width: '10%', align: 'center', toolbar: '#barOpt'}
            ]]
        };
        table.render(t);
    })
    ;
</script>


</body>
</html>