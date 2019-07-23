<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>图库列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all"/>
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all"/>

    <style>

        .content {
            display: flex;
            display: -webkit-flex;
            flex-wrap: wrap;
        }

        .item {
            width: 200px;
            height: 300px;
            margin: 5px;
            border: 1px solid #B9BFC4;
            border-radius: 5px;
            align-content: center;
            text-align: center;
        }

    </style>

</head>
<body class="childrenBody">
<input id="groupId" name="groupId" hidden value="${groupId}"/>


<fieldset class="layui-elem-field">
    <legend>图片</legend>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="addGroup" class="layui-btn" lay-filter="tijiao" lay-submit="">添加图片</button>
        </div>
    </div>
</fieldset>

<div class="content">

    <#list images as item>
        <div class="item">
            <input id="id" name="id" hidden value="${item.id}"/>

            <img style="width: 98%;height: 85%;margin-top: 2px" src="${item.url}">


            <p>${item.name}</p>
            <p class="layui-btn layui-btn-xs edit" style="font-size: 12px;color: white" >编辑</p>

            <p  id="del" class="layui-btn layui-btn-primary layui-btn-xs del">
                <i style="align-self: center" class="layui-icon"></i>
            </p>
        </div>
    </#list>
</div>


<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/tools.js"></script>


<script>
    layui.use(['layer', 'laytpl', 'jquery', 'form', 'table', 'laydate', 'element'], function () {

        var layer = layui.layer,
            $ = layui.jquery,
            form = layui.form,
            table = layui.table;


        $(".del").click(function () {
            var parent = $(this).parent();


            var id = $(this).parent().children("#id").val();
            console.log(id);

            layer.confirm("你确定要删除吗？", {btn: ['是的,我确定', '我再想想']},
                function () {
                    $.post("${base}/image/del/" + id, function (res) {
                        if (res.success) {

                            layer.close();

                            layer.msg("删除成功", {time: 1000}, function () {
                                $(parent).remove();
                            });
                        } else {
                            layer.msg(res.message);
                        }
                    });
                }
            )

        });
        $(".edit").click(function () {
            var id = $(this).parent().children("#id").val();
            console.log(id);

            var addeditIndex = layer.open({
                title: "修改图片",
                type: 2,
                area: ['720px', '720px'],
                content: "${base}/image/" + id,
                success: function () {

                }
            });
            layer.full(addeditIndex);
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function () {

            });

        });


        $("#addGroup").on("click", function () {
            var groupId = $("#groupId").val();
            var addeditIndex = layer.open({
                title: "添加信息",
                type: 2,
                area: ['1920px', '1080px'],
                content: "${base}/image/insert/" + groupId,
                success: function () {

                }
            });
            layer.full(addeditIndex);
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function () {

            });
        });


    });
</script>


</body>
</html>