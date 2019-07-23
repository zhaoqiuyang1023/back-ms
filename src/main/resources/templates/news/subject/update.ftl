<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all"/>
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

        .content {
            display: -webkit-flex;
            display: flex;
            flex-wrap: wrap;
        }

        .imageitem {
            widows: 150px;
            height: 150px;
        }

    </style>
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input name="id" value="${subject.id}" class="layui-input" type="text" placeholder="请输入标题" autocomplete="off"
           lay-verify="title" style="display: none">


    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red">* </a>专题名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" required lay-verify="required" autocomplete="off" placeholder="专题名称"
                   value="${subject.name}"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red">* </a>摘要</label>
        <div class="layui-input-block">
            <input type="text" name="summary" required lay-verify="required" autocomplete="off" placeholder="摘要"
                   value="${subject.summary}" class="layui-input">
        </div>
    </div>


    <div>
        <div style="float: left">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <img id="headImage" width="200px" height="200px" src="${headImage}"
                         data-headimage='${subject.headImage}'>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"><a style="color: red">* </a>专题头图</label>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="test1">
                        <i class="layui-icon">&#xe67c;</i>上传图片
                    </button>
                </div>
            </div>
        </div>

        <div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <img id="themeImage" width="200px" height="200px" src="${themeImage}"
                         data-themeimage='${subject.themeImage}'>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"><a style="color: red">* </a>主题图</label>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="test2">
                        <i class="layui-icon">&#xe67c;</i>上传图片
                    </button>
                </div>
            </div>

        </div>


    </div>


    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red">* </a>文章标题</label>
        <div class="layui-input-block">
            <input type="text" name="title" required lay-verify="required" value="${subject.title}" autocomplete="off"
                   placeholder="文章模块标题"  class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label"><a style="color: red">* </a>新闻报道</label>
        <div class="layui-input-block">
            <select lay-ignore style="width: 100%;border-color: #1AA094;margin-left: 20px" class="news-multiple"
                    name="newsList" required lay-verify="required"
                    multiple="multiple">

                <#list news as item>
                    <option value="${item.id}"
                            <#list subject.newsList as orgitem>
                                <#if (item.id == orgitem.id)>selected</#if>
                            </#list>
                    >
                        ${item.title}
                    </option>
                </#list>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">合作方</label>
        <div class="layui-input-block">
            <select lay-ignore style="width: 100%;border-color: #1AA094" class="partner-multiple"
                    name="partners"
                    multiple="multiple">

                <#list partners as item>
                    <option value="${item.id}"
                            <#list subject.partnerList  as orgitem>
                                <#if (item.id == orgitem.id)>selected</#if>
                            </#list>
                    >
                        ${item.name}
                    </option>
                </#list>
            </select>
        </div>

    </div>


    <#--图库-->
    <div class="layui-form-item">
        <label class="layui-form-label">图库</label>
        <div class="content layui-input-block">
            <#list imagegroups as item>
                <div style="border: 1px #000000">
                    <img class="imagegroup" id="${item.id}" style="height: 70px;width: 70px;margin: 10px"
                         src="${base}/static/images/imagegroup.jpg" class="imageitem">
                    <p>${item.name}</p>
                </div>
            </#list>
        </div>
    </div>

    <#--点击图库的图片-->
    <div id="imagecontent" class="content">
        <div style="margin-top: 25px">

        </div>
    </div>


    <#--被克隆的图片模板-->
    <div id="imgdiv" style="margin-top: 25px;display: none">
        <img style="height: 150px;width: 150px" class="imageitem">
    </div>


    <div style="margin-left: 20px;margin-top: 10px;border: 2px solid #999999">
        <a class="title">具有图片</a>
        <div id="allimg" class="content" style="margin-top: 25px">
            <#list subject.newsImageList as img>
                <div class="iosclone">
                    <img id="${img.id}" style="height: 150px;width: 150px;display: block" src="${img.url}"
                         class="imageitem">
                    <p id="del" class="layui-btn layui-btn-primary layui-btn-sm del"
                       style="font-size: 12px; align-self: center;text-align: center;cursor:pointer;"><i
                                class="layui-icon"></i>
                    </p>
                </div>

            </#list>
        </div>
    </div>


    <div id="iosclone" class="iosclone" style="display: none">
        <img style="height: 150px;width: 150px" src="${img.url}" class="imageitem">
        <a id="del" class="layui-btn layui-btn-primary layui-btn-sm del"
           style="font-size: 12px; align-self: center;text-align: center;cursor:pointer;"><i
                    class="layui-icon"></i>
        </a>
    </div>


    <div class="layui-form-item layui-col-space15" pane>
        <div class="layui-input-block">

            <input type="radio" name="status" value="1" <#if subject.status==1>checked </#if>
                   title="发布">
            <input type="radio" name="status" value="2" <#if subject.status==2>checked </#if>
                   title="保存草稿"/>
            <input type="radio" name="status" value="0" <#if subject.status==0>checked </#if>
                   title="下架"/>
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
    layui.use(['form', 'jquery', 'layer', 'upload'], function () {
        var form = layui.form,
            $ = layui.jquery,
            upload = layui.upload,
            layer = layui.layer;
        $(function () {
            $(".news-multiple").select2({
                placeholder: "选择新闻"
            });
            $(".partner-multiple").select2({
                placeholder: "选择合作方"
            });
            console.log("初始化")

            $('.iosclone').on("click", "#del", function () {

                var child = $(this).parent().children();
                if (child.length > 0) {
                    $(this).parent().remove();
                }
            });

        });

        upload.render({
            elem: '#test1' //绑定元素
            , url: "${uploadUrl}" //上传接口
            , multiple: true
            , field: 'files'
            , done: function (res) {
                $("#headImage").attr('src', res.data[0].url);
                $("#headImage").attr('data-headimage', JSON.stringify(res.data));

                //上传完毕回调
            }
            , error: function () {
                layer.msg("上传失败");
                layer.msg(uploadUrl);

                //请求异常回调
            }
        });


        $(".imagegroup").click(function () {
            var id = $(this).attr("id");

            console.log("清楚")
            $.ajax({
                type: "POST",
                url: "${base}/image/group",
                contentType: "application/json; charset=utf-8",
                data: id,
                dataType: "json",
                success: function (res) {
                    console.log(res.length);
                    $("#imagecontent").empty();
                    for (let i = 0; i < res.length; i++) {

                        var imgdiv = $("#imgdiv").clone(true);

                        $(imgdiv).removeAttr("id");

                        $(imgdiv).css('display', 'block');

                        var img = $(imgdiv).children('img');

                        $(img).attr('src', res[i].url);

                        $(imgdiv).on("click", function () {
                            var imgclone = $("#iosclone").clone(true);
                            $(imgclone).removeAttr("id");
                            $(imgclone).css('display', 'block');
                            var img = $(imgclone).find('img');
                            $(img).attr("id", res[i].id);
                            $(img).attr('src', res[i].url);


                            console.log("克隆的元素个数" + imgclone.length)


                            $(imgclone).on("click", "#del", function () {

                                var child = $(this).parent().children();
                                if (child.length > 0) {
                                    $(this).parent().remove();
                                }
                            });

                            $("#allimg").append(imgclone);
                        });


                        $('#imagecontent').append(imgdiv)
                    }
                },
                error: function (jqXHR) {

                    alert("发生错误：" + jqXHR.status);
                }
            });
        });


        upload.render({
            elem: '#test2' //绑定元素
            , url: "${uploadUrl}" //上传接口
            , multiple: true
            , field: 'files'
            , done: function (res) {
                $("#themeImage").attr('src', res.data[0].url);
                $("#themeImage").attr('data-themeimage', JSON.stringify(res.data));
                //上传完毕回调
            }
            , error: function () {
                layer.msg("上传失败");
                layer.msg(uploadUrl);
            }
        });


        form.on('submit(savenews)', function (data) {


            var news = $('.news-multiple').val();
            data.field.newsList = news;
            var partners = $('.partner-multiple').val();
            data.field.partnerList = partners;

            var imgs = $('#allimg').find('img');
            var json = [];
            for (let i = 0; i < imgs.length; i++) {
                var img = imgs[i];
                var id = $(img).attr("id");
                json[i] = id;
            }
            data.field.newsImageList = json;

            var head = $('#headImage').attr("data-headimage");
            console.log(head);

            if(head==null||head==''){

                layer.msg("请选择头图！", {time: 1000}, function () {

                });
                return false;
            }

            var theme = $('#themeImage').attr("data-themeimage");
            console.log(theme);

            if(theme==null||theme==''){
                layer.msg("请选择主题图！", {time: 1000}, function () {

                });
                return false;
            }

            data.field.headImage = head;

            data.field.themeImage = theme;
            var status = $('input:radio:checked').val();
            if (status == 2) {  /*保存草稿*/
                data.field.status = 2;
            } else if (status == 1) {  /*发布*/
                data.field.status = 1;
            } else if (status == 0) { /*下架*/
                data.field.status = 0;
            }
            console.log(data.field);
            $.ajax({
                type: "POST",
                url: "${base}/subject/save",
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