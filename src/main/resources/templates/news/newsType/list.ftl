<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>文章信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all"/>
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all"/>
</head>
<body class="childrenBody">
<fieldset class="layui-elem-field">
    <legend>文章分类检索</legend>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="addNews" class="layui-btn" lay-filter="tijiao" lay-submit="">添加分类</button>
        </div>
    </div>
</fieldset>
<div class="layui-form users_list">
    <table class="layui-table" id="newsTable" lay-filter="newsTable"></table>

    <script type="text/html" id="barOpt">

        <a class="layui-btn layui-btn-xs layui-anim layui-anim-scaleSpring" lay-event="edit" title="编辑">编辑</a>

        <a class="layui-btn layui-btn-danger layui-btn-xs layui-anim layui-anim-scaleSpring"
           style="background-color: red" title="删除" lay-event="del">删除</a>

    </script>
</div>
<#--<div id="page"></div>-->
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/tools.js"></script>
<script>
    layui.use(['layer', 'laytpl', 'jquery', 'form', 'table', 'laydate', 'element'], function () {

        var layer = layui.layer,
            $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        $("#addNews").on("click", function () {
            var addeditIndex = layer.open({
                title: "添加信息",
                type: 2,
                area: ['1080px', '720px'],
                content: "${base}/newsSet/insert",
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
                    area: ['1080px', '720px'],
                    content: "${base}/newsSet/edit/" + data.id,
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

            if (obj.event === "del") {

                $.post("${base}/newsSet/delete/" + data.id, function (res) {
                    if (res.success) {
                        $(obj).remove();
                        obj.del(); //删除对应行（tr）的DOM结构
                        layer.close();
                        layer.msg("删除成功", {time: 1000}, function () {

                        });
                    } else {
                        layer.msg(res.message);
                    }
                });


            }
        });

        var t = {
            elem: '#newsTable',
            url: '/newsSet/list',
            method: 'post',
            where: {
                status: status
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
                {field: 'value', title: '类别名称', align: 'left', width: '45%'},
                {field: 'newsNumber', title: '文章数量', width: '10%'},
                {field: 'dateCreate', title: '创建时间', width: '15%'},
                {field: 'dateUpdate', title: '最后修改时间', width: '15%'},
                {fixed: 'right', title: '操作', width: '15%', align: 'center', toolbar: '#barOpt'}
            ]]
        };
        table.render(t);


        $('.layui-inline .layui-btn-normal').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        form.on('select(status)', function (data) {
            console.log(data.elem); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            console.log(data.othis); //得到美化后的DOM对象
            status = data.value;
        });


    })
    ;
</script>

</body>
</html>