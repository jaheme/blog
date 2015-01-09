<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台模板</title>

<link rel="stylesheet" href="/static/css/admin/admin.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/static/css/admin/bootstrap.min.css" type="text/css" media="screen" />

</head>
<body>
<div class="div_from_aoto" style="width: 500px;">
    <FORM action="/reg" method="POST">
        <DIV class="control-group">
            <label class="laber_from">用户名</label>
            <DIV  class="controls" >
                <INPUT class="input_from" name="uname" type="text" placeholder=" 请输入用户名">
                <P class=help-block></P></DIV>
        </DIV>
        <DIV class="control-group">
            <LABEL class="laber_from">密码</LABEL>
            <DIV  class="controls" >
                <INPUT class="input_from" name="passw" type="text" placeholder=" 请输入密码">
                <P class=help-block></P>
            </DIV>
        </DIV>
        <DIV class="control-group">
            <LABEL class="laber_from" >确认密码</LABEL>
            <DIV  class="controls" >
                <INPUT class="input_from" name="passw2" type="text" placeholder=" 请输入密码">
                <P class=help-block></P>
            </DIV>
        </DIV>
        <DIV class="control-group">
            <LABEL class="laber_from" >E-mail</LABEL>
            <DIV  class="controls" >
                <INPUT class="input_from" name="uemail" type="text" placeholder="">
                <P class=help-block></P>
            </DIV>
        </DIV>
        <DIV class="control-group">
            <LABEL class="laber_from" ></LABEL>
            <DIV class="controls" ><button class="btn btn-success" style="width:120px;" >确认</button></DIV>
        </DIV>
    </FORM>
</div>
</body>
</html>
