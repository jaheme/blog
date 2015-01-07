<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title></title>

    <link rel="stylesheet" href="/static/css/admin/bootstrap.min.css" type="text/css" media="screen" />

<body> 
    <table class="table table-hover">
        <thead>       
            <th>标题</th>
            <th>URL</th>
            <th>标签</th>
            <th>类型</th>
            <th>状态</th>
            <th>发布时间</th>
            <th>操作</th>
        </thead>
        {{range $key, $val := .as}}
        <tr>
            <td><a href="/admin/article/toedit/{{$val.Id}}">{{$val.Title}}</a></td> 
            <td>{{$val.Url}}</td>
            <td>{{$val.Tags}}</td>
            <td>{{ if eq $val.Category 0}} 原创 {{else}} 转载 {{end}}</td>
            <td>{{ if eq $val.Status 0}} 发布中 {{else}} 草稿 {{end}}
            </td>
            <td> {{dateformat $val.Create_time "2006-01-02 15:04:05"}}</td>
            <td>
                {{ if eq $val.Status 0}}
                <a href="/admin/article/opt?type=draft&id={{$val.Id}}">存为草稿</a>&nbsp;&nbsp;&nbsp;
                {{else}}
                <a href="/admin/article/opt?type=pub&id={{$val.Id}}">发布</a>&nbsp;&nbsp;&nbsp;
                 {{end}}
                <a href="/admin/article/opt?type=del&id={{$val.Id}}">删除</a>
            </td> 
        </tr>
        {{end}}
    </table>
</body>
</html>