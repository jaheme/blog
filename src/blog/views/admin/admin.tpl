<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jahe.me管理后台</title>

<link rel="stylesheet" href="../static/css/admin/index.css" type="text/css" media="screen" />

<script type="text/javascript" src="../static/js/jquery.min.js"></script>
<script type="text/javascript" src="../static/js/admin/tendina.min.js"></script>
<script type="text/javascript" src="../static/js/admin/common.js"></script>

</head>
<body>
    <!--顶部-->
    <div class="layout_top_header">
            <div style="float: left"><span style="font-size: 16px;line-height: 45px;padding-left: 20px;color: #8d8d8d">jahe.me管理后台</h1></span></div>
            <div class="ad_setting">       
                <a class="ad_setting_a" href="/">
                    <i class="icon-home glyph-icon" style="font-size: 20px"></i>
                    <span>BLOG</span>
                </a>
            </div>
            <div id="ad_setting" class="ad_setting">
                <a class="ad_setting_a" href="javascript:; ">
                    <i class="icon-user glyph-icon" style="font-size: 20px"></i>
                    <span>{{.user.Uname}}</span>
                    <i class="icon-chevron-down glyph-icon"></i>
                </a>
                <ul class="dropdown-menu-uu" style="display: none" id="ad_setting_ul">
                    <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-user glyph-icon"></i> 个人中心 </a> </li>
                    <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-cog glyph-icon"></i> 设置 </a> </li>
                    <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-signout glyph-icon"></i> <span class="font-bold">退出</span> </a> </li>
                </ul>
            </div>
    </div>
    <!--顶部结束-->
    <!--菜单-->
    <div class="layout_left_menu">
        <ul id="menu">
            <li class="childUlLi">
                <a href=""  target="menuFrame"> <i class="glyph-icon icon-reorder"></i>成员管理</a>
                <ul>
                    <li><a href="/admin/user/add" target="menuFrame">
                        <i class="glyph-icon icon-chevron-right"></i>用户添加</a>
                    </li>
                    <li><a href="/admin/user/list" target="menuFrame">
                        <i class="glyph-icon icon-chevron-right"></i>用户列表</a>
                    </li>
                </ul>
            </li>
            <li class="childUlLi">
                <a href="role.html" target="menuFrame"> <i class="glyph-icon icon-reorder"></i>文章管理</a>
                <ul>
                    <li>
                        <a href="/admin/article/new" target="menuFrame">
                            <i class="glyph-icon icon-chevron-right"></i>发布文章
                        </a>
                    </li>
                    <li><a href="/admin/article/list" target="menuFrame">
                            <i class="glyph-icon icon-chevron-right"></i>文章列表
                        </a>
                    </li>
                </ul>
            </li> <!-- end menu item -->
            <li class="childUlLi">
                <a href="role.html" target="menuFrame"> <i class="glyph-icon icon-reorder"></i>留言</a>
                <ul>
                    <li>
                        <a href="/msg/list" target="menuFrame">
                            <i class="glyph-icon icon-chevron-right"></i>留言
                        </a>
                    </li>
                </ul>
            </li> <!-- end message item -->
        </ul>
    </div>
    <!--菜单-->
    <div id="layout_right_content" class="layout_right_content">

        <div class="route_bg">
            <a href="#">主页</a><i class="glyph-icon icon-chevron-right"></i>
            <a href="#">菜单管理</a>
        </div>
        <div class="mian_content">
            <div id="page_content">
                <iframe id="menuFrame" name="menuFrame" src="/admin/article/new" style="overflow:visible;"
                        scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
            </div>
        </div>
    </div>
    <div class="layout_footer">
        <p>Copyright © 2015 - jaheme</p>
    </div>
</body>
</html>
