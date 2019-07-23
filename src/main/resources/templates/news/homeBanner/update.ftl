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
    <link rel="stylesheet" href="../../static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all"/>
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all"/>
</head>
<body class="childrenBody">


<form class="layui-form" action="" lay-filter="example">

    <input name="id" value="${homeBanner.id}" class="layui-input" type="text" placeholder="请输入标题" autocomplete="off"
           lay-verify="title" style="display: none">




    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red;align-self: center">* </a>图片标题</label>
        <div class="layui-input-block">
            <input name="title" class="layui-input" type="text" placeholder="图片标题" autocomplete="off"
                   value="${homeBanner.title}" required  lay-verify="required"
            >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red;align-self: center">* </a>英文大图</label>
        <div class="layui-input-inline">
            <input name="enLargerImg"  disabled class="layui-input param" type="text" placeholder="图片名称" autocomplete="off"
                   value="${homeBanner.enLargerImg}"  required  lay-verify="required"
            >
        </div>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn" id="enLargerImg">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red;align-self: center">* </a>英文小图</label>
        <div class="layui-input-inline">
            <input name="enSmallImg"  disabled class="layui-input param" type="text" placeholder="图片名称" autocomplete="off"
                   value="${homeBanner.enSmallImg}"  required  lay-verify="required"
            >
        </div>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn" id="enSmallImg">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red;align-self: center">* </a>中文大图</label>
        <div class="layui-input-inline">
            <input name="cnLargerImg" disabled  class="layui-input param" type="text" placeholder="图片名称" autocomplete="off"
                   value="${homeBanner.cnLargerImg}"  required  lay-verify="required"
            >
        </div>

        <div class="layui-input-inline">
            <button type="button" class="layui-btn" id="cnLargerImg">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red;align-self: center">* </a>中文小图</label>
        <div class="layui-input-inline">
            <input name="cnSmallImg"  disabled class="layui-input param" type="text" placeholder="图片名称" autocomplete="off"
                   value="${homeBanner.cnSmallImg}"  required  lay-verify="required"
            >
        </div>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn" id="cnSmallImg">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">地址链接</label>
        <div class="layui-input-inline">
            <input name="link" class="layui-input" type="text" placeholder="地址链接" autocomplete="off"
                   value="${homeBanner.link}"
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

        $(function () {
            initimgupload($("#enLargerImg"));
            initimgupload($("#enSmallImg"));
            initimgupload($("#cnLargerImg"));
            initimgupload($("#cnSmallImg"));
        });

        function initimgupload(dom) {

            upload.render({
                elem: dom //绑定元素
                , url: "${uploadUrl}" //上传接口
                , multiple: true
                , field: 'files'
                , done: function (res) {

                    var params=  $(dom).parent().parent().find('.param');
                    for (var param of params) {
                        $(param).val(res.data[0].url);
                        //  $(params).attr("value",res.data[0].name);//填充内容
                    }
                    console.log(params);
                    console.log(res.data[0].originName)

                    layer.msg("上传成功");


                    //上传完毕回调
                }
                , error: function () {
                    layer.msg("上传失败");
                    layer.msg(uploadUrl);

                    //请求异常回调
                }
            });
        }


        //监听提交
        form.on('submit(tijiao)', function (data) {

            console.log(data.field);
            $.ajax({
                type: "POST",
                url: "${base}/homeBanner/save",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data.field),
                dataType: "json",
                success: function (res) {
                    if (res.success) {
                        parent.layer.msg("修改成功！", {time: 1000}, function () {
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