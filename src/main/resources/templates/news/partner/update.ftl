<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all"/>
    <link rel="stylesheet" href="/static/css/user.css" media="all"/>
</head>
<body class="childrenBody">

<form class="layui-form" action="" lay-filter="example">

    <input name="id" value="${partner.id}"  class="layui-input" type="text" placeholder="这是id" autocomplete="off"
           lay-verify="title" style="display: none">


    <div class="layui-form-item">
        <div class="layui-input-block">
           <img id="image" width="400px" height="400px" src="${partner.imageUrl}" fileStorageName="${partner.fileStorageName}" fileStorageId="${partner.fileStorageId}" >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">图片上传</label>
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="test1">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red">* </a>媒体名称</label>
        <div class="layui-input-block">
            <input name="name" class="layui-input" type="text" required  lay-verify="required" placeholder="媒体名称" autocomplete="off" value="${partner.name}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red">* </a>链接地址</label>
        <div class="layui-input-block">
            <input name="website" class="layui-input" type="text" required  lay-verify="required" placeholder="链接地址" autocomplete="off" value="${partner.website}"
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


        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: "${uploadUrl}" //上传接口
            , multiple: true
            , field: 'files'
            ,done: function(res){
                $("#image").attr('src', res.data[0].url);
                $("#image").attr('url', res.data[0].url);
                $("#image").attr('fileStorageName', res.data[0].originName);
                $("#image").attr("fileStorageId", res.data[0].id);
                $("#link").attr("value",res.data[0].url);
                //上传完毕回调
            }
            ,error: function(){
                layer.msg("上传失败");
                layer.msg(uploadUrl);

                //请求异常回调
            }
        });

        //监听提交
        form.on('submit(tijiao)', function (data) {
            var url=$("#image").attr('src');
            data.field.imageUrl= $("#image").attr('src');
            data.field.fileStorageId= $("#image").attr('fileStorageId');
            data.field.fileStorageName= $("#image").attr('fileStorageName');
            console.log(data.field)

            if(url==null||url==''){
                alert('请选择图片');
                return false;
            }
            $.ajax({
                type: "POST",
                url: "${base}/partner/save",
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