<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${base}/static/kindeditor/themes/default/default.css"/>
    <script charset="utf-8" src="${base}/static/kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="${base}/static/kindeditor/lang/zh-CN.js"></script>
    <link rel="stylesheet" href="${base}/static/jqueryui/select2.min.css"/>
    <style type="text/css">
        .layui-form-item .layui-inline {
            width: 33.333%;
            float: left;
            margin-right: 0;
        }

        @media (max-width: 1240px) {
            .layui-form-item .layui-inline {
                width: 100%;
                float: none;
            }
        }

        .layui-form-item .role-box {
            position: relative;
        }

        .layui-form-item .role-box .jq-role-inline {
            height: 100%;
            overflow: auto;
        }

        .layui-form-label {
            float: left;
            display: block;
            padding: 9px 0px;
            width: 90px;
            font-weight: 400;
            text-align: right
        }
        .myselect2{
            border: 1px solid red;
            border-radius: 2px;
        }

    </style>
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">


    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red;text-align: center">* </a>标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" autocomplete="off" placeholder="请输入标题" required lay-verify="required"

                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red;text-align: center">* </a>摘要</label>
        <div class="layui-input-block">
            <input type="text" name="summary" autocomplete="off" placeholder="摘要" required lay-verify="required"
                   class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red;text-align: center">* </a>关键词</label>

        <div class="layui-input-block">
            <select lay-ignore style="width: 100%;border-color: #1AA094;margin-left: 20px" class="news-multiple myselect2"
                    name="keyWords" required lay-verify="required"
                    multiple="multiple">

                <#list news as item>
                    <option value="${item.id}">
                        ${item.title}
                    </option>
                </#list>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red;text-align: center">* </a>分类</label>
        <div class="layui-input-block">
            <select id="type" name="type" required lay-verify="required" lay-filter="aihao">
                <option value="">新闻类型</option>
                <#list newsTypes as item>
                    <option value="${item.id}">${item.value}</option>
                </#list>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red;text-align: center">* </a>新闻出处</label>
        <div class="layui-input-block">
            <input type="text" name="from" lay-verify="title" autocomplete="off" placeholder="新闻出处" required
                   lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-tab-item layui-show">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label"><label style="color: red;width: 100px;"></label>内容</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" name="content" id="content"
                              class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-col-space15" pane>
        <div class="layui-input-block">

            <input type="radio" name="verifyStatus" value="1" checked title="发布并推荐"/>
            <input type="radio" name="verifyStatus" value="2" title="发布">
            <input type="radio" name="verifyStatus" value="0" title="保存草稿"/>
            <input type="radio" name="verifyStatus" value="3" title="已下架"/>
        </div>
    </div>
    <div class="layui-tab-item layui-show">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="savenews">提交</button>

            </div>
        </div>
    </div>

</form>
<script src="${base}/static/jqueryui/jquery.js"></script>
<script src="${base}/static/jqueryui/select2.min.js"></script>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    var editor1;
    KindEditor.ready(function (K) {
        editor1 = K.create('textarea[name="content"]', {
            width: '1200px',
            height: '600px',
            autoHeightMode: true,
            //这里是指定的文件上传input的的属性名
            filePostName: "uploadFile",
            //这里就是指定文件上传的请求地址，上面也已经说了，upload_json.jsp就相当于一个servlet去进行保存文件，这个地方很重要，我改写成后台调文件服务的方式
            // uploadJson: 'upload_json.jsp',
            uploadJson: '${base}/kindeditor/upload_json',
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: true,
            items: [
                'source', '|', 'preview', 'undo', 'redo', '|', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright',
                //'insertorderedlist', 'insertunorderedlist',
                '|', 'emoticons', 'image', 'link']
        });
    });


</script>

<script>
    layui.use(['form', 'jquery', 'layer'], function () {
        var form = layui.form,
            $ = layui.jquery,
            layer = layui.layer;


        $(function () {
            $(".news-multiple").select2({
                placeholder: "请选择关键字", //placeholder
                tags: true,
                tokenSeparators: ['/',',',';'," "]
            });
        });


        form.on('submit(savenews)', function (data) {
            var verify = $('input:radio:checked').val();

            console.log(verify)
            if (verify == 0) {  /*保存草稿*/
                data.field.published = false,
                    data.field.shelve = true
            } else if (verify == 1) {  /*发布并推荐*/
                data.field.published = true,
                    data.field.shelve = true,
                    data.field.recommendable = true
            } else if (verify == 2) { /*发布*/
                data.field.published = true,
                    data.field.shelve = true,
                    data.field.recommendable = false
            } else if (verify == 3) { /*下架*/
                data.field.published = false,
                    data.field.shelve = false,
                    data.field.recommendable = false
            }
            data.field.content = editor1.html();

            data.field.keyWords=$('.news-multiple').val();
            console.log(JSON.stringify(data.field));
            $.ajax({
                type: "POST",
                url: "${base}/news/save",
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
                    layer.close(loading);
                    alert("发生错误：" + jqXHR.status);
                }
            });
            return false;
        });

    });
</script>
</body>
</html>