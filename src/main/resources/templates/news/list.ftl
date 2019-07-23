<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>新闻信息列表</title>
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
<fieldset class="layui-elem-field">
    <legend>新闻信息检索</legend>
    <div class="layui-field-box">


        <form class="layui-form" id="searchForm">
            <div class="layui-fluid">
                <div class="layui-row">

                    <div class="layui-col-sm1">
                        <div class="layui-inline">
                            <a class="layui-btn layui-btn-normal" id="addNews"><i class="layui-icon">&#xe654;</i>添加</a>
                        </div>
                    </div>

                    <div class="layui-col-sm3">
                        <div class="layui-form-item">
                            <label class="layui-form-label">分类</label>
                            <div class="layui-input-block">
                                <select id="typeId" name="typeId" lay-filter="aihao">
                                    <option value="">分类</option>
                                    <#list newsTypes as item>
                                        <option value="${item.id}">${item.value}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-sm3">
                        <div class="layui-form-item">
                            <label class="layui-form-label">文章状态</label>
                            <div class="layui-input-block">
                                <select id="announce" name="announce" lay-filter="announce">
                                    <option >请选择文章状态</option>
                                    <option value="0">草稿</option>
                                    <option value="1">已发布</option>
                                    <option value="2">已下架</option>
                                    <option value="3">推荐</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-sm3">
                        <div class="layui-form-item">
                            <label class="layui-form-label">文章标题</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" id="title"
                                       placeholder="请输入标题"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-sm1">
                        <div class="layui-form-item">
                            <div class="layui-input-inline">
                                <button class="layui-btn" lay-submit lay-filter="searchForm">查询</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>

</fieldset>
<div class="layui-form users_list">
    <table class="layui-table" id="newsTable" lay-filter="newsTable"></table>

    <script type="text/html" id="barOpt">

        <a class="layui-btn layui-btn-xs layui-anim layui-anim-scaleSpring" lay-event="edit" title="编辑">编辑</a>
        <a class="layui-btn layui-btn-xs layui-anim layui-anim-scaleSpring" style="background-color: red" lay-event="down" title="删除">删除</a>

    </script>
</div>
<#--<div id="page"></div>-->
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/tools.js"></script>
<script>
    layui.use(['layer', 'laytpl', 'form', 'jquery', 'table', 'laydate', 'element'], function () {
        var announce = null;
        var shelve = null;

        var recommendable = null;

        var layer = layui.layer,
            $ = layui.jquery,
            form = layui.form,
            table = layui.table;


        $("#addNews").on("click", function () {
            var addeditIndex = layer.open({
                title: "添加信息",
                type: 2,
                area: ['1920px', '1080px'],
                content: "${base}/news/add",
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
                    content: "${base}/news/edit/" + data.id,
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

                layer.confirm("你确定吗？", {btn: ['是的,我确定', '我再想想']},
                    function () {
                        $.post("${base}/news/del/" + data.id, function (res) {
                            if (res.success) {
                                table.reload('newsTable', {
                                    where: {
                                        "typeId": $("#typeId").val(),
                                        "announce": announce,
                                        "shelve": shelve,
                                        "title": $("#title").val()
                                    }
                                    , page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                                layer.close();
                                layer.msg("下架成功，请重新刷新", {time: 1000}, function () {

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
            url: '/news/list',
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
                {field: 'title', title: '标题', align: 'left', width: '20%'},
                {field: 'typeName', title: '类别名称', width: '12%'},
                {field: 'dateCreate', title: '创建时间', width: '18%'},
                {field: 'dateUpdate', title: '最后修改时间', width: '18%'},
                {field: 'recommendable', title: '推荐', width: '10%', templet: '#titleTp2'},
                {field: 'published', title: '状态', width: '10%', templet: '#titleTpl'},
                {fixed: 'right', title: '操作', width: '10%', align: 'center', toolbar: '#barOpt'}
            ]]
        };
        table.render(t);


        var active = {
            addNews: function () {
                var addIndex = layer.open({
                    title: "添加信息",
                    type: 2,
                    content: "/news/add",
                    success: function (layero, addIndex) {
                        setTimeout(function () {
                            layer.tips('点击此处返回港口信息列表', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        }, 500);
                    }
                });
                //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
                $(window).resize(function () {
                    layer.full(addIndex);
                });
                layer.full(addIndex);
            }
        };

        $('.layui-inline .layui-btn-normal').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        form.on('select(announce)', function (data) {
            console.log(data.elem); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            console.log(data.othis); //得到美化后的DOM对象
            announce = null;
            shelve = null;
            if (data.value == 0) {//草稿
                announce = false;
                shelve = true;
            } else if (data.value == 1) {//已发布
                announce = true;
                shelve = true;
                recommendable = false;
            } else if (data.value == 2) {//已下架
                shelve = false;
                announce = false;
            } else if (data.value == 3) {//推荐
                shelve = true;
                announce = true;
                recommendable = true;
            }
            else {
                 announce = null;
                 shelve = null;
                 recommendable = null;
            }
            console.log("qqq" + announce);
            console.log("qqqqq" + shelve);
        });

        form.on("submit(searchForm)", function (data) {
            table.reload('newsTable', {
                where: {
                    "typeId": $("#typeId").val(),
                    "announce": announce,
                    "shelve": shelve,
                    "recommendable": recommendable,
                    "title": $("#title").val()
                }
                , page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });

    })
    ;
</script>

<script type="text/html" id="titleTp2">
    {{#  if(d.published==true&&d.shelve ==true&&d.recommendable==true){ }}
    推荐
    {{#  } else if(true){ }}
    未推荐
    {{#  }}}
</script>
<script type="text/html" id="titleTpl">
    {{#  if(d.shelve ==false){ }}
    <a style="color: red">已下架</a>
    {{#  } else if(d.published==true&&d.shelve ==true) { }}
    已发布
    {{#  } else if(d.published==false&&d.shelve ==true){ }}
    草稿
    {{#  }}}
</script>
</body>
</html>