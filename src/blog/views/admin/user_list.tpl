<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>user list manager</title>

    <link rel="stylesheet" href="/static/css/admin/bootstrap.min.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="/static/css/admin/admin.css" type="text/css" media="screen" />

</head>
<body> 
    <table class="table table-hover">
        <thead>     
            <th>ID</th>
            <th>用户名</th>
            <th>E-mail</th>
            <th>创建时间</th>
            <th>是否管理</th>
            <th>是否锁定</th>
            <th>管理</th>
        </thead>
        {{range $key, $val := .us}}
        <tr>
            <td>{{$val.Id}}</a></td> 
            <td>{{$val.Uname}}</td>
            <td>{{$val.Uemail}}</td>
            <td> {{dateformat $val.CreateTime "2006-01-02 15:04:05"}}</td>
            <td>{{ if eq $val.IsAdmin false}} 普通 {{else}} 管理 {{end}}</td>
            <td>{{ if eq $val.IsLock false}} 正常 {{else}} 已锁定 {{end}}</td>
            <td>
                {{ if eq $val.IsAdmin false}}
                <a href="/admin/user/opt?type=admin&id={{$val.Id}}">转为管理</a>&nbsp;&nbsp;&nbsp;
                {{else}}
                <a href="/admin/user/opt?type=normal&id={{$val.Id}}">转为普通</a>&nbsp;&nbsp;&nbsp;
                 {{end}}
                {{ if eq $val.IsLock false}}
                <a href="/admin/user/opt?type=lock&id={{$val.Id}}">锁定</a>&nbsp;&nbsp;&nbsp;
                {{else}}
                <a href="/admin/user/opt?type=unlock&id={{$val.Id}}">解锁</a>
                {{end}}
            </td> 
        </tr>
        {{end}}
    </table>
</body>
</html>