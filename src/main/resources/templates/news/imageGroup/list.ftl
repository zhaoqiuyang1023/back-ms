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
            width: 100%;
        }

        .item {

            width: 30%;
            min-width: 150px;
            height: 60px;
            margin: 10px;
            float: left;
            padding-top: 10px;
            padding-bottom: 10px;
            border: 1px solid #B9BFC4;
            border-radius: 5px;
            align-content: center;
            margin-left: 10px;
            width: 200px;
            text-align: center;
            height: 200px;
        }


    </style>

</head>
<body class="childrenBody">
<fieldset class="layui-elem-field">
    <legend>图库</legend>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="addGroup" class="layui-btn" lay-filter="tijiao" lay-submit="">添加图库</button>
        </div>
    </div>
</fieldset>

<div class="content">

    <#list groups as item>
        <div class="item">


            <input id="id" name="id" hidden style="font-size: 18px;width: 100%;background-color: #FFFFFF"
                   value="${item.id}"/>
            <input id="inputold" class="layui-input" disabled style="font-size: 18px;width: 100%" value="${item.name}"/>
            <input id="input" class="layui-input"  style="font-size: 18px;width: 100%;display: none" value="${item.name}"/>
            <div id="redact">

                <p class="layui-btn layui-btn-sm update" style="font-size: 12px;color: white">编辑名称</p>

                <p id="del" class="layui-btn layui-btn-primary layui-btn-sm del">
                    <i style="align-self: center" class="layui-icon"></i>
                </p>

            </div>

            <div id="ok" style="display: none">

                <p class="layui-btn layui-btn-sm upload" style="font-size: 12px;color: white">确定</p>

            </div>

            <div class="detail">
                <p class="layui-btn layui-btn-normal layui-btn-sm" style="font-size: 12px;color: white;margin-top: 10px">查看图片</p>

            </div>

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

        $(".update").click(function () {

            var dom = $(this).parent();


            let b = dom.parent().children("#ok");
            $(b).show();

            let newinput = dom.parent().children("#input");
            $(newinput).show();


            $(newinput).val("")//使input的值为空

            $(newinput).focus();

            let oldinput = dom.parent().children("#inputold");

            $(newinput).val($(oldinput).val());//重新负值
            $(newinput)[0].scrollLeft=700;//这里我对文本框的属性做了一个猜想，应该是有混动条的属性的，所以进行一个偏移
            $(oldinput).hide();
        });

        $(".detail").click(function () {

            var id = $(this).parent().children("#id").val();
            var addeditIndex = layer.open({
                title: "添加信息",
                type: 2,
                area: ['1920px', '1080px'],
                content: "${base}/image/group/" + id,
                success: function () {

                }
            });
            layer.full(addeditIndex);
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function () {

            });

        });

        $(".upload").click(function () {

            var dom = $(this).parent();


            let newinput = $(dom).parent().children("#input");



            if($(newinput).val()==''){
                layer.msg("请输入内容", {time: 1000}, function () {
                    $(newinput).focus();
                });

                return;
            }

            let oldinput = $(dom).parent().children("#inputold");
            $(oldinput).val($(newinput).val());


            var id = $(this).parent().parent().children("#id").val();
            var name = $(this).parent().parent().children("#input").val();
            var obj = {"id": id, "name": name};
            console.log(obj)
            $.ajax({
                type: "POST",
                url: "${base}/imageGroup/save",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(obj),
                dataType: "json",
                success: function (res) {
                    if (res.success) {
                        layer.msg("修改成功！", {time: 1000}, function () {
                            layer.closeAll();
                            let b = $(dom).parent().children("#redact");
                            $(b).show();
                            $(newinput).hide();
                            $(oldinput).show();
                            $(dom).hide();
                            location.reload();
                        });
                    } else {
                        layer.msg(""+res.message, {time: 1000}, function () {
                            $(newinput).focus();
                        });
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }

            });
        });


        $(".del").click(function () {
            var id = $(this).parent().parent().children("#id").val();
            console.log(id);

            layer.confirm("你确定要删除吗？", {btn: ['是的,我确定', '我再想想']},
                function () {
                    $.post("${base}/imageGroup/del/" + id, function (res) {
                        if (res.success) {

                            layer.close();
                            layer.msg("删除成功", {time: 1000}, function () {
                                location.reload();
                            });
                        } else {
                            layer.msg(res.message);
                        }
                    });
                }
            )

        });


        $("#addGroup").on("click", function () {
            var addeditIndex = layer.open({
                title: "添加信息",
                type: 2,
                area: ['1920px', '1080px'],
                content: "${base}/imageGroup/insert",
                success: function () {

                }
            });
            layer.full(addeditIndex);
            //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
            $(window).resize(function () {

            });
        });


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