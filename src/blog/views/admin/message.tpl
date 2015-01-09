<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>user Message</title>

    <link rel="stylesheet" href="/static/css/admin/bootstrap.min.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="/static/css/admin/admin.css" type="text/css" media="screen" />

</head>
<body> 
    <table class="table table-hover">
        <thead>
            <th>ID</th>
            <th>用户名</th>
            <th>E-mail</th>
            <th>Phone</th>
            <th>创建时间</th>
            <th>管理</th>
        </thead>
        {{range $key, $val := .ms}}
        <tr>
            <td>{{$val.Id}}</a></td> 
            <td>{{$val.Uname}}</td>
            <td>{{$val.Email}}</td>
            <td>{{$val.Phone}}</td>
            <td> {{dateformat $val.CreateTime "2006-01-02 15:04:05"}}</td>
            <td></td>
        </tr>
        <tr><td>留言</td><td colspan="5">{{$val.Message}}</td></tr>
        {{end}}
    </table>
</body>
</html>