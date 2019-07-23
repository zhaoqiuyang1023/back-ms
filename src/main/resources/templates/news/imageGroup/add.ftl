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
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all"/>
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all"/>
</head>
<body class="childrenBody">

<form class="layui-form" action="" lay-filter="example">


    <div class="layui-form-item">
        <label class="layui-form-label">图库名称</label>
        <div class="layui-input-block">
            <input name="name" class="layui-input" type="text" placeholder="图库名称" autocomplete="off"
            value=""
            >
        </div>
    </div>



    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-filter="tijiao" lay-submit="">立即提交</button>
        </div>
    </div>

</form>

<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/tools.js"></script>
<script>

    layui.use(['upload', 'jquery', 'form', 'layer'], function () {

        var $ = layui.jquery,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;

        //监听提交
        form.on('submit(tijiao)', function (data) {

            console.log(data.field);
            $.ajax({
                type: "POST",
                url: "${base}/imageGroup/save",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data.field),
                dataType: "json",
                success: function (res) {
                    if (res.success) {
                        parent.layer.msg("添加成功！", {time: 1000}, function () {
                            parent.layer.closeAll();
                            parent.location.reload();
                        });
                    } else {
                        layer.msg(res.message);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            });
            return false;
        });
    });

</script>


</body>
</html>