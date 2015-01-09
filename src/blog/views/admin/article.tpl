<!DOCTYPE HTML>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <title>Pulish article</title>

    <link rel="stylesheet" href="/static/css/admin/admin.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="/static/css/admin/bootstrap.min.css" type="text/css" media="screen" />
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="/static/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/static/ueditor/ueditor.all.min.js"></script>
</head>

<body>
    <div class="div_from_aoto">
        <FORM action="/admin/article/{{.opt}}" method="POST">
            <DIV class="control-group">
                <label class="laber_from"> 标 题 </label>
                <DIV  class="controls" >
                    <INPUT class="input_from" name="rtitle"  value="{{.a.Title}}" type="text" placeholder=" 请输入">
                    <P class=help-block></P>
                </DIV>
            </DIV>
            <DIV class="control-group">
                <LABEL class="laber_from">URL名</LABEL>
                <DIV class="controls" >
                    <INPUT class="input_from" value="{{.a.Url}}" name="url" type=text placeholder=" 请输入">
                    <P class=help-block></P></DIV>
            </DIV>
            <DIV class="control-group">
                <LABEL class="laber_from" > 标 签 </LABEL>
                <DIV  class="controls" ><INPUT class="input_from" value="{{.a.Tags}}" name="tags" type=text placeholder=" 请输入"><P class=help-block></P></DIV>
            </DIV>
            <DIV class="control-group">
                    <!-- 加载编辑器的容器 -->
                    <textarea id="container" name="content">{{.a.Content}}</textarea>
                    <!-- 实例化编辑器 -->
                    <script type="text/javascript">
                        var ue = UE.getEditor('container', {
                            toolbars: [
                                ['fullscreen', 
                                'source', 
                                'undo', 'redo',
                                'bold', 'italic', 'underline', 
                                'fontborder', 
                                'strikethrough', 
                                'superscript', 
                                'subscript',
                                'cleardoc',
                                'removeformat', 
                                'formatmatch', 
                                'autotypeset', 
                                'blockquote', 
                                'pasteplain', '|', 
                                'forecolor', 
                                'backcolor', 
                                'insertorderedlist', 
                                'insertunorderedlist', 
                                'insertcode', //代码语言
                                'simpleupload',
                                'insertimage', 
                                'inserttable', //插入表格
                                'edittable', 
                                'edittd','selectall',]
                            ],
                            autoHeightEnabled: true,
                            autoFloatEnabled: true
                        });
                    </script>
            </DIV>

            <DIV class="control-group">
                <LABEL class="laber_from"></LABEL>
            </DIV>
            <DIV class="control-group">
                <LABEL class="laber_from" >
                <DIV  class="controls">
                </DIV> </LABEL>
                <DIV class="controls">            
                        <select id="category" name="category" class="input_select">
                            <option value="0" selected="true">原创</option>
                            <option value="1">转载</option>
                        </select>            
                        <select id="status" name="status" class="input_select" style="margin-left:30px">
                            <option value="0">正式发布</option>
                            <option value="1">暂存为草稿</option>
                        </select>
                    <input type="submit" class="btn btn-success" style="width:120px;float:right; margin-right:50px" value="Submit">
            </DIV>
        </FORM>
    </div>
</body>
</html>